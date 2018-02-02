#!/bin/bash

git fetch --unshallow

jobs=("arcano" "arcebispo" "bioquimico" "cavaleiro-runico" "feiticeiro" "guardiao-real" "mecanico" "musa" "renegado" "sentinela" "sicario" "shura" "trovador")
jobs_ok=(" arcebispo bioquimico guardiao-real renegado ")
mkdir dist
for i in "${jobs[@]}"; do
    pwsh -File auxiliarGui.ps1 -job "$i"
    if [[ " {$jobs_ok[@]} " =~ " $i " ]]; then
        zip_file="$i.funcionando.zip"
    else 
        zip_file="$i.nao_testado.zip"
    fi    
    zip $zip_file eventMacros.txt
    mv $zip_file dist/ 
done





