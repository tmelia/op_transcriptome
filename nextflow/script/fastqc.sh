#!/bin/bash

############################################################################
# SETTING VARS
############################################################################

# Now let's keep track of some information just in case anything goes wrong
start=$(date +%s%N)
echo "=========================================================="
echo "Starting on : ${start}"
echo "Running on node : $(hostname)"
echo "Current directory : $(pwd)"
echo "=========================================================="

HOME="/home/dwipapap/Projek/op_transcriptome/nextflow"
DATA="/home/dwipapap/Projek/op_transcriptome/nextflow/data/rna"
QC="/home/dwipapap/Projek/op_transcriptome/nextflow/qc"


# execute job
IFS=$'\t'
while read SRA_ID; do

        if [[ "$SRA_ID" =~ \#.* ]];then
                echo "skipped comment line"
        else
        	for FILE in ${DATA}/${SRA_ID}/*.fastq.gz
                do
                        echo "fastqc -o ${QC}/ $FILE"
                        fastqc -o ${QC}/ $FILE
                done                          
       fi       
done < ${HOME}/script/list_sra_fastqc.txt


echo "done running"
echo "=========================================================="

# print out some diagnostic stuff
end=$(date +%s%N)
duration=$(((end - start) / 1000000000))

echo "Stop time is ${end}"
echo "Duration: ${duration}"


