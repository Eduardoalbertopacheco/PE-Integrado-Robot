
$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\SOLICITACAO_COMPRA"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em SC_pregao_OPD: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        Write-Host "Executando teste: $($testFile.FullName)"
        robot --exitonfailure -d ./Relatorio/Todas_SCs $testFile.FullName
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

