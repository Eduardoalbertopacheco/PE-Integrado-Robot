
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_CONTRATO\1_Gerar_GC"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "1.GC_Nao_ARP_Nao_PE_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Contratos/Gerar_GC $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}