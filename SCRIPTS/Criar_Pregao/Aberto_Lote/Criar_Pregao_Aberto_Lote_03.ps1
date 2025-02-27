

# $EXECDIR = (Get-Location).Path
# $foldersPath = "${EXECDIR}\test\PREGAO\Aberto_lote"

# # Especifique o nome do arquivo .robot que você quer rodar
# $testFileName = "Pregao_Aberto_lote_03.robot"
# $testFilePath = "${foldersPath}\$testFileName"

# if (Test-Path $testFilePath) {
#     Write-Host "Executando teste: $testFilePath"
#     robot --exitonfailure -d ./Relatorio/Pregao/Aberto_Lote/Pregao_Aberto_Lote_03 $testFilePath
# } else {
#     Write-Host "O arquivo .robot não existe: $testFilePath"
# }


$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\PREGAO\Aberto_lote"

# Nome do arquivo de teste
$testFileName = "Pregao_Aberto_lote_03_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

# Diretório para salvar os relatórios
$reportDir = "./Relatorio/Pregao/Aberto_Lote/Pregao_Aberto_Lote_03"
$outputFile = "$reportDir/output.xml"
$maxTentativas = 2

if (Test-Path $testFilePath) {
    Write-Host "Executando teste inicial: $testFilePath"

    # Primeira execução do teste
    robot --exitonfailure -d $reportDir $testFilePath
    $exitCode = $LASTEXITCODE  # Captura o código de saída

    # Se houver falhas, tenta rodar novamente apenas os testes que falharam
    $tentativas = 0
    while ($tentativas -lt $maxTentativas -and $exitCode -ne 0) {
        $tentativas++
        Write-Host "Alguns testes falharam. Tentando novamente (Tentativa $tentativas)..."

        # Reexecuta apenas os testes que falharam
        robot --rerunfailed $outputFile --exitonfailure -d $reportDir $testFilePath
        $exitCode = $LASTEXITCODE  # Captura o código de saída após rerun
    }

    if ($exitCode -eq 0) {
        Write-Host "Todos os testes passaram apos $tentativas tentativas."
    } else {
        Write-Host "Ainda ha testes falhando apos $tentativas tentativas."
        exit 1
    }
} else {
    Write-Host "O arquivo .robot não existe: $testFilePath"
    exit 1
}