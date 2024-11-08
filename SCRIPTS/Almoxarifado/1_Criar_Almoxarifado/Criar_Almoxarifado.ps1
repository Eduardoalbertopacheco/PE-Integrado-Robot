

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\ALMOXARIFADO\Almoxarifado"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Novo_almoxarifado_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Almoxarifado/Novo_almoxarifado $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}