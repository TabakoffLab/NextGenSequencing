#!/Library/Frameworks/Python.framework/Versions/3.2/bin/python3


#Spencer Mahaffey
#v1.0
# November 19 2015
# merge MirDeep novel results with known miRNAs from Ensembl and RefSeq

from optparse import OptionParser

miRList=[]
miRID=1

def parseOptions():
	usage = 'USAGE: %prog inputFileListFile OutputFilePrefix\n'
	parser = OptionParser(usage=usage, version="1.0")

	(opts, args) = parser.parse_args()

	errors = ''
	if len(args) < 1:
		errors += 'You must specify a file containing the list of files and types to merge'
	if len(args) != 2:
		errors += 'You must specify a the prefix of the output files.  /path/prefix.txt and /path/prefix.fasta'
	if errors:
		parser.error(errors)
	return (opts, args)

class miRNA:
	def __init__(self):
		self.ensemblID=''
		self.refSeqID=''
		self.refSeqStatus=''
		self.miRBaseID=''
		self.miRBaseACC=''
		self.miRDeepStatus=''
		self.chr=''
		self.chrChars=''
		self.start=0
		self.stop=0
		self.sequence=0
		self.strand=0
		self.ensemblStatus=''
		self.phenogenID=''
		self.name=''
		self.phenogenID=''

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

	def isSameMiRNA(self,mir2):
		#if( (len(self.getEnsemblID())>0 and self.getEnsemblID() == mir2.getEnsemblID()) or 
			#(len(self.getRefSeqID())>0 and self.getRefSeqID() == mir2.getRefSeqID()) or 
		#	(len(self.getMirBaseID())>0 and self.getMirBaseID() == mir2.getMirBaseID()) or 
		#	(len(self.getMirBaseAcc())>0 and self.getMirBaseAcc() == mir2.getMirBaseAcc())):
		#	if(self.getChromosome()==mir2.getChromosome() and self.getStrand()==mir2.getStrand()):
		#		return True
		#else:
		if(self.getChromosome()==mir2.getChromosome() and self.getStrand()==mir2.getStrand()):
			startDiff=abs(self.getStart()-mir2.getStart())
			stopDiff=abs(self.getStop()-mir2.getStop())
			sumDiff=startDiff+stopDiff
			if(startDiff<25 and stopDiff<25):
				return True
			elif(sumDiff<50):
				return True
			elif(self.getStart()<=mir2.getStart() and mir2.getStop()<=self.getStop()):
				return True
			else:
				overlap=0
				if(self.getStart()<=mir2.getStart() and mir2.getStart()<=self.getStop()):
					overlap=self.getStop()-mir2.getStart()
				elif(self.getStart()<=mir2.getStop() and mir2.getStop()<=self.getStop()):
					overlap=mir2.getStop()-self.getStart()

				overlap=overlap/(self.getStop()-self.getStart())*100
				if(overlap>=25):
					return True
				else:
					if(sumDiff<100 or overlap>10):
						print ("mir difference above cutoff:",self.getChromosome(),"\n",str(self.getStart()),"-",str(self.getStop()),"\t",self.getName().strip())
						print (str(mir2.getStart()),"-",str(mir2.getStop()),"\t",mir2.getName(),"\n",sumDiff,"\t",overlap)
					return False
		else:
			return False

	def mergeMiRNA(self,mir2):
		#adjust start/stop
		if(self.getStart()>mir2.getStart()):
			self.start=mir2.getStart()
		if(self.getStop()<mir2.getStop()):
			self.stop=mir2.getStop()
		if(len(mir2.getEnsemblID())>0):
			self.setEnsemblID(mir2.getEnsemblID())
			self.setEnsemblStatus(mir2.getEnsemblStatus())
		if(len(mir2.getRefSeqID())>0):
			self.setRefSeqID(mir2.getRefSeqID())
			self.setRefSeqStatus(mir2.getRefSeqStatus())
			self.setName(mir2.getName())
		if(len(mir2.getMirBaseID())>0):
			self.setMirBaseID(mir2.getMirBaseID())
			self.setMirBaseAcc(mir2.getMirBaseAcc())
		if(len(mir2.getPhenogenID())>0):
			self.setPhenogenID(mir2.getPhenogenID())
		if(len(mir2.getMirDeepStatus())>0):
			self.setMirDeepStatus(mir2.getMirDeepStatus())

	def setEnsemblID(self,ensID):
		if(len(self.ensemblID)>0):
			ensID=self.ensemblID+" | "+ensID
		self.ensemblID=ensID
	def getEnsemblID(self):
		return self.ensemblID
	def setEnsemblStatus(self,ensStat):
		self.ensemblStatus=ensStat
	def getEnsemblStatus(self):
		return self.ensemblStatus
	def setRefSeqID(self,refID):
		if(len(self.refSeqID)>0):
			refID=self.refSeqID+" | "+refID
		self.refSeqID=refID
	def getRefSeqID(self):
		return self.refSeqID
	def setRefSeqStatus(self,status):
		self.refSeqStatus=status
	def getRefSeqStatus(self):
		return self.refSeqStatus
	def setMirBaseID(self,id):
		if(len(self.miRBaseID)>0):
			id=self.miRBaseID+" | "+id
		self.miRBaseID=id
	def getMirBaseID(self):
		return self.miRBaseID
	def setMirBaseAcc(self,acc):
		if(len(self.miRBaseACC)>0):
			acc=self.miRBaseACC+" | "+acc
		self.miRBaseACC=acc
	def getMirBaseAcc(self):
		return self.miRBaseACC
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
	def setSequence(self,seq):
		self.sequence=seq
	def getSequence(self):
		return self.sequence
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
	def setName(self,name):
		self.name=name
	def getName(self):
		return self.name
	def setMirDeepStatus(self,status):
		self.miRDeepStatus=status
	def getMirDeepStatus(self):
		return self.miRDeepStatus



