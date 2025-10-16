

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_Pregao_Nao_ARP"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)
        $logDir = "./Relatorio/Solicitacao_Compra/Todas_SCs_Pregao_Nao_ARP/$testFileName"
        
        # Executar o teste e salvar o log no diretório correspondente
        robot --exitonfailure -d $logDir $testFile.FullName
    }
}

