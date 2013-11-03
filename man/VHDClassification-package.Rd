\name{VHDClassification-package}
\alias{VHDClassification-package}
\alias{VHDClassification}
\alias{predict-methods}
\docType{package}
\title{
Discrimination-Classification in very high dimension with linear and quadratic rules.
}
\description{
This package provides an implementation of Linear disciminant analysis 
and quadratic discriminant analysis that works fine in very high dimension 
(when there are many more variables than observations). 
}
\details{
\tabular{ll}{
Package: \tab VHDClassification\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2010-04-15\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
Depends: \tab methods, e1071, lattice, stats\cr
}
This package provides learning procedure for classification in very high dimension. 
Binary learning is done with \code{\link{learnBinaryRule}} while K-class (K>=2) learning is done 
with function \code{\link{learnPartitionWithLLR}}. 

\code{\link{learnBinaryRule}} can return an object \code{\link{LinearRule-class}} or an object \code{\link{QuadraticRule-class}} depending 
whether type='linear' or 'quadratic'. 
\code{\link{learnPartitionWithLLR}} basically returns a set of binary rules which is represented by the class \code{\link{PartitionWithLLR-class}}. 
The used procedure for the learning are described in the papers cited below. The 


The method predict (\link{predict-methods}) is implemented for class \code{\link{LinearRule-class}} \code{\link{QuadraticRule-class}} \code{\link{learnPartitionWithLLR}}. 
It predicts the class of a new observation.  
}
\author{
Maintainer-author: Robin Girard <robin.girard@mines-paristech.fr>
}
\references{
Fast rate of convergence in high dimensional linear discriminant analysis. R. Girard To appear in Journal of Nonparametric Statistics.\\
Very high dimensional discriminant analysis with thresholding estimation. R. Girard.  Submitted. 

}
\keyword{ discrimination  }
\keyword{ LDA  }
\keyword{ QDA  }
\keyword{ high dimension  }
\keyword{ classification }
\keyword{ dimension reduction }
\seealso{
}
\examples{
############ Tests 2 classes when the true rule should be quadratic
#library(VHDClassification)
p=500; n=50 ; mu=array(0,c(p,2)) ; C=array(c(1,20),c(p,2)); C[c(1,3,5),1]=40
x=NULL; y=NULL;
for (k in 1:2){x=rbind(x,t(array(C[,k]^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))}
#Learning
LearnedQuadBinaryRule=learnBinaryRule(x,y,type='quadratic')
LearnedLinBinaryRule=learnBinaryRule(x,y) # default is linear type
# for comparison with SVM
# require(e1071)
# svmRule=best.tune('svm',train.x=x,train.y=factor(y),ranges=list(gamma=c(2^(-4:4),cost = 2^(-2:2))))
# for comparison with randomForest
require(randomForest)
RF <- best.tune('randomForest',x,factor(y),ranges=list(ntree = c(100,500)))
# for comparison with nearest chrunken centroid
#require(pamr)
#myTrainingdata=list(x=t(x),y=y)
#mytrain <- pamr.train(myTrainingdata)
#mycv <- pamr.cv(mytrain,myTrainingdata)
#thresh=try(mycv$threshold[which.min(mycv$error)],silent = TRUE)




#Testing Set
x=NULL; y=NULL;
for (k in 1:2){
    x=rbind(x,t(array(C[,k]^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))    
}
#Testing
myTestingdata=list(x=x,y=y)
QDAScore=mean((y!=predict(LearnedQuadBinaryRule,myTestingdata$x))) ;
LDAScore=mean((y!=predict(LearnedLinBinaryRule,myTestingdata$x))) ;
RFScore=mean((y!=predict(RF,myTestingdata$x))) ;
#SVMScore=mean((y!=predict(svmRule,x))) ;
#comparison with nearest chrunken centroid
myTestingdata=list(x=t(x),y=y)
#SCScore=mean((myTestingdata$y!=as.numeric(pamr.predict(mytrain, myTestingdata$x,threshold=thresh,type="class"))))
cat('\n')
cat('What does it cost to use type=linear  when the rule  is quadratic ? ','\n',
'Score of the linear rule: ',LDAScore,'\n',
'Score of the quadratic rule: ',QDAScore,'\n',
#'Score of the nearest shrunken centroid rule: ',SCScore,'\n',
'Score of the random forest rule: ',RFScore,'\n',
#'Score of the support vector machine rule: ',SVMScore,'\n',
'Note: These scores should be average for a large number of experiment or interpreted carefully \n')
plotClassifRule(LearnedQuadBinaryRule)

############ Tests 2 classes quadratic and linear. when the true is linear 
#library(VHDClassification)
#p=100; n=50 ; mu=array(0,c(p,2)); mu[1:10,1]=1 ;C=array(c(1,20),p)
#x=NULL; y=NULL;
#for (k in 1:2){
#	x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
#    y=c(y,array(k,n))}
#Learning
#LearnedQuadBinaryRule=learnBinaryRule(x,y,type='quadratic')
#LearnedLinBinaryRule=learnBinaryRule(x,y) # default is linear type
#comparison with nearest chrunken centroid
#require(pamr)
#myTrainingdata=list(x=t(x),y=y)
#mytrain <- pamr.train(myTrainingdata)
#mycv <- pamr.cv(mytrain,myTrainingdata)
#thresh=try(mycv$threshold[which.min(mycv$error)],silent = TRUE)


#Testing Set
#x=NULL; y=NULL;
#for (k in 1:2){
#    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
#    y=c(y,array(k,n))    
#}
#Testing
#myTestingdata=list(x=x,y=y)
#QDAScore=mean((y!=predict(LearnedQuadBinaryRule,myTestingdata$x))) ;
#LDAScore=mean((y!=predict(LearnedLinBinaryRule,myTestingdata$x))) ;
#comparison with nearest shrunken centroid
#myTestingdata=list(x=t(x),y=y)
#SCScore=mean((myTestingdata$y!=as.numeric(pamr.predict(mytrain,threshold=thresh, myTestingdata$x,type="class"))))
#cat('\n',
#'What does it cost to use type=quadratic rule when the true optimal rule is linear ? ','\n',
#'Score of the linear rule: ',LDAScore,'\n',
#'Score of the  rule with type=quadratic : ',QDAScore,'\n', 'it detects that the true rule is linear?\n',
#'Score of the nearest shrunken centroid rule: ',SCScore,'\n')

#plotClassifRule(LearnedQuadBinaryRule)

############ Tests 3 classes
#library(VHDClassification)
#p=1000; n=40 ; mu=array(0,c(p,3)); mu[1:10,1]=4; C=array(c(1,20),p)

#x=NULL; y=NULL;
#for (k in 1:3){
#    if (k<3){
#    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
#    y=c(y,array(k,n))}
#    else
#    {
#    tildeC=C; tildeC[1:10]=40; 
#    x=rbind(x,t(array(tildeC^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
#    y=c(y,array(k,n))
#    }
#    }
#Learning
#LearnedLinearPartitionWithLLR=learnPartitionWithLLR(x,y,type='linear')
#LearnedQuadraticPartitionWithLLR=learnPartitionWithLLR(x,y,type='quadratic')
#plotClassifRule(LearnedQuadraticPartitionWithLLR)
#require(randomForest)
#RF <- best.tune('randomForest',x,factor(y),ranges=list(ntree = c(500)))

#Testing Set
#x=NULL; y=NULL;
#for (k in 1:3){
#    if (k<3){
#    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
#    y=c(y,array(k,n))}
#    else
#    {
#    tildeC=C; tildeC[1:10]=40; 
#    x=rbind(x,t(array(tildeC^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
#    y=c(y,array(k,n))
#    }
#    }
#Testing
#myTestingdata=list(x=x,y=y)
#LDAScore=mean((y!=factor(predict(LearnedLinearPartitionWithLLR,myTestingdata$x)))) ;
#QDAScore=mean((y!=factor(predict(LearnedQuadraticPartitionWithLLR,myTestingdata$x)))) ;
#RFScore=mean((y!=predict(RF,myTestingdata$x))) ;

#cat('Score of the quadratic rule: ',QDAScore,'\n',
#'Score of the linear rule: ',LDAScore,'\n',
#'Score of the random Forest Rule: ',RFScore,'\n')


}
