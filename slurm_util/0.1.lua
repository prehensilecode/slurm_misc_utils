-- -*- lua -*-
whatis("Adds some useful Slurm aliases to your environment ")
help([[ Adds some useful Slurm aliases to your environment
]])

prereq("slurm")

set_alias("sinfo_detail", "sinfo --Node -o \"%12N %.6D %4P %.11T %.4c %.8m %.8e %.8z %.8O %10G %48E\"")
set_alias("sacct_detail", "sacct -o \"JobID%20,JobName,User,Partition,NodeList,Elapsed,State,ExitCode,ReqMem,MaxRSS,MaxVMSize,AllocTRES%32,AllocGRES%8\"")
set_alias("seff_array", "/ifs/opt/seff-array/bin/seff-array.py")
