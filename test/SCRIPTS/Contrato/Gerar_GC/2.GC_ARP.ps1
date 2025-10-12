
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_CONTRATO\1_Gerar_GC"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "2.GC_ARP.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Contratos/Gerar_GC $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}