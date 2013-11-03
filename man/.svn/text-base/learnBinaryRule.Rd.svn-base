\name{learnBinaryRule}
\alias{learnBinaryRule}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function to learn a binary classification rule
}
\description{
Function to learn a binary classification rule. 
For more than two class, use \code{\link{learnPartitionWithLLR}} instead. 
The learned rule can be linear or quadratic. 
There are reduction dimension methods (accessible via argument procedure)
to make the procedure efficient when the number of features is larger than the number of observations
}
\usage{
learnBinaryRule(x, y,type='linear', procedure = "FDRThresh", covariance = "diagonal", ql = NULL, qq = NULL,prior=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
The Matrix with input data of size pxn (p feature space dimension, and n number of observations)
}
  \item{y}{
 A vector of n factors with 2 LEVELS (labels) associated to observations (can also be numeric)
}
\item{type}{'quadratic' or 'linear' are valid types. }
  \item{procedure}{
Procedure gives the used procedure to reduce the dimensionality of the estimated NormalVector and FormVector.
use 'noThresh' for no dimensionality reduction. UnivTresh is the universal threshold and FDRThresh is an FDR thresolding procedure.
When type=='linear' 'FANThresh' and 'FDRstudent' are also available. For type linear, the thresholding procedures are fully described in the Paper 
"Fast rate of convergence in high dimensional linear discriminant analysis"}
  \item{covariance}{
Unused argument ... further development comming soon
}
  \item{ql}{
The parameter associated to the thresholding procedure for the estimation of NormalVector. 
If a vector of values is given a 10 fold cross validation is performed
}
  \item{qq}{
The parameter associated to the thresholding procedure for the estimation of FormVector (only when type='quadratic'). 
If a vector of values is given a 10 fold cross validation is performed
}
\item{prior}{ Do we put a prior on y (taking into account the proportion of the different class in the learning set to build the classification rule}

}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A classification rule of class LinearRule if type='linear' and of class QuadraticRule if type='quadratic'.
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
\code{\link{learnPartitionWithLLR}} 
}
\examples{
p=100; n=50 ; mu=array(0,c(p,2)); mu[1:10,1]=1 ;C=array(c(1,20),p)
x=NULL; y=NULL;
for (k in 1:2){    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))    }
#Learning
LearnedBinaryRule=learnBinaryRule(x,y)
show(LearnedBinaryRule)}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }

