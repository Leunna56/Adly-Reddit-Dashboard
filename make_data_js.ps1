$src = "$PSScriptRoot\data.json"
$dst = "$PSScriptRoot\data.js"
$json = Get-Content $src -Raw -Encoding UTF8
$output = "var EMBEDDED_DATA = " + $json.Trim() + ";"
[System.IO.File]::WriteAllText($dst, $output, [System.Text.Encoding]::UTF8)
$data = $json | ConvertFrom-Json
Write-Host "Done. Rows: $($data.Count), File size: $((Get-Item $dst).Length) bytes"
