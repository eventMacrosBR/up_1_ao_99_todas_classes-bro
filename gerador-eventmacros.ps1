param ( [string]$job )

#Por questões de compatibilidade esse arquivo precisa ser aberto em 
#codificação ISO 8859-1 (ANSI) e não UTF-8

if (! $job) {
    Add-Type -AssemblyName System.Windows.Forms


    $Form = New-Object system.Windows.Forms.Form
    $listJobs = New-Object system.windows.Forms.ListView
    $btn = New-Object system.windows.Forms.Button
    $imageListIcons = New-Object System.Windows.Forms.ImageList
    $labelEscolherClasse = New-Object System.Windows.Forms.Label
    $labelConfigsPersonalizadas = New-Object System.Windows.Forms.Label
    $configsPersonalizadas = New-Object System.Windows.Forms.PropertyGrid
    $labelClasseSelecionada = New-Object System.Windows.Forms.Label
    $painelSuperior = New-Object System.Windows.Forms.Panel
    $painelMedio = New-Object System.Windows.Forms.Panel
    $painelInferior = New-Object System.Windows.Forms.Panel
    
    if($PSVersionTable.PSVersion.Major -ge 3){
        $classDefinition = '
            using System;
            public class Configuracoes {
                public String skillsAprendiz { get; set; }
                public String skillsClasse1 { get; set; }
                public String skillsClasse2 { get; set; }
                public String skillsClasse1T { get; set; }
                public String skillsClasse2T { get; set; }
                public String skillsClasse3 { get; set; }
                public String statsPadrao { get; set; }
                public String statsPadraoTransclasse { get; set; }
                public String statsPadraoClasse3 { get; set; }
                public String renascer { get; set; }
                public String amigo { get; set; }
                public String pontoDeEncontro { get; set; }

            }
        '
        Add-Type -Language CSharp  -TypeDefinition $classDefinition
        
        $configuracoes = New-Object Configuracoes
    } else {
        [System.Windows.Forms.MessageBox]::Show( "O powershell do seu sistema operacional é muito antigo. As configurações personalizadas serão apenas leitura para visualização", "Aviso" )
        $configuracoes = New-Object -TypeName PSObject -Prop @{ 
            skillsAprendiz = $null;
            skillsClasse1 = $null; 
            skillsClasse2 = $null;
            skillsClasse1T = $null;
            skillsClasse2T = $null;
            skillsClasse3 = $null;
            statsPadrao = $null;
            statsPadraoTransclasse = $null;
            statsPadraoClasse3 = $null;
            renascer = $null;
            amigo = $null;
            pontoDeEncontro = $null;

        }
    }

}

function getVersao {
    $version = "versao_indefinida"
    try {
        $hash = (git rev-parse HEAD) | Out-String
        $hash = $hash.substring(0,7)
        $commitCounter = (git rev-list --count master) | Out-String 
        $commitCounter = $commitCounter -replace "\s+" 
        $version = $commitCounter + "." + $hash 
        
    }catch{
        [System.Windows.Forms.MessageBox]::Show( "Git não instalado, não vai ser exibida a versão", "Erro" )
    }
    return $version
}

function limparNomeDaClasse {
    Param($classe)
    return $classe.ToString().ToLower().Replace(" ","-").Replace("í","i").Replace("ú","u").Replace("ã","a").Replace("á","a").Replace("â","a")
}

function gerarMacro {
    param ($classe)
    $eventMacros =  "eventMacros.txt"
    #Remover o arquivo antigo
    if (Test-Path $eventMacros) {
      Remove-Item $eventMacros
    }
    $versao = getVersao
    $jobSimples = limparNomeDaClasse($classe)
    $automacroVersao = Get-Content -Encoding UTF8 versao.pm 
    $automacroVersao = $automacroVersao -replace "<versao>",$versao
    $automacroVersao | Out-File $eventMacros -Encoding UTF8 -append 
    Get-Content -Encoding UTF8 classes\$jobSimples\*.pm | Out-File $eventMacros -Encoding UTF8 -append
    Get-Content -Encoding UTF8 comum\*.pm | Out-File $eventMacros -Encoding UTF8 -append
}

function salvarBuild {
    param ($classe)
    $arquivo = "classes/$classe/config.pm"
    $config = $configsPersonalizadas.SelectedObject
    $tempFile = "classes/$classe/config.pm.tmp"
    foreach($line in Get-Content -Encoding UTF8 $arquivo) {
        if($line -match "^\s+\w+\s+=>\s+'.*"){
            $chave = $line -replace "\s+(\w+)\s+\=\>.*",'$1'
            $novoValor = $config."$chave"
            $line -replace "'.*'","'$novoValor'" | Out-File $tempFile -Encoding UTF8 -append
        } else {
            $line | Out-File $tempFile -Encoding UTF8 -append
        }
    }
    Remove-Item $arquivo
    Rename-Item -Path $tempFile -NewName "config.pm"

}

function acaoBotaoGerar {
    $classe = $listJobs.SelectedItems
    if ($classe.Count -eq 1) {
        $classeSelecionada = $classe[0].Text
        salvarBuild($classeSelecionada)
        gerarMacro($classeSelecionada)
        [System.Windows.Forms.MessageBox]::Show("eventMacros.txt para $classeSelecionada gerado com sucesso!" , "Ok")
        $Form.Dispose()
    } else{
        [System.Windows.Forms.MessageBox]::Show("Erro, nenhum item selecionado", "Selecione uma classe")
    }
}

