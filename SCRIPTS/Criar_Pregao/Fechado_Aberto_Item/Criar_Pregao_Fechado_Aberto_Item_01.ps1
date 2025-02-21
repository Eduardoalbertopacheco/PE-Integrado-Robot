

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Fechado_aberto_item"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_F_A_item_01_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Fechado_Aberto_Item/Pregao_Fechado_Aberto_item_01 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}