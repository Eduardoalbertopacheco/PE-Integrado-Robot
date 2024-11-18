

$EXECDIR = (Get-Location).Path  # Definindo o diretório atual
$suite = "${EXECDIR}/test\SCRIPTS/Rodar_Varios_Processos/EXE_SC_Lote_Pregao_Teste_Auto.robot"

For ($i = 1; $i -le 1; $i++) {
    Write-Host "Executando a suíte pela $iª vez"
    robot --exitonfailure -d "Relatorio/logs_$i" $suite
}




# # Comando para o robot interroper e pula para próxima interação caso ocorra algum erro
# $EXECDIR = (Get-Location).Path  # Definindo o diretório atual
# $suíte = "${EXECDIR}\test\SOLICITACAO_COMPRA\Exemplos_SCs\EXE_SC_Lote_Teste_Auto.robot"

# For ($i = 1; $i -le 30; $i++) {
#     Write-Host "Executando a suíte pela $iª vez"
    
#     try {
#         # Executa o teste e se ocorrer erro, o controle irá para o 'catch'
#         robot -d "./logs_$i" $suíte
#     } catch {
#         # Se houver erro, apenas pula para a próxima iteração
#         Write-Host "Erro na execução da suíte $i, mas continuando para a próxima."
#         continue
#     }
# }
