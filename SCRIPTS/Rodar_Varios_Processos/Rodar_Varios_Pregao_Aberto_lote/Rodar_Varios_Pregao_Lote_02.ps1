

$EXECDIR = (Get-Location).Path  # Definindo o diretório atual
$robotFile = "${EXECDIR}/test\SCRIPTS/Rodar_Varios_Processos/Pregao_aberto_lote_02.robot"

# Lista de processos
$LISTA_PROCESSOS = @(
    "0235.2024.CPL.PE.0034.SAD", "0234.2024.CPL.PE.0033.SAD", "0233.2024.CPL.PE.0032.SAD", "0232.2024.CPL.PE.0031.SAD",
    "0231.2024.CPL.PE.0030.SAD", "0230.2024.CPL.PE.0029.SAD", "0229.2024.CPL.PE.0028.SAD", "0228.2024.CPL.PE.0027.SAD",
    "0227.2024.CPL.PE.0026.SAD", "0226.2024.CPL.PE.0025.SAD", "0225.2024.CPL.PE.0024.SAD", "0224.2024.CPL.PE.0023.SAD",
    "0223.2024.CPL.PE.0022.SAD", "0222.2024.CPL.PE.0021.SAD", "0221.2024.CPL.PE.0020.SAD", "0220.2024.CPL.PE.0019.SAD",
    "0219.2024.CPL.PE.0018.SAD", "0218.2024.CPL.PE.0017.SAD", "0217.2024.CPL.PE.0016.SAD", "0216.2024.CPL.PE.0015.SAD",
    "0215.2024.CPL.PE.0014.SAD", "0214.2024.CPL.PE.0013.SAD", "0213.2024.CPL.PE.0012.SAD", "0212.2024.CPL.PE.0011.SAD",
    "0211.2024.CPL.PE.0010.SAD", "0210.2024.CPL.PE.0009.SAD", "0209.2024.CPL.PE.0008.SAD", "0208.2024.CPL.PE.0007.SAD",
    "0207.2024.CPL.PE.0006.SAD", "0206.2024.CPL.PE.0005.SAD"
)

for ($i = 0; $i -lt 2; $i++) {
    Write-Host "Executando o arquivo .robot para o processo: $($LISTA_PROCESSOS[$i])"

    # Passa o item atual da lista como variável para o .robot
    robot -d ./logs_$i -v LISTA_PROCESSOS:$($LISTA_PROCESSOS[$i]) $robotFile
}



# # Comando para o robot interroper e pula para próxima interação caso ocorra algum erro
# $EXECDIR = (Get-Location).Path  # Definindo o diretório atual
# $suite = "${EXECDIR}\test\SOLICITACAO_COMPRA\Exemplos_SCs\EXE_SC_Lote_Teste_Auto.robot"

# For ($i = 1; $i -le 30; $i++) {
#     Write-Host "Executando a suite pela $iª vez"
    
#     try {
#         # Executa o teste e se ocorrer erro, o controle irá para o 'catch'
#         robot -d "./logs_$i" $suite
#     } catch {
#         # Se houver erro, apenas pula para a próxima iteração
#         Write-Host "Erro na execução da suíte $i, mas continuando para a próxima."
#         continue
#     }
# }
