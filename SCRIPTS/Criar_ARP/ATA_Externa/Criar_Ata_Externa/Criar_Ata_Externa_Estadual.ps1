

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_ARP\ATA_Externa\Criar_ata_externa"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Ata_Estadual_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/ARP/Ata_Externa/Ata_Externa_Estadual $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
