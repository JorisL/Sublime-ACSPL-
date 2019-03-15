param([string]$ip="10.0.0.100")
$file=$args[0]

$file
$ip

$Ch = New-Object -ComObject SpiiPlusCOM660.Channel
$Ch.OpenCommEthernetTCP($ip, $Ch.ACSC_SOCKET_STREAM_PORT)
# $Ch.StopBuffer($Ch.ACSC_NONE)
$Ch.Transaction("##SR")
$Ch.LoadBuffersFromFile($file)
$Ch.CompileBuffer($Ch.ACSC_NONE)
$Ch.CloseComm()
