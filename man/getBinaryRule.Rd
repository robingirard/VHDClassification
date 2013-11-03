\name{getBinaryRule}
\alias{getBinaryRule}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Getter set of binary rules (object PartitionWithLLR)
}
\description{
This function returns the binary rule for discrimination between data from class k and data from class l
}
\usage{
getBinaryRule(object, k, l)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
An object of class PartitionWithLLR as returned by learnPartitionWithLLR
}
  \item{k}{
an existing label 
}
  \item{l}{
an existing label 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A binary classification rule. Can either be an object of class LinearRule or an object of class QuadraticRule
}
\references{
Fast rate of convergence in high dimensional linear discriminant analysis. R. Girard To appear in Journal of Nonparametric Statistics.\\
Very high dimensional discriminant analysis with thresholding estimation. R. Girard.  Submitted. 

}
\author{
Robin Girard
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{getLogLikeRatio}}
}
\examples{
#try p=1000 , 5000, ...
p=100; n=20 ; mu=array(0,c(p,4)); mu[1:10,1]=2 ;mu[11:20,2]=2;C=array(c(1,20),p)
mu[21:30,3]=2
x=NULL; y=NULL;
for (k in 1:4){
    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))}
#Learning
LearnedLinearPartitionWithLLR=learnPartitionWithLLR(x,y,procedure='FDRThresh')
Rule=getBinaryRule(LearnedLinearPartitionWithLLR,1,2)
show(Rule)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Discrimination}

