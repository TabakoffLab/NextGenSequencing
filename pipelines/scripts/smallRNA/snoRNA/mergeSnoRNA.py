#!/usr/local/bin/python3


#Spencer Mahaffey
#v1.0
# Feb 9 2015
# merge SnoSeeker novel results with known snoRNAs from Ensembl

from optparse import OptionParser

snoList={}
snoID=1

def parseOptions():
	usage = 'USAGE: %prog inputFileListFile OutputFilePrefix ACAminScore CDminScore\n'
	parser = OptionParser(usage=usage, version="1.0")

	(opts, args) = parser.parse_args()

	errors = ''
	if len(args) < 1:
		errors += 'You must specify a file containing the list of files and types to merge'
	if len(args) < 2:
		errors += 'You must specify a the prefix of the output files.  /path/prefix.txt and /path/prefix.fasta'
	if errors:
		parser.error(errors)
	return (opts, args)

class snoRNA:
	def __init__(self):
		self.ensemblID=''
		#self.refSeqID=''
		#self.refSeqStatus=''
		#self.miRBaseID=''
		#self.miRBaseACC=''
		#self.miRDeepStatus=''
		self.chr=''
		self.chrChars=''
		self.start=0
		self.stop=0
		#self.sequence=0
		self.strand=0
		#self.ensemblStatus=''
		self.phenogenID=''
		self.name=''
		self.maxscorebox1=0
		self.maxscorebox2=0
		self.maxscore=0
		self.type1=''
		#self.phenogenID=''

	def __lt__(self, other):
		#handle cases where chromosomes are characters
		if((self.chrChars in ['M','MT','X','Y'] or len(self.chrChars)>3) and 
			(other.chrChars in ['M','MT','X','Y'] or len(other.chrChars)>3)):
			if (self.chrChars<other.chrChars):
				return True
			elif(self.chrChars==other.chrChars):
				if(self.getStart()<other.getStart()):
					return True
				else:
					return False
			else:
				return False
		#handle case when self.chr is character
		elif(self.chrChars in ['M','MT','X','Y'] or len(self.chrChars)>3):
			return False
		#handle case when other.chr is character
		elif(other.chrChars in ['M','MT','X','Y'] or len(other.chrChars)>3):
			return True
		#handle case when both are numbers
		else:
			if(int(self.chrChars)<int(other.chrChars)):
				return True
			elif(int(self.chrChars)==int(other.chrChars)):
				if(self.getStart()<other.getStart()):
					return True
				else:
					return False

			else:
				return False

	def __gt__(self, other):
		#handle cases where chromosomes are characters
		if((self.chrChars in ['M','MT','X','Y'] or len(self.chrChars)>3) and 
			(other.chrChars in ['M','MT','X','Y'] or len(other.chrChars)>3)):
			if (self.chrChars>other.chrChars):
				return True
			elif(self.chrChars==other.chrChars):
				if(self.getStart()>other.getStart()):
					return True
				else:
					return False
			else:
				return False
		#handle case when self.chr is character
		elif(self.chrChars in ['M','MT','X','Y'] or len(self.chrChars)>3):
			return True
		#handle case when other.chr is character
		elif(other.chrChars in ['M','MT','X','Y'] or len(other.chrChars)>3):
			return False
		#handle case when both are numbers
		else:
			if(int(self.chrChars)>int(other.chrChars)):
				return True
			elif(int(self.chrChars)==int(other.chrChars)):
				if(self.getStart()>other.getStart()):
					return True
				else:
					return False

			else:
				return False


	def __eq__(self, other):
		if (self.getChromosome()==other.getChromosome()):
			if(self.getStart()==other.getStart()):
				return True
			else:
				return False
		else:
			return False
	def __ne__(self, other):
		if (self.getChromosome()!=other.getChromosome()):
			return True
		if(self.getStart()!=other.getStart()):
			return True
		else:
			return False

	def isSameSnoRNA(self,sno2):
		#if( (len(self.getEnsemblID())>0 and self.getEnsemblID() == mir2.getEnsemblID()) or 
			#(len(self.getRefSeqID())>0 and self.getRefSeqID() == mir2.getRefSeqID()) or 
		#	(len(self.getMirBaseID())>0 and self.getMirBaseID() == mir2.getMirBaseID()) or 
		#	(len(self.getMirBaseAcc())>0 and self.getMirBaseAcc() == mir2.getMirBaseAcc())):
		#	if(self.getChromosome()==mir2.getChromosome() and self.getStrand()==mir2.getStrand()):
		#		return True
		#else:
		if(  (self.getType()=="ACA" and sno2.getType()=="CD") or (self.getType()=="CD" and sno2.getType()=="ACA") ):
			return False


		if(self.getChromosome()==sno2.getChromosome() and self.getStrand()==sno2.getStrand()):
			startDiff=abs(self.getStart()-sno2.getStart())
			stopDiff=abs(self.getStop()-sno2.getStop())
			if(startDiff>600 or stopDiff>600):
				return False
			sumDiff=startDiff+stopDiff
			if(startDiff<25 and stopDiff<25):
				return True
			elif(sumDiff<50):
				return True
			elif(self.getStart()<=sno2.getStart() and sno2.getStop()<=self.getStop()):
				return True
			else:
				overlap=0
				if(self.getStart()<=sno2.getStart() and sno2.getStart()<=self.getStop()):
					overlap=self.getStop()-sno2.getStart()
				elif(self.getStart()<=sno2.getStop() and sno2.getStop()<=self.getStop()):
					overlap=sno2.getStop()-self.getStart()

				overlap=overlap/(self.getStop()-self.getStart())*100
				if(overlap>=25):
					return True
				else:
					#if(sumDiff<100 or overlap>10):
					#	print ("sno difference above cutoff:",self.getChromosome(),"\n",str(self.getStart()),"-",str(self.getStop()),"\t",self.getName().strip())
					#	print (str(sno2.getStart()),"-",str(sno2.getStop()),"\t",sno2.getName(),"\n",sumDiff,"\t",overlap)
					return False
		else:
			return False


	def mergeSnoRNA(self,sno2):
		#adjust start/stop
		if(self.getStart()>sno2.getStart()):
			self.start=sno2.getStart()
		if(self.getStop()<sno2.getStop()):
			self.stop=sno2.getStop()
		if(sno2.getMaxScoreBox1()>0):
			self.setMaxScoreBox1(sno2.getMaxScoreBox1())
		if(sno2.getMaxScoreBox2()>0):
			self.setMaxScoreBox2(sno2.getMaxScoreBox2())
		if(sno2.getMaxScore()>0):
			self.setMaxScore(sno2.getMaxScore())
		if(len(sno2.getEnsemblID())>0):
			self.setEnsemblID(sno2.getEnsemblID())
		if(len(sno2.getPhenogenID())>0):
			self.setPhenogenID(sno2.getPhenogenID())


	def setEnsemblID(self,ensID):
		if(len(self.ensemblID)>0):
			ensID=self.ensemblID+" | "+ensID
		self.ensemblID=ensID
	def getEnsemblID(self):
		return self.ensemblID
	def setPhenogenID(self,id):
		if(len(self.phenogenID)==0):
			self.phenogenID=id
	def getPhenogenID(self):
		return self.phenogenID
	def setChromosome(self,chrom):
		if(len(chrom)<3 or (not chrom.startswith("chr"))):
			chrom="chr"+chrom
		self.chr=chrom
		self.chrChars=chrom[3:]
	def getChromosome(self):
		return self.chr
	def setStartStop(self,start,stop):
		if(start>stop):
			self.stop=start
			self.start=stop
		else:
			self.start=int(start)
			self.stop=int(stop)
	def getStart(self):
		return self.start
	def getStop(self):
		return self.stop
	def setStrand(self,strand):
		if(strand=='.'):
			strand=0
		if(strand=='+'):
			strand=1
		if(strand=='-'):
			strand=-1
		self.strand=int(strand)
	def getStrand(self):
		return self.strand
	def setMaxScoreBox1(self,b1):
		if(self.maxscorebox1<b1):
			self.maxscorebox1=b1
	def setMaxScoreBox2(self,b2):
		if(self.maxscorebox2<b2):
			self.maxscorebox2=b2
	def setMaxScore(self,score):
		if(self.maxscore<score):
			self.maxscore=score
	def getMaxScore(self):
		return self.maxscore
	def getMaxScoreBox1(self):
		return self.maxscorebox1
	def getMaxScoreBox2(self):
		return self.maxscorebox2
	def setName(self,name):
		self.name=name
	def getName(self):
		return self.name
	def setType(self,type1):
		self.type1=type1
	def getType(self):
		return self.type1



