#!/usr/bin/env nextflow

params.reads = "/home/dwipapap/Projek/op_transcriptome/nextflow/data/rna/*/*.fastq.gz"
params.forfastqc = "${launchDir}/forqc"
/**
 * Quality control fastq
 */

reads_ch = Channel
    .fromPath( params.reads )
    
process fastqc {
    publishDir "$params.forfastqc/", mode: 'copy', overwrite: 'true'
    input:
    path read

    output:
    file("${output_html}")
    file("${output_zip}")
    val("${output_html}")


    
    script:
    output_html = "${read}".replaceFirst(/.fastq.gz$/, "_fastqc.html")
    output_zip = "${read}".replaceFirst(/.fastq.gz$/, "_fastqc.zip")
    """
    fastqc -o . "${read}"
    """
}



workflow {
    fastqc(reads_ch)
}
