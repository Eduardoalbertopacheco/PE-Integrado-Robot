

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\COMPRA_DIRETA\Inexgibilidade"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Compra_direta_inex_lote_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Compras_Diretas/Compra_inex_lote $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}