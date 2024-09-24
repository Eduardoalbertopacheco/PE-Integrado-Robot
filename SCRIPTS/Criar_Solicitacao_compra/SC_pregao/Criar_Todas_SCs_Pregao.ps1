

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA\SC_pregao"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)
        $logDir = "./Relatorio/Solicitacao_Compra/Todas_SCs_Pregao/$testFileName"
        
        Write-Host "Executando teste: $($testFile.FullName)"
        Write-Host "Salvando log em: $logDir"

        # Executar o teste e salvar o log no diretório correspondente
        robot --exitonfailure -d $logDir $testFile.FullName
    }
} else {
    Write-Host "O caminho das pastas não existe: $foldersPath"
}

