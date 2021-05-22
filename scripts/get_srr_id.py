from pysradb.sraweb import SRAweb

db = SRAweb()
df = (
    db.sra_metadata(snakemake.config["srp_id"], detailed=True)
    .filter(["run_accession", "sra_url_alt3"])
    .rename(columns={"run_accession": "srr_id", "sra_url_alt3": "url"})
)

df.to_csv(snakemake.output[0], index=False)
