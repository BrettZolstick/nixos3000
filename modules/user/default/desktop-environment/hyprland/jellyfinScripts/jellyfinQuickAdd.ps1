param (
    [Switch]$AddToFavorites,
    [String]$AddToPlaylist,
    [String]$RemoveFromPlaylist
)

$Global:JellyfinUrl = "http://35.140.104.84:8096"
$Global:JellyfinUserID = "3bf0992a73f24b619637b4ba62503439" # can be found in the url if you go to jellyfin > settings > profile
$Global:JellyfinToken = Get-Content -LiteralPath "${HOME}/.config/jellyfin/api-key"
$Global:CurrentDeviceIP = (ip -json route get 1.1.1.1 | ConvertFrom-Json).prefsrc
$Global:Headers = @{Authorization = 'MediaBrowser Token="' + $Global:JellyfinToken + '"'}

function GetAlbumArtURL {
    $ArtURL = & playerctl metadata mpris:artUrl
    Return $ArtURL
}

function SendNotification {
    param(
        [Parameter(Mandatory = $true)]
        [String]$Message    
    )

    & notify-send `
        "--hint=string:image-path:$(GetAlbumArtURL)"`
        "`n Jellyfin"`
        "$Message"
}

function GetNowPlayingItem {

    $AllSessions = Invoke-RestMethod `
        -Method Get `
        -Uri "${Global:JellyfinUrl}/Sessions?activeWithinSeconds=30" `
        -Headers $Global:Headers

    $CurrentSession = $AllSessions | Where-Object {
        $_.UserId -eq $Global:JellyfinUserID -and
        $_.NowPlayingItem.MediaType -eq 'Audio' -and
        # $_.RemoteEndPoint -eq $Global:CurrentDeviceIP -and # disabled ip check when I switched to WAN
        -not $_.PlayState.IsPaused
    } | Select-Object -First 1

    if ($null -eq $CurrentSession) {
        SendNotification "No track currently playing"
        # & notify-send "Jellyfin" "No track currently playing"
        exit
    }

    $NowPlayingItem = $CurrentSession.NowPlayingItem
    return $NowPlayingItem
}

function AddToFavorites {
    param(
        [Parameter(Mandatory = $true)]
        [PSObject]$Item
    )

    try {
        Invoke-RestMethod `
            -Method Post `
            -Uri "${Global:JellyfinUrl}/UserFavoriteItems/$($Item.Id)?userID=${Global:JellyfinUserID}" `
            -Headers $Global:Headers
    
        SendNotification -Message "Added to Favorites:`n  Artist:`t$($Item.AlbumArtist)`n  Track:`t$($Item.Name)`n"
    } catch {
        & notify-send "Jellyfin" "Error adding to favorites: $_"
        exit
    }
 
}

function CreatePlaylist {
    param(
        [Parameter(Mandatory = $true)]
        [String]$PlaylistName
    )

    $Body = @{
        Name = $PlaylistName
        Ids = @()
        UserId = $Global:JellyfinUserID
        MediaType = "Audio"
        Users = @()
        IsPublic = $false
    } | ConvertTo-Json
    
    try {
        Invoke-RestMethod `
            -Method Post `
            -Uri "${Global:JellyfinUrl}/Playlists" `
            -Headers $Global:Headers `
            -ContentType "application/json" `
            -Body $Body

        SendNotification -Message "Playlist Created: $PlaylistName"
    } catch {
        SendNotification -Mesage "Error creating playlist - $PlaylistName : $_"
        exit
    }
}

function GetPlaylists {
    $Playlists = Invoke-RestMethod `
        -Method Get `
        -Uri "${Global:JellyfinUrl}/Users/${Global:JellyfinUserID}/Items?Recursive=true&IncludeItemTypes=Playlist"`
        -Headers $Global:Headers
        
    Return $Playlists.items   
}

function AddToPlaylist {
    param(
        [Parameter(Mandatory = $true)]
        [PSObject]$Item,
        [String]$PlaylistName
    )

    # Get current playlists
    $Playlists = GetPlaylists

    # If playlist doesn't exist already, create it, then call the function again
    if ($Playlists.Name -notcontains $PlaylistName) {
        CreatePlaylist -PlaylistName $PlaylistName
        AddToPlaylist -PlaylistName $PlaylistName -Item $Item
        return
    }

    # Add to playlist
    $PlaylistID = ($Playlists | Where-Object Name -like $PlaylistName).Id
    $ItemID = $Item.Id
    try {
        Invoke-RestMethod `
            -Method Post `
            -Uri "${Global:JellyfinUrl}/Playlists/${PlaylistID}/Items?ids=${ItemID}&userID=${Global:JellyfinUserID}"`
            -Headers $Global:Headers
            
        SendNotification -Message "Added to the ${PlaylistName} playlist:`n  Artist:`t$($Item.AlbumArtist)`n  Track:`t$($Item.Name)`n"
    } catch { 
        SendNotifcation -Message "Error adding to playlist: $_"
    }    
}

function RemoveFromPlaylist {
    param(
        [Parameter(Mandatory = $true)]
        [PSObject]$Item,
        [String]$PlaylistName
    )

    # Get current playlists
    $Playlists = GetPlaylists

    # If playlist doesn't exist already, create it, then call the function again
    if ($Playlists.Name -notcontains $PlaylistName) {
        CreatePlaylist -PlaylistName $PlaylistName
        RemoveFromPlaylist -PlaylistName $PlaylistName -Item $Item
        return
    }

    # Get the contents of the playlist
    $PlaylistID = ($Playlists | Where-Object Name -like $PlaylistName).Id
    $ItemID = $Item.Id
    $PlaylistItems = Invoke-RestMethod `
        -Method Get `
        -Uri "${Global:JellyfinUrl}/Playlists/${PlaylistID}/Items?userId=${Global:JellyfinUserID}" `
        -Headers $Global:Headers

    # Find the correct playlist entry
    $PlaylistEntry = $PlaylistItems.Items | Where-Object Id -eq $ItemID | Select-Object -First 1
    if ($null -eq $PlaylistEntry){
        SendNotification "`n`tCould not find $($Item.Name) in ${PlaylistName}`n`t$($Item.id)"
        exit
    }
    
    # Remove item from the playlist
    $PlaylistItemID = $PlaylistEntry.PlaylistItemId
    try {
        Invoke-RestMethod `
            -Method Delete `
            -Uri "${Global:JellyfinUrl}/Playlists/${PlaylistID}/Items?entryIds=${PlaylistItemID}&userID={$Global:JellyfinUserID}" `
            -Headers $Global:Headers
            
        SendNotification -Message " Removed from the ${PlaylistName} playlist:`n  Artist:`t$($Item.AlbumArtist)`n  Track:`t$($Item.Name)`n"
    } catch { 
        SendNotifcation -Message "Error removing from playlist: $_"
    }    
}

if ($AddToFavorites -eq $true) {AddToFavorites -Item $(GetNowPlayingItem)}
if ($AddToPlaylist -notlike $null) {AddToPlaylist -PlaylistName $AddToPlaylist -Item $(GetNowPlayingItem)}
if ($RemoveFromPlaylist -notlike $null) {RemoveFromPlaylist -PlaylistName $RemoveFromPlaylist -Item $(GetNowPlayingItem)}
