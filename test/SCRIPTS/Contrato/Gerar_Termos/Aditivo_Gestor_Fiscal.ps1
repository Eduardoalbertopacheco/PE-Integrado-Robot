
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CONTRATO\Gerar_Termos"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Aditivo_Gestor_Fiscal.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Contratos/Termos $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}