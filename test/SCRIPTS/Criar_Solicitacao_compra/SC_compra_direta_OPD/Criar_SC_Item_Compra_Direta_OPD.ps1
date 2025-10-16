

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_compra_direta_OPD"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "SC_Item_Compra_Disp_OPD_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Solicitacao_Compra/SC_Item_Compra_Disp_OPD $testFilePath
}

