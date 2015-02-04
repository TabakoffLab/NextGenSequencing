#!/usr/bin/env python
import sys

f = sys.stdin
of = sys.stdout

read1 = None
name1 = None

for read in f :
    #deal with the header
    if(read[0] == '@') :
        of.write("%s" % read)
        continue
    if(name1 == None) :
        read1 = read
        name1 = read1.split("\t")[0]
    else :
        name2 = read.split("\t")[0]
        if(name1 == name2) :
            of.write("%s%s" % (read1, read))
            read1 = None
            name1 = None
        else :
            read1 = read
            name1 = read1.split("\t")[0]
            