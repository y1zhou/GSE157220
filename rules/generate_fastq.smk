rule bamtofastq_bin:
    output:
        config["bamtofastq"]
    shell:
        "wget https://github.com/10XGenomics/bamtofastq/releases/download/v1.3.5/bamtofastq_linux "
        "-O {output} && \ "
        "chmod +x {output}"

rule bam_to_fastq:
    input:
        "data/bam/{srr_id}.bam",
        b2f_bin=config["bamtofastq"]
    output:
        directory("data/fastq/{srr_id}")
    threads: 20
    shell:
        "{input.b2f_bin} --nthreads {threads} {input} {output}"
