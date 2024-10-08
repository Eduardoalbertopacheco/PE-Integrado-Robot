

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_pregao_OPD"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em SC_pregao_OPD: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        Write-Host "Executando teste: $($testFile.FullName)"
        robot --exitonfailure -d ./Relatorio/SCs_Pregao_OPD $testFile.FullName
    }
} else {
    Write-Host "O caminho das pastas não existe: $foldersPath"
}

