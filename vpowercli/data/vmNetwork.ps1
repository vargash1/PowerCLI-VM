Add-PSSnapin Vmware.VimAutomation.Core
$adminpasswd = Read-Host -Prompt 'Input your teame server passwd'
Connect-VIServer -Server vc.teame.witcsn.net -Protocol https -User 'Administrator@vsphere.local' -Password $adminpasswd

$vmname = Read-Host -Prompt 'Input the vm name that you wish to change'
$vmconfig = Get-VM -Name $vmname

$newip = Read-Host -Prompt 'Input new ip for vm'
$newnetmask = '255.255.255.240'
$newgateway = '69.43.73.209'
$vmnetinterface = Get-VMGuestNetworkInterface -VM $config

Set-VMGuestNetworkInterface -VMGuestNetworkInterface $vmnetinterface -Netmask $newnetmask -Gateway $newgateway -Ip $newip
