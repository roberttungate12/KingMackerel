#1/bin/bash

var1=$1

#Code to run: bash Arlequin.Summary.sh <.txt file>
 
NumPopulations=$(sed 's/ /,/g' $1 | tr -s "," "," | grep NbSamples | cut -d, -f3)
Pop1=$(sed 's/ /,/g' $1 | tr -s "," "," | grep pop_1 | head -1 | cut -d, -f4 | sed 's/p/P/' | sed 's/_/ /')
Pop1Loci=$(sed 's/ /,/g' $1 | tr -s "," "," | grep No | tail -n+5 | cut -d, -f6 | tail -n+2 | head -1)
Pop1MeanHet=$(sed 's/ /,/g' $1 | tr -s "," "," | grep Mean | head -1 | cut -d, -f6)
Pop2=$(sed 's/ /,/g' $1 | tr -s "," "," | grep pop_2 | head -1 | cut -d, -f4 | sed 's/p/P/' | sed 's/_/ /')
Pop2Loci=$(sed 's/ /,/g' $1 | tr -s "," "," | grep No | tail -n+5 | cut -d, -f6 | tail -n+2 | head -1)
Pop2MeanHet=$(sed 's/ /,/g' $var1 | tr -s "," "," | grep Mean | head -2 | tail -1 | cut -d, -f6)
FSTValue=$(sed 's/ /,/g' $var1 | tr -s "," "," | grep pairwise -A 10 | tail -4 | cut -d, -f3 | head -1)
FSTPvalue=$(sed 's/ /,/g' $var1 | tr -s "," "," | grep FST -A 10 | tail -43 | head -1 | cut -d, -f3 | sed 's/+/E/')
GlobalAMOVA=$(sed 's/ /,/g' $var1 | tr -s "," "," | grep FST -A 10 | tail -26 | head -1 | cut -d, -f4)

(echo "Number of Populations in analysis" $NumPopulations
echo $Pop1
echo "Number of Loci:" $Pop1Loci
echo "Mean Het0 =" $Pop1MeanHet
echo 
echo $Pop2
echo "Number of Loci:" $Pop2Loci
echo "Mean Het0:" $Pop2meanHet
echo
echo "FST value Pop1~Pop2:" $FSTValue
echo "FST p-value=" $FSTPvalue
echo
echo "Global AMOVA p-value=" $GlobalAMOVA) > Arlequin_Summary.txt
