

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CONCORRENCIA\Concorrencia_fechado_aberto_lote"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Conc_fechado_aberto_lote_01_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Concorrencia/Fechado_Aberto_Lote/Conc_fechado_aberto_lote_01 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
