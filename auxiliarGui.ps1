Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Gerador eventMacros.txt"
$Form.TopMost = $true
$Form.Width = 450
$Form.Height = 100

$version = "0000000"

try {
    $version = (git rev-parse HEAD) | Out-String
    $version = $version.substring(0,7)
    
}catch{
    Write-Out "Git não instalado, não vai ser exibida a versão"
}

$Form.Text = $Form.Text + " versão: " + $version
$cbxJobs = New-Object system.windows.Forms.ComboBox
$cbxJobs.Width = 300
$cbxJobs.location = new-object system.drawing.point(10,20)
$cbxJobs.Items.Add("Arcano")
$cbxJobs.Items.Add("Arcebispo")
$cbxJobs.Items.Add("Bioquímico")
$cbxJobs.Items.Add("Cavaleiro Rúnico")
$cbxJobs.Items.Add("Feiticeiro")
$cbxJobs.Items.Add("Guardião Real")
$cbxJobs.Items.Add("Mecânico")
$cbxJobs.Items.Add("Musa")
$cbxJobs.Items.Add("Renegado")
$cbxJobs.Items.Add("Sentinela")
$cbxJobs.Items.Add("Sicário")
$cbxJobs.Items.Add("Shura")
$cbxJobs.Items.Add("Trovador")
$Form.controls.Add($cbxJobs)

$btn = New-Object system.windows.Forms.Button
$btn.Text = "Gerar"
$btn.Width = 60
$btn.location = new-object system.drawing.point(310,20)
$Form.controls.Add($btn)

$btn.Add_click({
    $job = $cbxJobs.SelectedItem
    if($job){
        $eventMacros =  "eventMacros.txt"
        if (Test-Path $eventMacros) {
          Remove-Item $eventMacros
        }
        $jobSimples = $job.ToString().ToLower().Replace(" ","-").Replace("í","i").Replace("ú","u").Replace("â","a").Replace("ã","a").Replace("á","a")
        "automacro versao { " | Out-File $eventMacros -Encoding UTF8 -append
        "    BaseLevel > 0 " | Out-File $eventMacros -Encoding UTF8 -append
        "    priority -999 " | Out-File $eventMacros -Encoding UTF8 -append
        "    run-once 1 " | Out-File $eventMacros -Encoding UTF8 -append
        "    call { " | Out-File $eventMacros -Encoding UTF8 -append
        "        [ " | Out-File $eventMacros -Encoding UTF8 -append
        "        log -------------------------- " | Out-File $eventMacros -Encoding UTF8 -append
        "        log | Versão:  " + $version + "       |" | Out-File $eventMacros -Encoding UTF8 -append
        "        log -------------------------- " | Out-File $eventMacros -Encoding UTF8 -append
        "        ] " | Out-File $eventMacros -Encoding UTF8 -append
        "    } " | Out-File $eventMacros -Encoding UTF8 -append
        "} " | Out-File $eventMacros -Encoding UTF8 -append
        " " | Out-File $eventMacros -Encoding UTF8 -append
        Get-Content -Encoding UTF8 classes\$jobSimples\*.pm | Out-File $eventMacros -Encoding UTF8 -append
        Get-Content -Encoding UTF8 comum\*.pm | Out-File $eventMacros -Encoding UTF8 -append
        [System.Windows.Forms.MessageBox]::Show("eventMacros.txt para "+$job+" gerado com sucesso!" , "Ok")
        $Form.Dispose()
    } else{
        [System.Windows.Forms.MessageBox]::Show("Erro, nenhum item selecionado", "Selecione uma classe")
    }
})



[void]$Form.ShowDialog()
$Form.Dispose()
