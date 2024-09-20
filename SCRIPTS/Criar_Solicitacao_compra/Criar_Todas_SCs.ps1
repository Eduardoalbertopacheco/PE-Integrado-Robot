



$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        # Extrair o nome do arquivo sem extensão
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)
        # Definir o diretório de log baseado no nome do arquivo
        $logDir = "./Relatorio/Solicitacao_Compra/Todas_SCs/$testFileName"
        
        Write-Host "Executando teste: $($testFile.FullName)"
        Write-Host "Salvando log em: $logDir"

        # Executar o teste e salvar o log no diretório correspondente
        robot --exitonfailure -d $logDir $testFile.FullName
    }
} else {
    Write-Host "O caminho das pastas não existe: $foldersPath"
}









# $EXECDIR = (Get-Location).Path  # Define o diretório raiz do projeto
# $folders = Get-ChildItem -Directory -Path "${EXECDIR}\test\SOLICITACAO_COMPRA"

# foreach ($folder in $folders) {
#     $testFiles = Get-ChildItem -Path "$($folder.FullName)\*.robot"
#     foreach ($testFile in $testFiles) {
#         robot --exitonfailure -d ./logs $testFile.FullName
#     }
# }

