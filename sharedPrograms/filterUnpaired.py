#!/share/apps/python-3.4.2/bin/python3

#input samFile1, samFile2
#
#output to STDOUT all samFile2 lines with paired reads in samFile1  assumes names in column 0 match exactly
#
#Note: Assumes roughly the same order of reads in both files.
#buffersize (Below) controls the amount of memory used and buffer for differences in order between files.
#If files1 and files2 differ by more reads than the buffer you may use a lot more RAM than expected as missed 
#read names are kept in memory so pairs throughout the file are not accidentally missed.
#After buffersize reads buffer will contain reads for file2 from currentFile1Position +- buffersize/2
#
#Note: specifically written to only output reads corresponding to file1 so you can pipe output to perform additional manipulation.
#

import sys,re,collections

buffersize=5000000
halfbuffer=buffersize/2

file1name=sys.argv[2]
file2name=sys.argv[1]

file = open(file2name, 'r')
file1= open(file1name,'r')

#variable to store lines in File2 not yet found in File1
#helps avoid missing a pair that may be out of order, but 
#can dramatically increase RAM usage if files are not in the same order
file2NotFound={}

#ordereddict to store the buffer read names
file2dict=collections.OrderedDict.fromkeys('')

f2Count=0
for line in file:
	col=re.split(r'\t+', line)
	#add read name to dictionary
	file2dict[col[0]]=1
	#when half of buffer is full start reading file1
	if f2Count>halfbuffer:
		line1=file1.readline()
		col1=re.split(r'\t+', line1)
		#check dict for read name
		if col1[0] in file2dict:
			#set dict to 0 if found
			file2dict[col1[0]]=0
			#read is paired print it
			print(line1)
		#check not found dict for an out of order read
		elif col1[0] in file2NotFound:
			#found now remove to save RAM
			del file2NotFound[col1[0]]
			#read is paired print it
			print(line1)
	#if buffer is full start removing from the top (FIFO)
	if f2Count>buffersize:
		rem=file2dict.popitem(last=False)
		#if not found add to not found dict
		if rem[1]==1:
			file2NotFound[rem[0]]=1
	f2Count=f2Count+1

#finish the last lines of file1 no more to add to buffer so nothing to do for file2
for line in file1:
	col=re.split(r'\t+', line)
	if col[0] in file2dict:
		print(line)
	elif col[0] in file2NotFound:
		del file2NotFound[col[0]]
		print(line)
#clean up
file.close()
file1.close()

