#!/bin/bash

git fetch --unshallow

jobs=("arcano" "arcebispo" "bioquimico" "cavaleiro-runico" "feiticeiro" "guardiao-real" "mecanico" "musa" "renegado" "sentinela" "sicario" "shura" "trovador")
mkdir dist
for i in "${jobs[@]}"; do
    pwsh -File auxiliarGui.ps1 -job "$i";
    mkdir dist/$i ;
    mv eventMacros.txt dist/$i/;
    zip -r dist/$i.zip dist/$i/; 
    rm -R dist/$i/;
done





