import pandas as pd

samples = pd.read_csv("srr_id.csv")
samples_dict = samples.set_index("srr_id").to_dict()["url"]

def srr2url(wildcards):
    return samples_dict[wildcards.srr_id]

rule download_bam:
    output:
        "data/bam/{srr_id}.bam"
    params:
        url = srr2url
    shell:
        "wget -nc {params.url} -O {output}"
