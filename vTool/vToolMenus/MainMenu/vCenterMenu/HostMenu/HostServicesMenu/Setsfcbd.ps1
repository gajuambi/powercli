﻿#start of function
function Setsfcbd 
{
<#
.SYNOPSIS
    Configure sfcbd-watchdog [CIM Server]
.DESCRIPTION
    Depending upon the choice that you make
    This will enable sfcbd.
    This will disable sfcbd.
    This will set sfcbd policy to On which will be persistent across reboot.
    This will set sfcbd policy to Off which will be persistent across reboot.
.NOTES
    File Name      : Setsfcbd.ps1
    Author         : gajendra d ambi
    Date           : March 2016
    Prerequisite   : PowerShell v4+, powercli 6+ over win7 and upper.
    Copyright      - None
.LINK
    Script posted over: github.com/gajuambi/vmware
#>
#Start of script#
$cluster = Read-Host "name of the cluster[type * to include all clusters]?"
Write-Host "sfcbd-watchdog [CIM Server] options
     1. Enable sfcbd
     2. Disable sfcbd
     3. sfcbd Policy On
     4. sfcbd Policy Off
     " -BackgroundColor White -ForegroundColor Blue #options to choose from
 $a = Read-Host "Choose a number from 1 to 4"
 if ($option -eq 1) {get-cluster $cluster | get-vmhost | get-vmhostservice | where Key -EQ sfcbd | Start-VMHostService}
 if ($option -eq 2) {get-cluster $cluster | get-vmhost | get-vmhostservice | where Key -EQ sfcbd | stop-VMHostService}
 if ($option -eq 3) {get-cluster $cluster | get-vmhost | get-vmhostservice | where Key -EQ sfcbd | Set-VMHostService -Policy On}
 if ($option -eq 4) {get-cluster $cluster | get-vmhost | get-vmhostservice | where Key -EQ sfcbd | Set-VMHostService -Policy Off}
    
 #End of Script#
}#End of function