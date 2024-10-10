params.dir = '/home/dwipapap/Projek/op_transcriptome/nextflow/script'

process firstStep {


    """
    bash ${params.dir}/fastqc.sh

    """
}

workflow {
	firstStep
}
