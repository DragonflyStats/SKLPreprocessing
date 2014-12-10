
# Inputs

TEMP=DATA5[,50:500]
List1 <- grep("name",names(TEMP))
List2 <- grep("dob",names(TEMP))

KeepList = c("group","hhold","id","teacher_id","pup_id","school_id","w3intname","p8dobw3","p10namew3","p10dobw3","p9dobw3")
KeepList <- c(KeepList,List1,List2)
KeepIndices = which(colnames(TEMP) %in% KeepList )




#######################################

# Derived Values

nVars = ncol(TEMP)


#######################################

## Delete Empty Variables

deleteList = numeric()

for ( i in 1:nVars)
{
 if (  all(is.na(TEMP[,i])) ) 
   {
   deleteList= c(deleteList,i)
   }
}

TEMP = TEMP[,-deleteList]
nVars = ncol(TEMP)
nVars




#######################################
##  Delete "Keep List" Variables

KeepIndices = which(colnames(TEMP) %in% KeepList )

TEMP = TEMP[,-KeepIndices]
nVars = ncol(TEMP)
nVars



#######################################
## Delete Continuous Variables or Case Specific Responses


## Threshold 200

Threshold = 200

nCat = numeric(nVars)
deleteList = numeric()

for(i in 1:nVars)
{
 nCat[i]=length(table(TEMP[,i]))
 if ( nCat[i] > Threshold ) 
   {
   deleteList= c(deleteList,i)
   }
}

TEMP = TEMP[,-deleteList]
nVars = ncol(TEMP)
nVars





#######################################

varNames =colnames(TEMP)


nCat = numeric(nVars)
nCat = numeric(nVars)
numCatsScale = numeric(nVars)
smallCat = character(nVars)
modeCat = character(nVars)
numNulls = numeric(nVars)

sizeSmallCat = numeric(nVars)
for(i in 1:nVars)
{

# if ( !is.element(i, KeepIndices) )
#  {
#  TEMP[,i] = as.factor(TEMP[,i])
# }

modeCat[i] = mode(TEMP[,i])
nCat[i]=length(table(TEMP[,i]))
numCatsScale[i] = nchar(nCat[i])
numNulls[i] = sum(as.numeric(is.na(TEMP[,i])))
smallCat[i] = names(sort(table(TEMP[,i]))[1])


temp = sort(table(TEMP[,i]))[1] 
names(temp) = NULL
sizeSmallCat[i] = temp
}


# varRetain = rep(TRUE,nVars)

varReport = data.frame(varNames,modeCat,nCat,numCatsScale,smallCat,sizeSmallCat,numNulls)

#################################################################

nVars = nrow(varReport)

deleteList = numeric()

for(i in 1:nVars)
{
  if ( ( nchar(smallCat[i]) >10 )  & (numNulls[i] == 0) ) 
   {
   deleteList= c(deleteList,i)
   }
}

varReport = varReport[-deleteList,]




#################################################################

varReport <- varReport[order(sizeSmallCat),]




varReport


