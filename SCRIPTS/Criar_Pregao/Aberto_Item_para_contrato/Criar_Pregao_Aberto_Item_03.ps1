

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_item_para_contrato"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_aberto_item_03.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    pabot --exitonfailure --outputdir ./Relatorio/Pregao/Aberto_Item/Pregao_Aberto_Item_03 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}