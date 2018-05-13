#!/bin/bash

git fetch --unshallow
git checkout -b master
git submodule update --init --recursive

jobs=("arcano" "arcebispo" "bioquimico" "cavaleiro-runico" "feiticeiro" "guardiao-real" "mecanico" "musa" "renegado" "sentinela" "sicario" "shura" "trovador")
jobs_ok=(" arcebispo bioquimico guardiao-real renegado cavaleiro-runico ")
plugins=("henrybk-plugins/BetterShopper" "andyfoss-plugins/by_me/runFromMonster")
mkdir dist
mkdir plugins
for i in "${plugins[@]}"; do
    cp -r submodules/$i plugins/
    for i in plugins; do zip -r dist/$i.zip $i; done  
done
for i in "${jobs[@]}"; do
    pwsh -File gerador-eventmacros.ps1 -job "$i"
    if [[ " {$jobs_ok[@]} " =~ " $i " ]]; then
        zip_file="$i.funcionando.zip"
    else
        zip_file="$i.nao_testado.zip"
    fi
    zip $zip_file eventMacros.txt
    mv $zip_file dist/
done

