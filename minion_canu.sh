#Minion denovo assembly and annotation. Ana Cobian August 2018 #

#Before using this script you need to:
# 1.- Do the base calling and demultiplexing
# 2.- Concatenate all .fastq files from each barcode 
# 3.- Put the .fastq files in a single folder (P00_raw)
# 4.- Make a list of IDS

#To run do: thisscrit.sh [IDS.txt] [path to main folder] [genome size]
#bash minion_canu.sh IDS1.txt /home/acobian/minion/08272018 70000

#cat $1 | xargs -I{fileID} sh -c "

cat $1 | xargs -I{fileID} sh -c "/usr/local/canu-1.7.1/Linux-amd64/bin/canu -d $2/canu/{fileID}_assembly -p {fileID} genomeSize=$3 -nanopore-raw $2/P00_raw/{fileID}.fastq  gnuplotTested=true -correct -minReadLength=500"
cat $1 | xargs -I{fileID} sh -c "/usr/local/canu-1.7.1/Linux-amd64/bin/canu -d $2/canu/{fileID}_assembly -p {fileID} genomeSize=$3 -nanopore-raw  $2/P00_raw/{fileID}.fastq gnuplotTested=true  -minReadLength=500"
