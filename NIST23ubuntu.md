## Running NIST PepSearch in Ubuntu using NIST PepSearch utility

The NIST MS/MS 2023 database ( https://www.nist.gov/programs-projects/nist23-updates-nist-tandem-and-electron-ionization-spectral-libraries ), containing 51,501 compounds and 2.4 million spectra, is an invaluable resource for metabolomics research. This extensive database represents a significant advancement over the NIST 2020 version, providing researchers with an expanded repertoire of spectral data for metabolite identification and annotation.

In metabolomics, the identification of unknown metabolites in complex biological samples is a critical challenge. Tandem mass spectrometry (MS/MS) plays a crucial role in this process, generating fragmentation spectra that serve as fingerprints for individual metabolites. By comparing experimental MS/MS spectra against reference libraries like NIST, researchers can confidently identify known metabolites and potentially discover novel ones.

The NIST PepSearch utility https://chemdata.nist.gov/dokuwiki/doku.php?id=peptidew:mspepsearch is a powerful tool for conducting similarity searches between experimental MS/MS spectra and the reference spectra in the NIST database. However, this tool is primarily designed for Windows operating systems. Researchers using Linux distributions like Ubuntu can leverage the Wine compatibility layer to seamlessly run NIST PepSearch within their Linux environment.

By following the instructions outlined in this guide, researchers can easily install Wine on Ubuntu and execute NIST PepSearch to perform comprehensive similarity searches against the NIST MS/MS 2023 database. The provided command-line example demonstrates how to initiate a search using a sample MSP file, specifying the output TSV file, and designating the location of the NIST library.

Furthermore, the flexibility of Wine allows researchers to integrate NIST PepSearch into custom Python or R scripts. This capability facilitates the parallelization of similarity searches across multiple cores, enabling efficient processing of large datasets and high-throughput metabolomics studies.


## Install Wine on Ubuntu

```
sudo apt install -y wine-stable
sudo dpkg --add-architecture i386 
sudo apt-get update 
sudo apt-get install wine32
wine --version

```

## Run Spectra Similarity Search Against NIST 23 Database

```
wine /home/username/NIST23/PEPSEARCH/MSPepSearch64.exe /INP /home/username/msdata/rawdata/ST002016/RPESIPOS/CSA/DDA/DDA_MSP/DDA_MSP_Pooled_QC_ID_01.mzML.msp  /OUTTAB /home/username/MSData/results/ST002016/RPESIPOS/CSA/DDA/DDA_MSP/DDA_MSP_Pooled_QC_ID_01.mzML.tsv /LIB /home/username/NIST23/MSSEARCH/hr_msms_nist /LIB /home/username/NIST23/MSSEARCH/hr_msms_nist#2 r d i z /Z 0.008 /M 0.01 /MinMF 100 /HITS 20 /MzLimits 0 2000 /OnlyFound /OutPrecursorMZ /OutDeltaPrecursorMZ /OutPrecursorType /OutChemForm /OutNISTrn /OutSpecNum /OutCE /OutNumMP  /OutNumMP /OutIK /OutRevMF /OutRRevMF /HiPri /LibInMem
```
Remember to change these paths:

```
NIST PepSearch /home/username/NIST23/PEPSEARCH/MSPepSearch64.exe 
Sample MSP file /home/username/msdata/rawdata/ST002016/RPESIPOS/CSA/DDA/DDA_MSP/DDA_MSP_Pooled_QC_ID_01.mzML.msp
Output TSV file /home/username/MSData/results/ST002016/RPESIPOS/CSA/DDA/DDA_MSP/DDA_MSP_Pooled_QC_ID_01.mzML.tsv
NIST library locatioin /home/username/NIST23/MSSEARCH/hr_msms_nist 
```
### Wine can be called from python/R script to run the spectra similarity on multiple cores and for multiple MSP files, and it is normally available in HPC servers. 

