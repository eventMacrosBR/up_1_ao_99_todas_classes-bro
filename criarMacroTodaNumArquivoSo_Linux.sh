#!/bin/bash
rm eventMacros.txt
for i in *.event.pl; do cat $i >> eventMacros.txt; done
