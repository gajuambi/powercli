﻿#start of function
function SetDNS 
{
<#
.SYNOPSIS
    Update DNS
.DESCRIPTION
    This will update the DNS, domain and searchdomain for the esxi hosts.
.NOTES
    File Name      : SetDNS.ps1
    Author         : gajendra d ambi
    Date           : March 2016
    Prerequisite   : PowerShell v4+, powercli 6+ over win7 and upper.
    Copyright      - None
.LINK
    Script posted over: github.com/gajuambi/vmware
#>
#Start of script#
$cluster = Read-Host "name of the cluster[type * to include all clusters]?"
$dnsadd  = Read-Host "DNS Addresses(separate multiple entries with a comma)?"
$dnsadd  = $dnsadd.split(',')
$domain  = Read-Host "domain name?"

get-cluster $cluster | get-vmhost | Get-VMHostNetwork | Set-VMHostNetwork -DnsAddress $dnsadd -DomainName $domain -SearchDomain $domain -Confirm:$false

 #End of Script#
}#End of function