

$EXECDIR = (Get-Location).Path
$foldersPath = "${EXECDIR}\test\CRIAR_COMPRAS_DIRETAS\Dispensa"

# Especifique o nome do arquivo .robot que você quer rodar
$testFileName = "Compra_direta_disp_item_Teste_Auto.robot"
$testFilePath = "${foldersPath}\$testFileName"

# Defina o número máximo de tentativas
$maxTentativas = 2
$tentativas = 0
$sucesso = $false

# Verifique se o arquivo .robot existe
if (Test-Path $testFilePath) {
    Write-Host "Iniciando a execução do teste: $testFilePath"
    
    # Loop para tentar rodar o teste até 3 vezes
    while ($tentativas -lt $maxTentativas -and !$sucesso) {
        $tentativas++
        Write-Host "Tentativa $tentativas de $maxTentativas"
        
        # Tente rodar o arquivo .robot
        try {
            # Rodar o arquivo .robot e verificar se houve erro
            $result = robot --exitonfailure -d ./Relatorio/Compras_Diretas/Compra_Dispensa_item $testFilePath
            if ($result -match "FAIL") {
                Write-Host "O teste falhou na tentativa $tentativas, tentando novamente..."
            } else {
                Write-Host "O teste passou na tentativa $tentativas!"
                $sucesso = $true
            }
        } catch {
            Write-Host "Erro ao tentar executar o teste na tentativa $tentativas"
        }
        
        # Se falhar e não for a última tentativa, espera 2 segundos e tenta novamente
        if (!$sucesso -and $tentativas -lt $maxTentativas) {
            Write-Host "Aguardando 2 segundos antes de tentar novamente..."
            Start-Sleep -Seconds 2
        }
    }

    # Se falhar após 3 tentativas, aborta
    if (!$sucesso) {
        Write-Host "O teste falhou após $maxTentativas tentativas. Abortando..."
        exit 1  # Aborta a execução com código de erro
    }
    
} else {
    Write-Host "O arquivo .robot não foi encontrado: $testFilePath"
}




