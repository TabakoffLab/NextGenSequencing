#!/Library/Frameworks/Python.framework/Versions/3.2/bin/python3


#Spencer Mahaffey
#v1.0
# November 24 2015
# read mergeMiRNA.py results and generate strain specific fasta file
import sys,re
from optparse import OptionParser

def parseOptions():
	usage = 'USAGE: %prog miRNAListFile ssgFastaFile outputFile\n'
	parser = OptionParser(usage=usage, version="1.0")

	(opts, args) = parser.parse_args()

	errors = ''
	if len(args) < 3:
		errors += 'You must specify:\n miRNAListFile\nssgFastaFile\noutputFile'
	if errors:
		parser.error(errors)
	return (opts, args)

class Fasta:
	def __init__(self,fastaFile,chrPrefix):
		#open file
		self.fasta=open(fastaFile,"r")
		self.fileName=fastaFile
		self.chrPrefix=chrPrefix
		self.chr=''
		self.chrLine=''
		self.nextChr=''
		self.nextChrLine=''
		self.loopBack=False
		self.EOF=False
		#initialize first chromosome
		self.readNextChr()
	def hasNext(self):
		next=True
		if(self.EOF):
			next=False
		if self.nextChr=='':
			next=False
		return next

	def getChrRange(self,chromosome,start,stop,strand):
		if(self.chr!=chromosome):
			self.readChr(chromosome)
		seq=''
		if(self.chr==chromosome):
			seq=self.chrSeq[start:stop]
			if(strand==-1):
				rev=seq[::-1]
				revcomp=''
				for c in rev:
					if(c.upper()=='A'):
						revcomp=revcomp+'T'
					elif(c.upper()=='T'):
						revcomp=revcomp+'A'
					elif(c.upper()=='G'):
						revcomp=revcomp+'C'
					elif(c.upper()=='C'):
						revcomp=revcomp+'G'
					elif(c.upper()=='N'):
						revcomp=revcomp+'N'
					else:
						print('udefined nucleotide ',c.upper(),"\n")
						revcomp=revcomp+'N'
				seq=revcomp

		return seq

	def readChr(self,chromosome):
		#print('readChr cur=',self.chr,' looking for:',chromosome)
		print('readChr cur=',self.chr,' looking for:',chromosome)
		while self.chr!=chromosome and (not self.EOF and not self.loopBack):
			#print('while readChr cur=',self.chr,' next=',self.nextChr)
			print('readChr cur=',self.chr,' looking for:',chromosome)
			if self.nextChr==chromosome:
				#print('readNextChr')
				self.readNextChr()
			else:
				#print('skipNextChr')
				self.skipNextChr()
		#print('end while')
		if self.EOF and not self.loopBack:
			self.fasta.seek(0)
			self.chr=''
			self.chrLine=''
			self.nextChr=''
			self.nextChrLine=''
			self.EOF=False
			self.loopBack=True
			self.readNextChr()
			self.readChr(chromosome)
		else:
			if self.EOF and self.loopBack:
				print >> sys.stderr, chromosome, ' not found in fasta ', self.fileName, ' exiting\n'
				sys.exit(1)
			else:
				if self.chr==chromosome:
					self.loopBack=False

	def readNextChr(self):
		seqLines=[]
		self.chrSeq=''
		line=self.fasta.readline()

		#if not initialized run this to setup
		if self.chr=='' and self.nextChr=='':
			while (len(line)>0 and line[0]!='>'):
				line=self.fasta.readline()
			
			pattern=re.compile("\s|\|")
			match=pattern.search(line)
			if match:
				self.chr=self.chrPrefix+line[1:match.start()]
			else:
				self.chr=self.chrPrefix+line[1:]
			self.chrLine=line
			line=self.fasta.readline()
		#otherwise advance nextChr to chr
		else:
			self.chr=self.nextChr
			self.chrLine=self.nextChrLine
		
		#read until next '>' line or EOF
		while (len(line)>0 and line[0]!='>' ):
			seqLines.append(line.strip())
			line=self.fasta.readline();

		self.chrSeq=''.join(seqLines)

		if len(line)>0:
			pattern=re.compile("\s|\|")
			match=pattern.search(line)
			if match:
				self.nextChr=self.chrPrefix+line[1:match.start()]
			else:
				self.nextChr=self.chrPrefix+line[1:]
			self.nextChrLine=line
		else:
			self.EOF=True
			self.nextChr=''
			self.nextChrLine=''
		#print("done readNextChr")
		#print(self.chr)
		#print(len(self.chrSeq))

	def skipNextChr(self):
		
		line=self.fasta.readline();
		while (len(line)>0 and line[0]!='>'):
			line=self.fasta.readline();

		if len(line)>0:
			pattern=re.compile("\s|\|")
			match=pattern.search(line)
			if match:
				self.nextChr=self.chrPrefix+line[1:match.start()]
			else:
				self.nextChr=self.chrPrefix+line[1:]
			self.nextChrLine=line
		else:
			self.EOF=True
			self.nextChr=''
			self.nextChrLine=''
		#print ('skip next chr next=',self.nextChr,' cur=',self.chr)#!/Library/Frameworks/Python.framework/Versions/3.2/bin/python3



def formatSeq(seq):
	newSeq=''
	total=len(seq)
	pos=0
	while((pos+80)<total):
		newSeq=newSeq+seq[pos:(pos+80)]+"\n"
		pos=pos+80
	if(pos<total):
		newSeq=newSeq+seq[pos:]
	return newSeq

opts, args = parseOptions()

fileListFile=open(args[0],"r")
fasta=Fasta(args[1],'')
fastaFile=open(args[2],"w")
#read file list
EOF=0


while(EOF==0):
	line=fileListFile.readline()
	if(len(line)>0):
		col=line.strip().split("\t")
		name=col[1]
		if(len(name)==0):
			name=col[2]
		if(len(name)==0):
			name=col[3]
		if(len(name)==0):
			name=col[5]
		if(len(name)==0):
			name=col[6]
		
		seq=fasta.getChrRange(col[7][3:],int(col[8]),int(col[9]),int(col[10]))

		if(len(seq)>0):
			fastaFile.write("> "+col[0]+"_"+name+" | "+col[7]+":"+col[8]+":"+col[9]+":"+col[10]+"\n")
			fastaFile.write(formatSeq(seq)+"\n")
	else:
		EOF=1
	
fileListFile.close()
fastaFile.close()
