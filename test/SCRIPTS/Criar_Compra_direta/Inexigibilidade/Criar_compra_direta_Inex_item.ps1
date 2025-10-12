

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_COMPRAS_DIRETAS\Inexgibilidade"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Compra_direta_inex_item_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Compras_Diretas/Compra_inex_item $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}