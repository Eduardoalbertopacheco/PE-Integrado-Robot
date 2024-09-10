
# $folders = Get-ChildItem -Directory -Path "$(Get-Location)\..\SOLICITACAO_COMPRA\SC_pregao"
$folders = Get-ChildItem -Directory -Path "C:\\Projetos\\pe_integrado_robot\\test\\SOLICITACAO_COMPRA\SC_pregao"



foreach ($folder in $folders) {
    $testFiles = Get-ChildItem -Path "$($folder.FullName)\*.robot"
    foreach ($testFile in $testFiles) {
        robot --exitonfailure $testFile.FullName
    }
}