def generateName():
	global snoID
	newID=str(snoID).zfill(8)
	newID="PSNO"+newID
	return newID

#sub process Ensembl
def processEnsembl(file,miRList):
	inFile=open(file,"r")
	inFile.readline()
	line=inFile.readline()
	while(len(line)>0):
		sno=snoRNA()
		col=line.strip().split(",")
		sno.setEnsemblID(col[0])
		sno.setChromosome(col[2])
		sno.setStartStop(col[3],col[4])
		sno.setStrand(col[5])
		sno.setName(col[0])
		found=0
		if sno.getChromosome() in snoList:
			for existing in snoList[sno.getChromosome()]:
				if(existing.isSameSnoRNA(sno)):
					existing.mergeSnoRNA(sno)
					found=1
					break
		else:
			snoList[sno.getChromosome()]=[]
		if(found==0):
			snoList[sno.getChromosome()].append(sno)

		line=inFile.readline()
	inFile.close()

#sub process SnoSeeker ACA unknown
def processACANovel(file,miRList,minACA):
	global snoID
	inFile=open(file,"r")
	line=inFile.readline()
	lc=0
	#processed={}
	while(len(line)>0):
		sno=snoRNA()
		col=line.strip().split("\t")
		sno.setPhenogenID(generateName())
		snoID=snoID+1
		sno.setChromosome(col[0])
		sno.setStartStop(int(col[1]),int(col[2]))
		sno.setStrand(col[5])
		sno.setMaxScore(float(col[4]))
		sno.setMaxScoreBox1(float(col[6]))
		sno.setMaxScoreBox2(float(col[7]))
		sno.setType("ACA")
		if(sno.getMaxScore()>=minACA):
			found=0
			if sno.getChromosome() in snoList:
				for existing in snoList[sno.getChromosome()]:
					if(existing.isSameSnoRNA(sno)):
						existing.mergeSnoRNA(sno)
						snoID=snoID-1
						found=1
						break
			else:
				snoList[sno.getChromosome()]=[]
			if(found==0):
				snoList[sno.getChromosome()].append(sno)
		line=inFile.readline()
		lc+=1
		if(lc%10000==0):
			print ("process aca:",lc)
	inFile.close()

