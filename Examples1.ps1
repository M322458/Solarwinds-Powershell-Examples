#install the module if you don't have it already
#Install-Module SwisPowerShell
# and use powerorion
# Install-Module PowerOrion

Import-Module PowerOrion #quickly add/remove/get node info
Import-Module SwisPowerShell

$hostname = 'solarwinds.solarwindserver.com'
#setup connection
$swis = Connect-Swis -Hostname $hostname -Trusted

#test connection
Get-SwisData $Swis "SELECT NodeID, Caption, IPAddress FROM Orion.Nodes"


#Add devices
$devices  = @{
    '192.168.1.3' = 'name2'
    '192.168.1.4' = 'name1'
}

New-OrionNode -SwisConnection $swis -ObjectSubType SNMPv2 -IPAddress 192.168.1.2  -Community "test" -Verbose
Get-SwisData $Swis "SELECT NodeID, Caption, IPAddress, Vendor, NodeDescription FROM Orion.Nodes"
