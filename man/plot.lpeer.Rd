% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.lpeer.R
\name{plot.lpeer}
\alias{plot.lpeer}
\title{Plotting of estimated regression functions obtained through \code{lpeer()}}
\usage{
\method{plot}{lpeer}(x, conf = 0.95, ...)
}
\arguments{
\item{x}{object of class \code{"\link{lpeer}"}.}

\item{conf}{pointwise confidence level.}

\item{...}{additional arguments passed to \code{\link{plot}}.}
}
\description{
Plots the estimate of components of estimated regression function obtained
from an \code{\link{lpeer}} object along with pointwise confidence bands.
}
\details{
Pointwise confidence interval is displayed only if the user set \code{se=T}
in the call to \code{\link{lpeer}}, and does not reflect any multiplicity
correction.
}
\examples{
\dontrun{
data(DTI)
cca = DTI$cca[which(DTI$case == 1),]
DTI = DTI[which(DTI$case == 1),]
fit.cca.lpeer1 = lpeer(Y=DTI$pasat, t=DTI$visit, subj=DTI$ID, funcs = cca)
plot(fit.cca.lpeer1)
}
}
\author{
Madan Gopal Kundu \email{mgkundu@iupui.edu}
}
\references{
Kundu, M. G., Harezlak, J., and Randolph, T. W. (2012).
Longitudinal functional models with structured penalties. (Please contact
J. Harezlak at \email{harezlak@iupui.edu}.)

Randolph, T. W., Harezlak, J, and Feng, Z. (2012). Structured penalties for
functional linear models - partially empirical eigenvectors for regression.
\emph{Electronic Journal of Statistics}, 6, 323--353.
}
\seealso{
\code{peer}, \code{lpeer}, \code{plot.peer}
}

