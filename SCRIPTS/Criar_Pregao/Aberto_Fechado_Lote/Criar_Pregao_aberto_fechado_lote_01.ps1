

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_fechado_lote"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_A_F_lote_01_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Aberto_Fechado_Lote/Pregao_Aberto_Fechado_Lote_01 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
