$ErrorActionPreference = "Inquire"
$PSNativeCommandUseErrorActionPreference = $true;

function ensureInternetConnection {
    if (!(Test-Connection nixos.org -Count 1 -TimeoutSeconds 5)){

        Clear-Host
        Write-Host "The installer requires an internet connection" -ForegroundColor Red
        Write-Host "Please connect via ethernet or enter a new tty and connect to wifi with the following commands" -ForegroundColor Gray
        Write-Host "nmcli device wifi list" -ForegroundColor Green
        Write-Host "nmcli device wifi connect <SSID> password <password>" -ForegroundColor Green

        Start-Sleep -Seconds 2
        ensureInternetConnection
        return
    }
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

    return $selectedDisk    
}


function partitionDisk {
    param(
        [Parameter(Mandatory=$true)]
        $disk
    )

    Write-Host "Partitioning disk $($disk.path) with disko"

    disko `
        --mode destroy,format,mount `
        --flake "github:BrettZolstick/nixos3000#btrfs" `
        --argstr disk $($disk.path) # pass the disk path to my disko nix module
    
}

function generateAgeIdentity {
    if ($null -eq (findmnt --mountpoint /mnt)){
        throw "Filesystem is not mounted"
    }

    $keyDir = "/mnt/var/lib/sops-nix"
    $keyFile = "$keyDir/key.txt"
    
    install -d -m 700 $keyDir
    age-keygen -o $keyFile

    $publicKey = age-keygen -y $keyFile

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

    Write-Host "Authenticate this new identity first, then press enter to continue: " -NoNewline -ForegroundColor Yellow
    Read-Host

}

function installNixOS {

    # Generate hardware-configuration.nix onto the target system and copy it to the live environment so the flake can be built
    Write-Host "Generating hardware-configuration.nix" -ForegroundColor Gray
    New-Item -Path "/mnt/etc/nixos" -ItemType Directory -Force | Out-Null
    nixos-generate-config --root /mnt --dir "/mnt/etc/nixos"
    Copy-Item -Path "/mnt/etc/nixos/hardware-configuration.nix" -Destination "/etc/nixos/hardware-configuration.nix" -Force

    # Install NixOS
    Write-Host "Installing NixOS" -ForegroundColor Gray
    nixos-install --flake "github:BrettZolstick/nixos3000#generic" --impure

    Write-Host "Reboot to enter NixOS"
    
}

ensureInternetConnection
partitionDisk -disk $(selectDisk)
generateAgeIdentity
installNixOS
