#!/usr/local/bin/python3


#Spencer Mahaffey
#v1.0


from optparse import OptionParser


def parseOptions():
	usage = 'USAGE: %prog inputFile outputFile\n'
	parser = OptionParser(usage=usage, version="1.0")

	(opts, args) = parser.parse_args()

	errors = ''
	if len(args) < 1:
		errors += 'You must specify an input file'
	if len(args) != 2:
		errors += 'You must specify an output file'
	if errors:
		parser.error(errors)
	return (opts, args)



opts, args = parseOptions()

inFile=open(args[0],"r")
outFile=open(args[1],"w")


#read file list
EOF=0
sno={}


while(EOF==0):
	line=inFile.readline()
	if(len(line)>0):
		if(line[0]==">"):
			#save existing snoRNA
			if('chr' in sno):
				#write out snoRNA
				outFile.write(sno['chr']+"\t"+sno['start']+"\t"+sno['stop']+"\t"+sno['chr']+"_"+sno['start']+"\t"+sno['score']+"\t"+sno['strand']+"\t"+sno['Cscore']+"\t"+sno['Dscore']+"\t"+sno['Stemscore']+"\n")
			sno={}
			col=line.strip().split("\t")
			sno['chr']=col[1]
			sno['start']=col[2]
			sno['stop']=col[3]
			sno['strand']=col[7]
		else:
			if(line.startswith('#total Score:')):
				col=line.strip().split(":")
				sno['score']=col[1]
			elif(line.startswith('Query  C box')):
				col=line.strip().split(":")
				sno['Cscore']=col[1]
			elif(line.startswith('Query  D box')):
				col=line.strip().split(":")
				sno['Dscore']=col[1]
			elif(line.startswith('Query  Term Stem Score')):
				col=line.strip().split(" ")
				sno['Stemscore']=col[5]
		#sno['full']=sno['full']+line
	else:
		EOF=1

inFile.close()
outFile.close()

