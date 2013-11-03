\name{learnPartitionWithLLR}
\alias{learnPartitionWithLLR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A function to learn a rule in case of 2 classes or more
}
\description{
A function to learn a rule in case of 2 classes or more.
 There are reduction dimension methods (accessible via argument procedure)
to make the procedure efficient when the number of features is larger than the number of observations
}
\usage{
learnPartitionWithLLR(x, y, type = "linear", procedure = "FDRThresh", ql = NULL, qq = NULL, BinaryLearningProcedure = NULL,prior=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{The Argument are exactly the same as in \code{\link{learnBinaryRule}} except that y may have more than 2 levels 
  \item{x}{
see \code{\link{learnBinaryRule}}
}
  \item{y}{
vector of factors with two or more levels
}
  \item{type}{
%%     ~~Describe \code{type} here~~
}
  \item{procedure}{
%%     ~~Describe \code{procedure} here~~
}
  \item{ql}{
%%     ~~Describe \code{ql} here~~
}
  \item{qq}{
%%     ~~Describe \code{qq} here~~
}
  \item{BinaryLearningProcedure}{
%%     ~~Describe \code{BinaryLearningProcedure} here~~
}
\item{prior}{ Do we put a prior on y (taking into account the proportion of the different class in the learning set to build the classification rule}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
