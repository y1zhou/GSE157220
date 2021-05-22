# Copyright 2018 Johannes Köster.
# Licensed under the MIT license (http://opensource.org/licenses/MIT)
# This file may not be copied, modified, or distributed
# except according to those terms.
from snakemake.utils import validate
import pandas as pd


########## load config an cell sheet ############


configfile: "config.yaml"

include: "rules/download_bam.smk"

rule all:
    input:
        "srr_id.csv",
        expand("data/bam/{srr_id}.bam", srr_id=samples_dict.keys()),

rule generate_srr_id:
    output:
        "srr_id.csv"
    script:
        "../scripts/get_srr_id.py"
