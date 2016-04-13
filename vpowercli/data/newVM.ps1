Add-PSSnapin Vmware.VimAutomation.Core
$adminpasswd = Read-Host -Prompt 'Input your teame server passwd'
Connect-VIServer -Server vc.teame.witcsn.net -Protocol https -User 'Administrator@vsphere.local' -Password $adminpasswd

$vmname = Read-Host -Prompt 'Input your new vm name'
$hostname = Read-Host -Prompt 'Input hostname'
$datastorename = Read-Host -Prompt 'Input the datastore to use'

New-VM -Name $vmname -Template 'powercli' -VMHost $hostname -Datastore $datastorename -RunAsync
