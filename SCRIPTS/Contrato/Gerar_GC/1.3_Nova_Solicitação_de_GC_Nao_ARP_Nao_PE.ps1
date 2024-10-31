
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CONTRATO\Gerar_GC"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "1.3_Nova_Solicitação_de_GC_Nao_ARP_Nao_PE.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Contratos/Gerar_GC $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}