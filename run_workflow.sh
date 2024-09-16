#! /bin/bash

# set entry
## AMDTOWERDEMO
## AMDTOWERFAIL
entry=$1

# set up modules
module purge
module load nextflow/24.04.2
module load singularity
module load conda

# set paths
projPath="$PWD"
outPath="/scicomp/home-pure/xuz1/projects/tmp/amddemo_test240625"

# move to output path
if [[ ! -d $outPath/work ]]; then mkdir -p $outPath/work; fi

# run workflow
echo "--Running $entry"
if [[ ! -d $projPath ]]; then
    exit
else 
    nextflow run $projPath/main.nf \
        -resume \
        -entry $entry \
        -profile singularity,test \
        --outdir $outPath \
        -work-dir $outPath/work
fi
