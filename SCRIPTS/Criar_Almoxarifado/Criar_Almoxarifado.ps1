

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\ALMOXARIFADO\Almoxarifado"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Criar_almoxarifado.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Almoxarifado $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}