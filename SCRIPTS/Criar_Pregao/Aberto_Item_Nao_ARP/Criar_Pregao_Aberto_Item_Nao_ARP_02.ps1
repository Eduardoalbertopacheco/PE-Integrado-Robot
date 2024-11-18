

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_Item_Nao_ARP"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_aberto_item_02_Nao_ARP.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Aberto_Item/Pregao_Aberto_Item_02_Nao_ARP $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}