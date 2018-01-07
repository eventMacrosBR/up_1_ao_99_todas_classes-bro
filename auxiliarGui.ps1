param ( [string]$job )

if (! $job) {
    Add-Type -AssemblyName System.Windows.Forms


    $Form = New-Object system.Windows.Forms.Form
    $cbxJobs = New-Object system.windows.Forms.ComboBox
    $btn = New-Object system.windows.Forms.Button
}

function getVersao {
    $version = "versao_indefinida"
    try {
        $hash = (git rev-parse HEAD) | Out-String
        $hash = $hash.substring(0,7)
        $commitCounter = (git rev-list --count master) | Out-String 
        $commitCounter = $commitCounter -replace "\r\n" 
        $version = $commitCounter + "." + $hash 
        
    }catch{
        [System.Windows.Forms.MessageBox]::Show( "Git não instalado, não vai ser exibida a versão", "Erro" )
    }
    return $version
}

function gerarMacro {
    param ($classe)
    $eventMacros =  "eventMacros.txt"
    #Remover o arquivo antigo
    if (Test-Path $eventMacros) {
      Remove-Item $eventMacros
    }
    $versao = getVersao
    $jobSimples = $classe.ToString().ToLower().Replace(" ","-").Replace("í","i").Replace("ú","u").Replace("â","a").Replace("ã","a").Replace("á","a")
    $automacroVersao = Get-Content -Encoding UTF8 versao.pm 
    $automacroVersao = $automacroVersao -replace "<versao>",$versao
    $automacroVersao | Out-File $eventMacros -Encoding UTF8 -append 
    Get-Content -Encoding UTF8 classes\$jobSimples\*.pm | Out-File $eventMacros -Encoding UTF8 -append
    Get-Content -Encoding UTF8 comum\*.pm | Out-File $eventMacros -Encoding UTF8 -append
}

function acaoBotaoGerar {
    $classe = $cbxJobs.SelectedItem
    if ($classe) {
        gerarMacro($classe)
        [System.Windows.Forms.MessageBox]::Show("eventMacros.txt para "+$classe+" gerado com sucesso!" , "Ok")
        $Form.Dispose()
    } else{
        [System.Windows.Forms.MessageBox]::Show("Erro, nenhum item selecionado", "Selecione uma classe")
    }
}

function desenharJanela {
    $versao = getVersao
    $Form.Text = "Gerador eventMacros.txt versão: " + $versao
    $Form.TopMost = $true
    $Form.Width = 450
    $Form.Height = 100
    
    $cbxJobs.Width = 300
    $cbxJobs.location = new-object system.drawing.point(10,20)
    $Form.controls.Add($cbxJobs)

    $btn.Text = "Gerar"
    $btn.Width = 60
    $btn.location = new-object system.drawing.point(310,20)
    $Form.controls.Add($btn)
    $Form.AcceptButton = $btn

    $btn.Add_click({ acaoBotaoGerar })
}

function carregarValores {
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
}

function mostrarJanela {
    [void]$Form.ShowDialog()
}

function encerrarAplicacao {
    $Form.Dispose()
}

if(! $job){
    desenharJanela
    carregarValores
    mostrarJanela
    encerrarAplicacao
}else{
    gerarMacro($job)
}