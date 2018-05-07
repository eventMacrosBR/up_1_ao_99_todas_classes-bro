#!/bin/bash
if hash pwsh 2> /dev/null; then
   PS3='Escolha classe desejada: '
   options=("arcano" "arcebispo" "bioquimico" "cavaleiro-runico" "feiticeiro" "guardiao-real" "mecanico" "musa" "renegado" "sentinela" "sicario" "shura" "trovador")
   select opt in "${options[@]}"
   do
        if [ -z $opt ]; then
          echo "Opção inválida"
        else
          echo "Opção escolhida $opt"
          pwsh -File gerador-eventmacros.ps1 -job "$opt"
          echo "Arquivo gerado \"enventMacros.txt\""
          exit
        fi
   done
else 
    echo "Powershell deve ser instalado. Siaga as instruções em: https://github.com/PowerShell/PowerShell"
fi
