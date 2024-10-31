
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CONTRATO\Gerar_Contratos"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Contrato_Novo_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Contratos $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}