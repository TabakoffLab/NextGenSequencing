#!/bin/bash
awk  '/@ERR033006/ {getline; print length($0)}' /home/saba/C57.DBA.Brain.Sanger/rawReads/ERR033006*.fastq | awk '{sum+=$1} END { print "C571","\t",sum/NR,"\t",NR}' > /home/saba/C57.DBA.Brain.Sanger/data/rawInfo.C57.DBA.Brain.Sanger.29Apr14.txt
awk  '/@ERR033007/ {getline; print length($0)}' /home/saba/C57.DBA.Brain.Sanger/rawReads/ERR033007*.fastq | awk '{sum+=$1} END { print "C572","\t",sum/NR,"\t",NR}' >> /home/saba/C57.DBA.Brain.Sanger/data/rawInfo.C57.DBA.Brain.Sanger.29Apr14.txt
awk  '/@ERR033015/ {getline; print length($0)}' /home/saba/C57.DBA.Brain.Sanger/rawReads/ERR033015*.fastq | awk '{sum+=$1} END { print "DBA1","\t",sum/NR,"\t",NR}' >> /home/saba/C57.DBA.Brain.Sanger/data/rawInfo.C57.DBA.Brain.Sanger.29Apr14.txt
awk  '/@ERR033016/ {getline; print length($0)}' /home/saba/C57.DBA.Brain.Sanger/rawReads/ERR033016*.fastq | awk '{sum+=$1} END { print "DBA2","\t",sum/NR,"\t",NR}' >> /home/saba/C57.DBA.Brain.Sanger/data/rawInfo.C57.DBA.Brain.Sanger.29Apr14.txt
