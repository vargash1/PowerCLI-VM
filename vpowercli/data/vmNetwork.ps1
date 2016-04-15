Add-PSSnapin Vmware.VimAutomation.Core
$adminpasswd = Read-Host -Prompt 'Input your teame server passwd'
Connect-VIServer -Server vc.teame.witcsn.net -Protocol https -User 'Administrator@vsphere.local' -Password $adminpasswd

$vmname = Read-Host -Prompt 'Input the new vm name that you wish to spawn'
$hostname = Read-Host -Prompt 'Enter the host(h2,h3,h4)'
$datastorename = Read-Host -Prompt 'Enter the datastore to use'
$vmconfig = Get-VM -Name $vmname

$newip = Read-Host -Prompt 'Input new ip for vm'
$newnetmask = '255.255.255.240'
$newgateway = '69.43.73.209'
$ndns = '69.43.73.211'
$vmnetinterface = Get-VMGuestNetworkInterface -VM $config

Set-OSCustomizationNicMapping -IpMode UseStaticIp -IpAddress $newip -SubnetMask $newnetmask  -DefaultGateway $newgateway -Dns $ndns
New-VM -Name $vmname -Template 'powercli' -VMHost $hostname -Datastore $datastorename -RunAsync
