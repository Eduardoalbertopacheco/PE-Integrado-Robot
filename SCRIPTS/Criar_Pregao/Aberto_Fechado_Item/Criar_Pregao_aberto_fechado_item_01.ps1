

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_fechado_item"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_A_F_item_01_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Aberto_Fechado_Item/Pregao_Aberto_Fechado_item_01 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
