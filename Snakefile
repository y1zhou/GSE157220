configfile: "config.yaml"

include: "rules/download_bam.smk"
include: "rules/generate_fastq.smk"

rule all:
    input:
        "srr_id.csv",
        expand("data/bam/{srr_id}.bam", srr_id=samples_dict.keys()),
        directory(expand("data/fastq/{srr_id}", srr_id=samples_dict.keys()))

rule generate_srr_id:
    output:
        "srr_id.csv"
    script:
        "../scripts/get_srr_id.py"
