params.dir = '/Users/tisha/research/op_trans/op_transcriptome/nextflow/script'

process firstStep {


    """
    bash ${params.dir}/script1.sh

    """
}

process secondStep {

    """
    bash ${params.dir}/script2.sh

    """
}

workflow {
    firstStep | secondStep
}