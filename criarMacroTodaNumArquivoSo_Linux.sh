#!/bin/bash
rm eventMacros.txt
for i in *.event; do cat $i >> eventMacros.txt; done
