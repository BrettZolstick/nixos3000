$ErrorActionPreference = "Inquire"
$PSNativeCommandUseErrorActionPreference = $true;

function ensureInternetConnection {
    if (!(Test-Connection nixos.org -Count 1 -TimeoutSeconds 5 -Quiet)){
        nmtui
        ensureInternetConnection
        return
    }

    Clear-Host
}

function selectDisk {
    
    $allDisks = (lsblk -O --json | ConvertFrom-Json ).blockdevices

    $validDisks = $allDisks | Where-Object {                     
        $_.type -eq "disk" -and
        $_.tran -ne "usb" -and 
        $_.rm -eq $false -and  # no removable devices
        $_.ro -eq $false -and  # no read only devices
        $_.hotplug -eq $false  
    }

    Write-Host
    Write-Host
    Write-Host
    
    $validDisks | Select-Object name, size, model, serial | Format-Table | Out-Host

    Write-Host "Select Target Disk - " -ForegroundColor Gray -NoNewline
    Write-Host "All data on the selected disk will be destroyed" -ForegroundColor Red
    Write-Host "Target Disk Name (i.e. sda): " -ForegroundColor Yellow -NoNewline
    $requestedDisk = Read-Host

    if ($requestedDisk -notIn $validDisks.name){
        Write-Host "Disk name $requestedDisk not found, please try again" -ForegroundColor Red
        selectDisk
        return
    }

    $selectedDisk = $validDisks | Where-Object name -eq $requestedDisk

    Clear-Host    
    return $selectedDisk
}

function askForDiskEncryption {

    Write-Host
    Write-Host
    Write-Host

    Write-Host "Would you like to enable encryption on this disk? Y/N " -ForegroundColor Yellow -NoNewline
    $Answer = Read-Host

    switch ($Answer) {
        "y" { Clear-Host ; return $true }
        "n" { Clear-Host ; return $false }
        default {
            Write-Host "Input not accepted, press Enter to try again " -ForegroundColor Red -NoNewline
            Read-Host
            askForDiskEncryption
            Return
        } 
    }
}

 
function partitionDisk {
    param(
        [Parameter(Mandatory=$true)]
        $disk,
        $enableEncryption
    )

    Write-Host
    Write-Host
    Write-Host    

    Write-Host "Partitioning disk $($disk.path) with disko"

    if ($enableEncryption -eq $true) {
        disko `
            --mode destroy,format,mount `
            --flake "github:BrettZolstick/nixos3000#btrfs-luks" `
            --argstr disk $($disk.path) # pass the disk path to my disko nix modulei
        Clear-Host
        return 
    }

    disko `
        --mode destroy,format,mount `
        --flake "github:BrettZolstick/nixos3000#btrfs" `
        --argstr disk $($disk.path) # pass the disk path to my disko nix module

    Clear-Host
}

function generateAgeIdentity {

    if ($null -eq (findmnt --mountpoint /mnt)){
        throw "Filesystem is not mounted"
    }

    $keyDir = "/mnt/var/lib/sops-nix"
    $keyFile = "$keyDir/key.txt"
    
    install --mode 700 --directory $keyDir

    if (!(Test-Path $keyFile)){
        age-keygen -o $keyFile
    }

    $publicKey = age-keygen -y $keyFile

    Write-Host
    Write-Host
    Write-Host
    
    Write-Host "A new age identity has been generated" -ForegroundColor Cyan
    Write-host "You will need to give it access to at least the root password of the host you are building" -ForegroundColor Gray
    Write-Host "Please add the public key to .sops.yaml in the repository, and give it access to any secrets it needs" -ForegroundColor Gray
    Write-Host "Then, from a device that already has access to the needed secrets, run the following from the repo's root dir" -ForegroundColor Gray
    Write-Host "  nix-shell -p sops" -ForegroundColor Green
    Write-Host "  sops updatekeys secrets/*.yaml" -ForegroundColor Green
    Write-Host "Then push to the repo" -ForegroundColor Gray
    Write-Host
    Write-Host "Here is your age public key:" -ForegroundColor Gray
    Write-Host $publicKey -ForegroundColor White
    $publicKey | qrencode -t ANSIUTF8  #output the key as a qr code

    Write-Host "Authenticate this new identity first, then press Enter to continue: " -NoNewline -ForegroundColor Yellow
    Read-Host

    Clear-Host
}

function generateSshKeyPair {

    Write-Host
    Write-Host
    Write-Host
    Write-Host "Generating SSH Key Pair" -ForegroundColor Cyan
    Write-Host "Please enter a name for this new host: " -ForegroundColor Yellow -NoNewline
    $hostName = Read-Host

    $keyDir = "/mnt/etc/ssh/github"
    $keyFile = "$keyDir/id_ed25519"

    install --mode 700 --directory $keyDir --owner=root --group=root

    if (!(Test-Path $keyFile)){
        ssh-keygen -f $keyFile -t ed25519 -C "$hostName github"
    }

    chown root:root $keyFile
    chmod 0600 $keyFile
    chmod 0644 "$keyFile.pub"

    cat "$keyFile.pub" | qrencode -t ANSIUTF8
    Write-Host "Please add this SSH key to github, then press Enter to continue: " -ForegroundColor Yellow -NoNewline
    Read-Host

    Clear-Host
}

function installNixOS {

    # Generate hardware-configuration.nix onto the target system and copy it to the live environment so the flake can be built
    Write-Host "Generating hardware-configuration.nix" -ForegroundColor Gray
    New-Item -Path "/mnt/etc/nixos" -ItemType Directory -Force | Out-Null
    nixos-generate-config --root /mnt --dir "/mnt/etc/nixos"
    Copy-Item -Path "/mnt/etc/nixos/hardware-configuration.nix" -Destination "/etc/nixos/hardware-configuration.nix" -Force

    # Install NixOS
    Write-Host "Installing NixOS" -ForegroundColor Gray
    nixos-install `
        --flake "github:BrettZolstick/nixos3000#generic" `
        --impure `
        --no-root-password `
        --option tarball-ttl 0 #   I was running into where the flake was building without pulling
                               #   the new config from github after I pushed a commit with the
                               #   newly generated age idenity. I would boot into nixos and would
                               #   have no root or user passwords.
                               #
                               #   Setting the tarball-ttl 0 option tells nix to check github for
                               #   an update to the flake instead of using the cached one if its
                               #   been longer than 0 seconds. 


    Write-Host
    Write-Host
    Write-Host
    Write-Host "Reboot to enter NixOS"
    
}

ensureInternetConnection
partitionDisk -disk $(selectDisk)
generateAgeIdentity
generateSshKeyPair
installNixOS
reboot
