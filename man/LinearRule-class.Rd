\name{LinearRule-class}
\Rdversion{1.1}
\docType{class}
\alias{LinearRule-class}
\alias{plotClassifRule,LinearRule-method}
\alias{predict,LinearRule-method}
\alias{show,LinearRule-method}

\title{Class "LinearRule" ~~~ }
\description{	 ~~ A concise (1-5 lines) description of what the class is.  ~~}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("LinearRule", ...)}.
	 ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
  \item{\code{labels}:}{Object of class \code{"factor"} ~~ }
    \item{\code{normalVector}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{normalIndex}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{centerVector}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{prior}:}{Object of class \code{"logical"} ~~ }
    \item{\code{proportions}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{.EvaluateLogLikeRatio}{\code{signature(x = "numeric", object = "LinearRule")}: ... }
    \item{getLogLikeRatio}{\code{signature(object = "LinearRule")}: ... }
    \item{plotClassifRule}{\code{signature(object = "LinearRule")}: ... }
    \item{predict}{\code{signature(object = "LinearRule")}: ... }
    \item{show}{\code{signature(object = "LinearRule")}: ... }
	 }
}
\references{ }
\author{  }
\note{ }


\seealso{
%	~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%	or \code{\linkS4class{CLASSNAME}} for links to other classes
}
\examples{
showClass("LinearRule")
}
\keyword{classes}
