

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\COMPRA_DIRETA\Dispensa_emergencial"

if (Test-Path $foldersPath) {
    $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
    Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        # Extrair o nome do arquivo sem extensão
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)
        # Definir o diretório de log baseado no nome do arquivo
        $logDir = "./Relatorio/Compra_Direta/Todas_Compras_Diretas/$testFileName"
        
        Write-Host "Executando teste: $($testFile.FullName)"
        Write-Host "Salvando log em: $logDir"

        # Executar o teste e salvar o log no diretório correspondente
        robot --exitonfailure -d $logDir $testFile.FullName
    }
} else {
    Write-Host "O caminho das pastas não existe: $foldersPath"
}




# $EXECDIR = (Get-Location).Path
# $foldersPath = "${EXECDIR}\test\COMPRA_DIRETA\Dispensa"

# if (Test-Path $foldersPath) {
#     $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
#     Write-Host "Arquivos .robot encontrados em: $($testFiles | ForEach-Object { $_.FullName })"

#     foreach ($testFile in $testFiles) {
#         Write-Host "Executando teste: $($testFile.FullName)"
#         robot --exitonfailure -d ./Relatorio/Compra_Direta\Todas_Compras_Diretas $testFile.FullName
#     }
# } else {
#     Write-Host "O caminho das pastas não existe: $foldersPath"
# }





# $EXECDIR = (Get-Location).Path
# $foldersPath = "${EXECDIR}\test\COMPRA_DIRETA\Dispensa_emergencial"

# if (Test-Path $foldersPath) {
#     $testFiles = Get-ChildItem -Path "$foldersPath\*.robot"
#     Write-Host "Arquivos .robot encontrados em SC_pregao_OPD: $($testFiles | ForEach-Object { $_.FullName })"

#     foreach ($testFile in $testFiles) {
#         Write-Host "Executando teste: $($testFile.FullName)"
#         robot --exitonfailure -d ./Relatorio/Compra_Direta\Todas_Compras_Disp_Emerg $testFile.FullName
#     }
# } else {
#     Write-Host "O caminho das pastas não existe: $foldersPath"
# }