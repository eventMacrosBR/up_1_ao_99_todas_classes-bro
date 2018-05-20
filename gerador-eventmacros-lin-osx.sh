#!/bin/bash
if hash pwsh 2> /dev/null; then
   PS3='Escolha classe desejada: '
   options=("Cavaleiro Rúnico" "Guardião Real" "Arcano" "Feiticeiro" "Sentinela" "Trovador" "Musa" "Mecânico" "Bioquímico" "Sicário" "Renegado" "Arcebispo" "Shura" "Mestre Taekwon" "Espiritualista" "Kagerou" "Oboro" "Justiceiro" "Superaprendiz")
   select opt in "${options[@]}"
   do
        if [ -z $opt ]; then
          echo "Opção inválida"
        else
          echo "Opção escolhida $opt"
          pwsh -File gerador-eventmacros.ps1 -job "$opt"
          echo "Arquivo gerado \"eventMacros.txt\""
          exit
        fi
   done
else 
    echo "Powershell deve ser instalado. Siaga as instruções em: https://github.com/PowerShell/PowerShell"
fi