function acaoCarregarConfiguracoes {
    $classe = $listJobs.SelectedItems
    if ($classe.Count -eq 1) {
        $classeSelecionada = $classe[0].Text
        Write-Host "Classe selecionada: $classeSelecionada"

        $labelClasseSelecionada.Text = "Classe selecionada: $classeSelecionada"
        $c = limparNomeDaClasse($classe[0].Text)
        $arquivo = "classes/$c/config.pm"
        Write-Host "Abrindo arquivo: $arquivo"
        foreach($line in Get-Content -Encoding UTF8 $arquivo) {

            if($line -match "^\s+\w+\s+=>\s+'.*"){
                Write-Host "Linha de configuração: $line"
                $chave = $line -replace "\s+(\w+)\s+\=\>.*",'$1'
                $valor = $line -replace ".*'(.*)'.*",'$1'
                
                $configuracoes."$chave" = $valor
                                
            }
           
        }
        $configsPersonalizadas.SelectedObject = $configuracoes

    } else {
        $labelClasseSelecionada.Text = "Classe selecionada: "
        
    }
}


function desenharJanela {
    $versao = getVersao
    $Form.Text = "Gerador eventMacros.txt versão: " + $versao
    $Form.TopMost = $true
    $Form.Width = 800
    $Form.Height = 600

    $Form.Controls.Add($painelMedio)
    $painelMedio.Dock = [System.Windows.Forms.DockStyle]::Fill
         
    $painelMedio.Controls.Add($configsPersonalizadas)
    $configsPersonalizadas.Dock = [System.Windows.Forms.DockStyle]::Fill
    $configsPersonalizadas.SelectedObject = $configuracoes
    $configsPersonalizadas.PropertySort = [System.Windows.Forms.PropertySort]::NoSort
    $configsPersonalizadas.ToolbarVisible = $false

    $Form.Controls.Add($painelSuperior)
    $painelSuperior.Dock = [System.Windows.Forms.DockStyle]::Top
    $painelSuperior.Height = 250

    $painelSuperior.Controls.Add($listJobs)
    $listJobs.Anchor = [System.Windows.Forms.AnchorStyles]::Left
    $listJobs.Dock = [System.Windows.Forms.DockStyle]::Fill
    $listJobs.View = "LargeIcon"
    $listJobs.LargeImageList = $imageListIcons
    $listJobs.MultiSelect = $false
    $listJobs.Add_click({ acaoCarregarConfiguracoes })
    $listJobs.AutoSize = $true
    

    $painelSuperior.Controls.Add($labelEscolherClasse);
    $labelEscolherClasse.Dock = [System.Windows.Forms.DockStyle]::Top
    $labelEscolherClasse.Text = "Selecione sua classe:"

   
    $painelSuperior.Controls.Add($labelConfigsPersonalizadas);
    $labelConfigsPersonalizadas.Dock = [System.Windows.Forms.DockStyle]::Bottom
    $labelConfigsPersonalizadas.Text = "Configurações Personalizadas"

     

    $Form.Controls.Add($painelInferior)
    $painelInferior.Dock = [System.Windows.Forms.DockStyle]::Bottom
    $painelInferior.Height = 25

    $painelInferior.Controls.Add($labelClasseSelecionada)
    $labelClasseSelecionada.Dock = [System.Windows.Forms.DockStyle]::Left
    $labelClasseSelecionada.Text = "Classe selecionada: "


    $painelInferior.Controls.Add($btn)
    $btn.Dock = [System.Windows.Forms.DockStyle]::Right
    $btn.Text = "Gerar"


    $Form.AcceptButton = $btn
    $btn.Add_click({ acaoBotaoGerar })
}

function carregarValores {
    
    $classes = "Cavaleiro Rúnico", "Guardião Real", "Arcano", "Feiticeiro", "Sentinela", "Trovador", "Musa", "Mecânico", "Bioquímico", "Sicário", "Renegado", "Arcebispo", "Shura", "Mestre Taekwon", "Espiritualista", "Kagerou", "Oboro", "Insurgente", "Superaprendiz"

    For ($i=0; $i -lt $classes.Count; $i++) {
        $listItemClasse = New-Object System.Windows.Forms.ListViewItem
        $classe = limparNomeDaClasse($classes[$i])
        $imageListIcons.Images.Add([System.Drawing.Image]::FromFile("gerador-images/$classe.png"))
        $listItemClasse.ImageIndex = $i
        $listItemClasse.Text = $classes[$i]
        
        $listJobs.Items.Add($listItemClasse)
    } 
}

function mostrarJanela {
    $Form.Add_Shown({$Form.Activate(); $btn.focus()})
    [void]$Form.ShowDialog()
}

function encerrarAplicacao {
    $Form.Dispose()
}

function updater {
    if(getVersao -ne "versao_indefinida") {
        git fetch
        $versao_atual = (git rev-list --count origin/master) | Out-String
        $versao_local = (git rev-list --count master) | Out-String
        if($versao_atual -ne $versao_local) {
            $confirmacao = [System.Windows.Forms.MessageBox]::Show( "Nova versão disponível. Gostaria de atualizar sua versão?", "Versão desatualizada", [Windows.Forms.MessageBoxButtons]::YesNo )
            if ($confirmacao -eq "YES"){
                git stash save
                git pull --rebase
                git stash pop
            }
        }
    }
}

if(! $job){
    updater
    desenharJanela
    carregarValores
    mostrarJanela
    encerrarAplicacao
}else{
    gerarMacro($job)
}
