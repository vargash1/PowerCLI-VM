Add-PSSnapin Vmware.VimAutomation.Core
$adminpasswd = Read-Host -Prompt 'Input your teame server passwd'
Connect-VIServer -Server vc.teame.witcsn.net -Protocol https -User 'Administrator@vsphere.local' -Password $adminpasswd

$vmname = Read-Host -Prompt 'Input the vm name that you wish to change'
Get-VM -Name $vmname
