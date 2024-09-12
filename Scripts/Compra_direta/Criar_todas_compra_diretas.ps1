
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\COMPRA_DIRETA"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em SC_pregao_OPD: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        Write-Host "Executando teste: $($testFile.FullName)"
        robot --exitonfailure -d ./logs $testFile.FullName
    }
} else {
    Write-Host "O caminho das pastas não existe: $foldersPath"
}