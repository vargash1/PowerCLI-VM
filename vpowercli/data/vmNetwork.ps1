Add-PSSnapin Vmware.VimAutomation.Core
$adminpasswd = Read-Host -Prompt 'Input your teame server passwd'
Connect-VIServer -Server vc.teame.witcsn.net -Protocol https -User 'Administrator@vsphere.local' -Password $adminpasswd

$vmname = Read-Host -Prompt 'Input the new vm name that you wish to spawn'
$hostname = Read-Host -Prompt 'Enter the host(h2,h3,h4)'
$datastorename = Read-Host -Prompt 'Enter the datastore to use'

$newip = Read-Host -Prompt 'Input new ip for vm'
$newnetmask = '255.255.255.240'
$newgateway = '69.43.73.209'
$ndns = '69.43.73.211'

$specName = "tempSpec" + (Get-Random)
Get-OSCustomizationSpec -Name "Window"| New-OSCustomizationSpec -Name $specName -Type NonPersistent

Get-OSCustomizationSpec -Name $specName | Get-OSCustomizationNicMapping | Set-OSCustomizationNicMapping `
-IpMode UseStaticIP -IpAddress $newip -SubnetMask $newnetmask -DefaultGateway $newgateway -Dns $ndns

$tempSpec = Get-OSCustomizationSpec -Name $specName

$vmhost = (Get-Cluster | Get-VMHost | Sort-Object -Property MemoryUsageGB | Select-Object -First 1)

#Create the `VM
New-VM -Name $vmname -template $template -OsCustomizationSpec $tempSpec -VMHost $hostname -Confirm:$true

#Cleanup the temporary Spec. System will do this outside of the session, but this will allow the scripts to be reused within a session.
Remove-OSCustomizationSpec -Confirm:$false -customizationSpec (Get-OSCustomizationSpec -name $specName)
