

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_SAD_Compra_Dispensa"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "SAD_SC_Item_Compra_Disp_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Solicitacao_Compra/SAD_SC_Item_Compra_Disp $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
