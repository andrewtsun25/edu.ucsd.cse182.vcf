#!/usr/bin/env bash
if [ ! -d ../filtered_vcf_files/ ];
then
    echo "creating new directory"
    mkdir ../filtered_vcf_files/
fi

output_dir='../filtered_vcf_files/'
for vcf_file in ../vcf_files/CMS*.vcf;
do
    file_string="${vcf_file}"
    vcf_file_name_shortened="${file_string##*/}"
    echo "new shortened name is $vcf_file_name_shortened"
    output_file="${output_dir}filter.${vcf_file_name_shortened}"
    echo "output path is: $output_file"
    vcftools --vcf ${vcf_file} --indv 52-AA --recode --recode-INFO-all  --stdout > $output_file
done
