
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CONTRATO\2_Gerar_Contratos"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Contrato_Legado_PE_Nao_ARP_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Contratos $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}