#sub process SnoSeeker CD unknown
def processCDNovel(file,miRList,minCD):
	global snoID
	inFile=open(file,"r")
	line=inFile.readline()
	lc=0
	while(len(line)>0):
		sno=snoRNA()
		col=line.strip().split("\t")
		sno.setPhenogenID(generateName())
		snoID=snoID+1
		sno.setChromosome(col[0])
		sno.setStartStop(int(col[1]),int(col[2]))
		sno.setStrand(col[5])
		sno.setMaxScore(float(col[4]))
		sno.setMaxScoreBox1(float(col[6]))
		sno.setMaxScoreBox2(float(col[7]))
		sno.setType("CD")
		if(sno.getMaxScore()>=minCD):
			found=0
			if sno.getChromosome() in snoList:
				for existing in snoList[sno.getChromosome()]:
					#if(count==0 and len(existing.getEnsemblID())==0):
					#	break
					if(existing.isSameSnoRNA(sno)):
						existing.mergeSnoRNA(sno)
						snoID=snoID-1
						found=1
						break
			else:
				snoList[sno.getChromosome()]=[]
			if(found==0):
				snoList[sno.getChromosome()].append(sno)
		line=inFile.readline()
		lc+=1
		if(lc%1000==0):
			print ("process cd:",lc)
	inFile.close()




opts, args = parseOptions()

fileListFile=open(args[0],"r")

minACA=0
minCD=0

if(len(args)>2):
	minACA=int(args[2])
if(len(args)>3):
	minCD=int(args[3])

#read file list
EOF=0


while(EOF==0):
	line=fileListFile.readline()
	if(len(line)>0):
		col=line.strip().split("\t")
		#process files
		if(col[1]=='Ensembl'):
			processEnsembl(col[0],snoList)
		elif(col[1]=='snoACA'):
			processACANovel(col[0],snoList,minACA)
		elif(col[1]=='snoCD'):
			processCDNovel(col[0],snoList,minCD)
	else:
		EOF=1
	total=0
	for key in snoList:
		total=total+len(snoList[key])
	print(col[1]+":"+str(total))

fileListFile.close()

#output results
outList=open(args[1]+".txt","w")
internalID=0
for key in snoList:
	l=snoList[key]
	l.sort()
	for sno in l:
		internalID=internalID+1
		if(len(sno.getName())==0):
			if(len(sno.getEnsemblID())>0):
				mbIDList=sno.getEnsemblID()
				firstIDList=mbIDList[0].split("-")
				firstID=firstIDList[1]+firstIDList[2]
				sno.setName(firstID)
		outList.write("sno"+str(internalID).zfill(8)+"\t"+sno.getName()+"\t"+sno.getType()+"\t")
		outList.write(sno.getChromosome()+"\t"+str(sno.getStart())+"\t"+str(sno.getStop())+"\t"+str(sno.getStrand())+"\t")
		outList.write(sno.getChromosome()[3:]+"\t"+str(sno.getStop()-sno.getStart())+"\n")

outList.close()