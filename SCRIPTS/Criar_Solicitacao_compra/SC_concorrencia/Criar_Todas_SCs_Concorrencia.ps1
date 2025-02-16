


# $EXECDIR = (Get-Location).Path
# $foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_concorrencia"

# if (Test-Path $foldersPath) {
#     $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
#     Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

#     foreach ($testFile in $testFiles) {

#         # Extrair o nome do arquivo sem extensão
#         $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)
        
#         # Definir o diretório de log baseado no nome do arquivo
#         $logDir = "./Relatorio/Solicitacao_Compra/Todas_SCs_Concorrencia/$testFileName"
        
#         # Executar o teste e salvar o log no diretório correspondente
#         robot --exitonfailure -d $logDir $testFile.FullName
#     }
# }



$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_concorrencia"
$maxTentativas = 2  # Número máximo de tentativas em caso de falha

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {

        # Extrair o nome do arquivo sem extensão
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)

        # Definir o diretório de log baseado no nome do arquivo
        $logDir = "./Relatorio/Concorrencias/Todas_As_Concorrencias/$testFileName"

        # Executar o teste e salvar o log no diretório correspondente
        Write-Host "Executando teste: $testFile.FullName"
        robot --exitonfailure -d $logDir $testFile.FullName
        $exitCode = $LASTEXITCODE  # Captura o código de saída

        # Se houver falhas, tenta rodar novamente apenas os testes que falharam
        $tentativas = 0
        $outputFile = "$logDir/output.xml"

        while ($tentativas -lt $maxTentativas -and $exitCode -ne 0) {
            $tentativas++
            Write-Host "Alguns testes falharam. Tentando novamente (Tentativa $tentativas)..."

            # Reexecuta apenas os testes que falharam
            robot --rerunfailed $outputFile --exitonfailure -d $logDir $testFile.FullName
            $exitCode = $LASTEXITCODE  # Captura o código de saída após rerun
        }

        if ($exitCode -eq 0) {
            Write-Host "Todos os testes passaram após $tentativas tentativas para $testFileName."
        } else {
            Write-Host "Ainda há testes falhando após $tentativas tentativas para $testFileName."
        }
    }
}

