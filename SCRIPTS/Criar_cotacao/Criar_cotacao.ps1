

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\COTACAO"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Nova_cotacao_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Cotacao $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}
