#!/bin/bash
rm eventMacros.txt
for i in *.pm; do cat $i >> eventMacros.txt; done
