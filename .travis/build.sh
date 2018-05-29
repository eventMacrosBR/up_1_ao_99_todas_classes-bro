#!/usr/bin/env bash

function corrigirVersao {
    git fetch --unshallow;
    git checkout -b master;
}

function baixarPlugins {
    diretorioCorrente=$(pwd)
    cd ~
    git clone https://github.com/eventMacrosBR/PluginsParaUpTodasAsClasses.git
    cd $diretorioCorrente
}

function estaFuncionando {
    classe=$1;
    if grep -q "Commands::run(\"conf -f questc2_implementada true\");" classes/$classe/quest-c-2.pm; then
        echo "funcionando";
    else
        echo "nao_testado";
    fi
}

function temPluginsParaEmpacotar {
    classe=$1;
    if grep -q "verificarEInstalarPlugin" classes/$classe/plugins.pm; then
        echo "temPlugins";
    else
        echo "naoTemPlugins";
    fi
}

function adicionarPlugins {
    arquivoZip=$1
    classe=$2
    mkdir plugins
    while read -r linha; do
        plugin=$(echo $linha | sed -r 's/.*\"(\w+)\".*/\1/g');
        cp -R ~/PluginsParaUpTodasAsClasses/plugins/$plugin plugins   
    done < <(grep verificarEInstalarPlugin classes/$classe/plugins.pm) 
    zip -ur $arquivoZip plugins
    rm -Rf plugins
}

function gerarEEmpacotarMacros {
    # Por padrão o travis só baixa os ultimos commits fazendo a contagem de commits dar errada, é preciso corrigir isso
    corrigirVersao
    # Baixar os plugins via git na pasta do usuário do travis
    baixarPlugins

    # Pasta onde serão armazenados as macos empacotadas
    mkdir dist

    for classe in classes/*; do
        classe=$(basename $classe)
        echo $classe
        pwsh -File gerador-eventmacros.ps1 -job "$classe"
        arquivoZip="$classe.$(estaFuncionando $classe).zip"
        zip $arquivoZip eventMacros.txt
        if [ "$(temPluginsParaEmpacotar $classe)" == "temPlugins" ]; then
            adicionarPlugins "$arquivoZip" "$classe"
        fi
        mv $arquivoZip dist/
    done
}

gerarEEmpacotarMacros