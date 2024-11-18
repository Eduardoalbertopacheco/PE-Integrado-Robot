

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_Lote_Nao_ARP"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Pregao_aberto_lote_01_Teste_Nao_ARP_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

if (Test-Path $testFilePath) {
    Write-Host "Executando teste: $testFilePath"
    robot --exitonfailure -d ./Relatorio/Pregao/Aberto_Lote/Pregao_Aberto_Lote_01_Nao_ARP $testFilePath
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
}

