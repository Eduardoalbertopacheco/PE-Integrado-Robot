

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\ARP\ATA_Externa\Adesao_ata_externa"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Nova_adesao_ata_estadual_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/Adesao_Ata_Externa/Solicitar_adesao_ata_Estadual $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
