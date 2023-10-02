$subnet = "192.168.0"
$startRange = 50
$endRange = 254

$startRange..$endRange | ForEach-Object {
    $ip = "$subnet.$_"
    if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
        Write-Host "$ip is online" -ForegroundColor Green
    } else {
        Write-Host "$ip is offline" -ForegroundColor Red
    }
}