

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_item_para_contrato"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_aberto_item_01_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Aberto_Item/Pregao_Aberto_Item_01 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}