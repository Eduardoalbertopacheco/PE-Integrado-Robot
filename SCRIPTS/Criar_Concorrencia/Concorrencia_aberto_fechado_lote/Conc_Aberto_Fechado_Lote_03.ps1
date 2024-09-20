

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CONCORRENCIA\Concorrencia_aberto_fechado_lote"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Conc_aberto_fechado_lote_03.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Concorrencia/Aberto_Fechado_Lote/Conc_aberto_fechado_Lote_03 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
