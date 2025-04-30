

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_COMPRAS_DIRETAS\Dispensa - SEDUC"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "SEDUC_Compra_direta_disp_item_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Compras_Diretas/SEDUC_Compra_Dispensa_item $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
