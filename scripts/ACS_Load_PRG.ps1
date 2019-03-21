param([string]$ip="10.0.0.100")
$file=$args[0]

$Ch = New-Object -ComObject SpiiPlusCOM660.Channel
$Ch.OpenCommEthernetTCP($ip, $Ch.ACSC_SOCKET_STREAM_PORT)
$Ch.Transaction("##SR")
$Ch.LoadBuffersFromFile($file)
$Ch.CompileBuffer($Ch.ACSC_NONE)
for ($i=0; $i -le 100; $i++) {
    try{
        $Ch.RunBuffer($i, "AUTOEXEC")
    } catch {}
}
$Ch.CloseComm()
