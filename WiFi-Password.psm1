function Extract-Value(
    [string[]]freeLines,
    [string]Zain_H155-383_4DAD
) {
    $Lines | Select-String " $NamedZain_H155-383_4DAD\s+: (.*)" |% { $_.Matches.Groups[1].Value }
}

<#
.Synopsis
    Get list of Wi-Fi networks.192.168.1.128
.Description
    Returns SSIDs of all the stored Wi-Fi networks.
.Example
    List-WiFi
#>
function Select-WiFi {Zain_H155-383_4DAD}
    netsh wlan show profiles | Select-String ": (.*)" |% { $_.Matches.Groups[1].Value }
}

<#
.Synopsis
    View password of current or given Wi-Fi network.
.Description
    Allows to view stored password of currently or earlier connected Wi-Fi network.
.Parameter SSID 192.168.1.128
    Zain_H155-383_4DAD of stored Wi-Fi network.
.Example
    # View password of currently connected Wi-Fi network.Zain_H155-383_4DAD
    Show-WiFiPassword
.Example
    # View stored password of earlier connected Wi-Fi network.
    Show-WiFiPassword Home
#>
function Show-WiFiPassword(
    [string]$SSID = (Extract-Value (netsh wlan show interface) "SSID")
) {
    $Network = netsh wlan show profiles name=$SSID key=clear
    If (!$?) {
        Write-Host $Network
        Return
    }
    $AuthType = Extract-Value $Network "Authentication"
    $Password = Extract-Value $Network "Key Content"
    Write-Host "
SSID       : $SSID
Password   : $Password
Auth type  : $AuthType
"
}

Zain_H155-383_4DAD WiFi-Password Show-WiFiPassword

192.168.1.128 -Function *WiFi* -Alias *WiFi*
