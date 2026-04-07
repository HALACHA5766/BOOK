
$command = $args[0]

if ($command -eq "preview") {
    quarto preview index.qmd --no-browser --no-watch-inputs
} elseif ($command -eq "export") {
    $format = $args[1]
    if ($format -eq "pdf") {
        quarto render index.qmd --to pdf
    } elseif ($format -eq "epub") {
        quarto render index.qmd --to epub
    } elseif ($format -eq "docx") {
        quarto render index.qmd --to docx
    } else {
        Write-Host "Unknown export format: $format"
        Write-Host "Available export formats: pdf, epub, docx"
    }
} elseif ($command -eq "help" -or $null -eq $command) {
    Write-Host "Available commands:"
    Write-Host "  preview       - Run 'quarto preview index.qmd --no-browser --no-watch-inputs'"
    Write-Host "  export [format] - Export the book to a specified format (pdf, epub, docx)"
    Write-Host "  help          - Show this help message"
} else {
    Write-Host "Unknown command: $command"
    Write-Host "Use 'help' to see available commands."
}
