#!/bin/bash
rm eventMacros.txt
for i in comum/*.pm; do cat $i >> eventMacros.txt; done
echo "DIGITE A CLASSE DESEJADA PARA GERAR O SCRIPT:"
ls -1 classes
read CLASSE
for i in classes/$CLASSE/*.pm; do cat $i >> eventMacros.txt; done
