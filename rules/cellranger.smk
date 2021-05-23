from pathlib import Path

def get_fastq_dir(wildcards):
    dir_path = Path(f"data/fastq/{wildcards.srr_id}")
    fastq_paths = [str(x) for x in dir_path.iterdir() if x.is_dir()]
    return ",".join(fastq_paths)

rule run_cellranger:
    input:
        directory("data/fastq/{srr_id}")
    output:
        directory("data/cellranger/{srr_id}")
    params:
        fastq_dir=get_fastq_dir

    threads: 20
    shell:
        "{config[cellranger]} count "
        "--id={wildcards.srr_id} "
        "--transcriptome={config[ref_transcriptome][human]} "
        "--fastqs={params.fastq_dir} "
        "--localcores {threads} "
        "--disable-ui "
        "--no-bam && "
        "mv {wildcards.srr_id} {output}"
