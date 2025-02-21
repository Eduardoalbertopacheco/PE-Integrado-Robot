

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Fechado_aberto_lote"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_F_A_lote_03.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Fechado_Aberto_Lote/Pregao_Fechado_Aberto_Lote_01 $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}