# setup the password as an environmental variable
source ~/.bash-profile

# just to check the progress of simulations on spartan
sshpass -e ssh twozniak@spartan.hpc.unimelb.edu.au
squeue -u twozniak
exit

# Upload files
sshpass -e scp reproduction/bpvar*.* twozniak@spartan.hpc.unimelb.edu.au:/data/projects/punim0093/bpvars/
sshpass -e scp src/*.cpp twozniak@spartan.hpc.unimelb.edu.au:/data/projects/punim0093/bpvars/
sshpass -e scp sv*.* twozniak@spartan.hpc.unimelb.edu.au:/data/projects/punim0093/bpvars/

# Download files
scp twozniak@spartan.hpc.unimelb.edu.au:/data/projects/punim0093/bpvars/results/*_noex.rda reproduction/results/

# working with svar_betel on spartan
#################################################
sshpass -e ssh twozniak@spartan.hpc.unimelb.edu.au
cd /data/projects/punim0093/bpvars/

sbatch bpvar_bench.slurm
sbatch bpvar_jaroc.slurm
sbatch bpvar_bench_miss.slurm
sbatch bpvar_jaroc_miss.slurm

squeue -u twozniak

tail -100 *22324960.out

cat *22329511.out
rm *.out
cat bpvar_bench.R
cat *spartan_wrap.R
tail -200 src_cpp/bsvar_sv_ce.cpp
ls
ls *.rda
ls results/
ls -lh results/e_*.*
# rm results/*.rda
exit
#

# install bsvars package on spartan
#################################################
sshpass -e ssh twozniak@spartan.hpc.unimelb.edu.au
cd /data/projects/punim0093/bpvars/
sinteractive
module load R/4.5.0
R
install.packages("bpvars")
devtools::install_github("bsvars/bpvars")
packageVersion("bpvars")
?bsvars::bsvars
q("no")
exit

