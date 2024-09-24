

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\COMPRA_DIRETA"

if (Test-Path $foldersPath) {
    # Usar -Recurse para buscar arquivos em todas as subpastas
    $testFiles = Get-ChildItem -Path "$foldersPath" -Recurse -Filter "*.robot"
    Write-Host "Arquivos .robot encontrados: $($testFiles | ForEach-Object { $_.FullName })"

    foreach ($testFile in $testFiles) {
        # Extrair o nome do arquivo sem extensão
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($testFile.FullName)
        # Definir o diretório de log baseado no nome do arquivo e garantir que seja absoluto
        $logDir = "${EXECDIR}\Relatorio\Compras_Diretas\$testFileName"
        
        Write-Host "Executando teste: $($testFile.FullName)"
        Write-Host "Salvando log em: $logDir"

        # Criar o diretório de log, se não existir
        if (-not (Test-Path $logDir)) {
            New-Item -Path $logDir -ItemType Directory
        }

        # Executar o teste e salvar o log no diretório correspondente
        robot --exitonfailure -d $logDir $testFile.FullName
    }
} else {
    Write-Host "O caminho das pastas não existe: $foldersPath"
}
