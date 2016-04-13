Add-PSSnapin Vmware.VimAutomation.Core
$adminpasswd = Read-Host -Prompt 'Input your teame passwd'
Connect-VIServer -Server vc.teame.witcsn.net -Protocol https -User 'Administrator@vsphere.local' -Password $adminpasswd


$vm =  @('TestDos', 'powercli', 'h2.teame.witcsn.net', 'datastore1')
$Template = Get-Template $vm[1]
$VMHost = Get-VMHost $vm[2]
$Datastore = Get-Datastore $vm[3]
$NewName = $vm[0]
New-VM -Name $vm[0] -Template $Template -VMHost $VMHost -Datastore $Datastore -RunAsync
