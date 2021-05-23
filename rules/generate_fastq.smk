rule bamtofastq_bin:
    output:
        config["bamtofastq"]
    shell:
        "wget https://github.com/10XGenomics/bamtofastq/releases/download/v1.3.5/bamtofastq_linux "
        "-O {output} && \ "
        "chmod +x {output}"

rule bam_to_fastq:
    input:
        "data/bam/{srr_id}.bam"
    output:
        directory("data/fastq/{srr_id}")
    threads: 5
    shell:
        "{config[bamtofastq]} --nthreads {threads} {input} {output}"
