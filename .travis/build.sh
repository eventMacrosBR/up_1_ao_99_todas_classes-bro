#!/bin/bash

git fetch --unshallow

jobs=("arcano(nao_testado)" "arcebispo(funcionando)" "bioquimico(funcionando)" "cavaleiro-runico(nao_testado)" "feiticeiro(nao_testado)" "guardiao-real(funcionando)" "mecanico(nao_testado)" "musa(nao_testado)" "renegado(funcionando)" "sentinela(nao_testado)" "sicario(nao_testado)" "shura(nao_testado)" "trovador(nao_testado)")
mkdir dist
for i in "${jobs[@]}"; do
    pwsh -File auxiliarGui.ps1 -job "${i/\(\w+\)/}";
    zip $i.zip eventMacros.txt
    mv $i.zip dist/ ;
done





