\name{getLogLikeRatio}
\alias{getLogLikeRatio}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get the log-likelihood ratio from a binary rule (QuadraticRule or LinearRule) 
}
\description{
Binary rules can be expressed 
}
\usage{
getLogLikeRatio(object)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
an object of type LinearRule or QuadraticRule.
}
}
\details{
Get everything that defines a log likelihood ratio between two gaussian measures. 
}
\value{
A list, see \code{\link{getLogLikeRatio-methods}}
}
\references{
Fast rate of convergence in high dimensional linear discriminant analysis. R. Girard To appear in Journal of Nonparametric Statistics.\\
Very high dimensional discriminant analysis with thresholding estimation. R. Girard.  Submitted. 

}
\author{
Robin Girard
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
p=100; n=20 ; mu=array(0,c(p,4)); mu[1:10,1]=2 ;mu[11:20,2]=2;C=array(c(1,20),p)
mu[21:30,3]=2
x=NULL; y=NULL;
for (k in 1:4){
    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))}
#Learning
LearnedLinearPartitionWithLLR=learnPartitionWithLLR(x,y,procedure='FDRThresh')

Rule=getBinaryRule(LearnedLinearPartitionWithLLR,1,2)
LLR=getLogLikeRatio(Rule)
print(LLR)}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ discrimination }

