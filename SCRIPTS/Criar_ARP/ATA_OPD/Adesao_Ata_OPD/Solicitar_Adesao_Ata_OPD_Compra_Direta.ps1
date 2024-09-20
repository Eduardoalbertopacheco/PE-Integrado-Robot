

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\ARP\ATA_OPD\Adesao_ata_OPD"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Solicitar_adesao_ata_opd_pregao.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/ATA_OPD/Adesao_ata_OPD/Solicitar_adesao_ata_opd_pregao $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}