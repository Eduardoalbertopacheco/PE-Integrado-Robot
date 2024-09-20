

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\ARP\ATA_OPD\Criar_ata_OPD"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Criar_ata_opd_compra_item.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/ATA_OPD/Criar_ata_opd_compra_item $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}