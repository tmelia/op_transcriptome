#!/usr/bin/env nextflow

// Define the input file containing SRA IDs
params.sra_list = "${HOME}/Projek/op_transcriptome/script/list_sra_fastqc.txt"

// Define the path to your fastqc.sh script
params.fastqc_script = "${HOME}/Projek/op_transcriptome/nextflow/script/fastqc.sh"

// Define the process to run the fastqc.sh script
process runFastQC {
    // Define the input channel
    input:
    path sra_list from file(params.sra_list)

    // Define the output
    output:
    stdout

    // Define the script to be executed
    script:
    """
    println 'test'
    #bash ${params.fastqc_script}

    # Create the output directory for QC results
    mkdir -p qc_results
    """
}

// Define the workflow
workflow {
    runFastQC
}
