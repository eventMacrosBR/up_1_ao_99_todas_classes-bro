#!/bin/bash

cd ..
jobs=("arcano" "arcebispo" "bioquimico" "cavaleiro-runico" "feiticeiro" "guardiao-real" "mecanico" "musa" "renegado" "sentinela" "sicario" "shura" "trovador")
mkdir dist
for i in "${jobs[@]}"; do
    pwsh -File auxiliarGui.ps1 -job "$i";
    mkdir dist/$i ;
    mv eventMacros.txt dist/$i/;
done
zip -r build.zip dist 
rm -R dist




