@echo off
DEL eventMacros.txt
for %%f in (*.event.pl) do type "%%f" >> "eventMacros.txt"
