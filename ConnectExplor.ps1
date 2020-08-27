$net = netstat -aon | Select-String -Pattern “(TCP|UDP)”
$ps = Get-Process
foreach ($line in $net)
{
$sl = $line -split ” “
$pd = $sl[$sl.length – 1]
$pn = $ps | Where-Object {$_.id -eq $pd } | select processname
$sl[$sl.length – 1] = $pd + ” “ + $pn.processname
$sl -join ” “
}
