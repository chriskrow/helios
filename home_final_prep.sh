#!/bin/bash


filename="${1/.dat/_prepped.dat}"

awk '/^1/{print $0}' $1  |cut -d "," -f2,3,4,5,6 |

awk 'BEGIN{FS=OFS=","}
$3 == "2400" {$2 = $2 + 1; $3 = 0}
$2 == "366" {$1 = $1 + 1; $2 = 1}
{ $3 = sprintf("%04i", $3) }
1' >$filename