def generateName():
	global miRID
	newID=str(miRID).zfill(8)
	newID="PMI"+newID
	return newID

#sub process Ensembl
def processEnsembl(file,miRList):
	inFile=open(file,"r")
	inFile.readline()
	line=inFile.readline()
	while(len(line)>0):
		mir=miRNA()
		col=line.strip().split(",")
		mir.setEnsemblID(col[0])
		mir.setMirBaseID(col[1])
		mir.setMirBaseAcc(col[2])
		mir.setChromosome(col[4])
		mir.setStartStop(col[5],col[6])
		mir.setStrand(col[7])
		mir.setEnsemblStatus(col[11].strip())
		found=0
		for existing in miRList:
			if(existing.isSameMiRNA(mir)):
				existing.mergeMiRNA(mir)
				found=1
				break
		if(found==0):
			miRList.append(mir)

		line=inFile.readline()
	inFile.close()
#sub process RefSeq
def processRefSeq(file,miRList):
	inFile=open(file,"r")
	inFile.readline()
	line=inFile.readline()
	while(len(line)>0):
		mir=miRNA()
		col=line.strip().split(",")
		mir.setRefSeqID(col[1])
		mir.setChromosome(col[2])
		mir.setStartStop(int(col[4]),int(col[5]))
		mir.setStrand(col[3])
		mir.setName(col[12])
		mir.setRefSeqStatus(col[17].strip())
		found=0
		for existing in miRList:
			if(existing.isSameMiRNA(mir)):
				existing.mergeMiRNA(mir)
				found=1
				break
		if(found==0):
			miRList.append(mir)
		line=inFile.readline()
	inFile.close()
#sub process miRDeep unknown
def processMDNovel(file,miRList):
	global miRID
	inFile=open(file,"r")
	line=inFile.readline()
	while(len(line)>0):
		mir=miRNA()
		col=line.strip().split("\t")
		if(col[3].startswith("novel")):
			mir.setPhenogenID(generateName())
			miRID=miRID+1
			mir.setChromosome(col[0])
			mir.setStartStop(int(col[1]),int(col[2]))
			mir.setStrand(col[5])
			found=0
			for existing in miRList:
				if(existing.isSameMiRNA(mir)):
					existing.mergeMiRNA(mir)
					miRID=miRID-1
					found=1
					break
			if(found==0):
				miRList.append(mir)
		line=inFile.readline()
	inFile.close()

#sub process miRDeep known
def processMDKnown(file,fileKey,miRList):
	global miRID
	key={}
	inFileKey=open(fileKey,"r")
	line=inFileKey.readline()
	start=False
	while(len(line)>0):
		col=line.strip().split("\t")
		if(not start):
			if(col[0].startswith("mature miRBase")):
				line=inFileKey.readline()
				start=True
		else:
			if(col[0].startswith("#miRBase miRNAs not detected by miRDeep2")):
				start=False
			elif(len(col)>9):
				idList=col[9].split("_")
				mirname=idList[0][4:]
				if(mirname[-3:]=="-5p" or mirname[-3:]=="-3p"):
					mirname=mirname[:-3]
				key[col[0]]=mirname
		line=inFileKey.readline()
	inFileKey.close()

	inFile=open(file,"r")
	line=inFile.readline()
	while(len(line)>0):
		mir=miRNA()
		col=line.strip().split("\t")
		if(col[3].startswith("known")):

			mir.setName(key[col[3][6:]])
			mir.setChromosome(col[0])
			mir.setStartStop(int(col[1]),int(col[2]))
			mir.setStrand(col[5])
			mir.setMirDeepStatus("known")
			found=0
			for existing in miRList:
				if(existing.isSameMiRNA(mir)):
					existing.mergeMiRNA(mir)
					found=1
					break
			if(found==0):
				miRList.append(mir)
		line=inFile.readline()
	inFile.close()



opts, args = parseOptions()

fileListFile=open(args[0],"r")

#read file list
EOF=0

while(EOF==0):
	line=fileListFile.readline()
	if(len(line)>0):
		col=line.strip().split("\t")
		#process files
		if(col[1]=='Ensembl'):
			processEnsembl(col[0],miRList)
		elif(col[1]=='RefSeq'):
			processRefSeq(col[0],miRList)
		elif(col[1]=='mirDeep'):
			processMDNovel(col[0],miRList)
			processMDKnown(col[0],col[2],miRList)
	else:
		EOF=1
	print(col[1]+":"+str(len(miRList)))

fileListFile.close()

#output results
outList=open(args[1]+".txt","w")
miRList.sort()
internalID=0
for mir in miRList:
	internalID=internalID+1
	if(len(mir.getName())==0):
		if(len(mir.getMirBaseID())>0):
			mbIDList=mir.getMirBaseID().split("|")
			firstIDList=mbIDList[0].split("-")
			firstID=firstIDList[1]+firstIDList[2]
			mir.setName(firstID)
	outList.write("mi"+str(internalID).zfill(8)+"\t"+mir.getName()+"\t"+mir.getEnsemblID()+"\t"+mir.getRefSeqID()+"\t"+mir.getMirBaseAcc()+"\t"+mir.getMirBaseID()+"\t"+mir.getPhenogenID()+"\t")
	outList.write(mir.getChromosome()+"\t"+str(mir.getStart())+"\t"+str(mir.getStop())+"\t"+str(mir.getStrand())+"\t")
	outList.write(mir.getEnsemblStatus()+"\t"+mir.getRefSeqStatus()+"\t"+mir.getMirDeepStatus()+"\t"+str(mir.getStop()-mir.getStart())+"\n")

outList.close()