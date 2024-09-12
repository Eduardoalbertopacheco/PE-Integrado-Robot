
$EXECDIR = (Get-Location).Path  # Define o diretório raiz do projeto
$folders = Get-ChildItem -Directory -Path "${EXECDIR}\test\COMPRA_DIRETA"

foreach ($folder in $folders) {
    $testFiles = Get-ChildItem -Path "$($folder.FullName)\*.robot"
    foreach ($testFile in $testFiles) {
        robot --exitonfailure -d ./logs $testFile.FullName
    }
}

