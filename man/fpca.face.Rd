% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fpca.face.R
\name{fpca.face}
\alias{fpca.face}
\title{Smoothed FPCA via iterative penalized rank one SVDs.}
\usage{
fpca.face(Y = NULL, ydata = NULL, Y.pred = NULL, argvals = NULL,
  pve = 0.99, npc = NULL, var = FALSE, simul = FALSE,
  sim.alpha = 0.95, center = TRUE, knots = 35, p = 3, m = 2,
  lambda = NULL, alpha = 1, search.grid = TRUE, search.length = 100,
  method = "L-BFGS-B", lower = -20, upper = 20, control = NULL)
}
\arguments{
\item{Y, ydata}{the user must supply either \code{Y}, a matrix of functions
observed on a regular grid, or a data frame \code{ydata} representing
irregularly observed functions. See Details.}

\item{Y.pred}{if desired, a matrix of functions to be approximated using
the FPC decomposition.}

\item{argvals}{numeric; function argument.}

\item{pve}{proportion of variance explained: used to choose the number of
principal components.}

\item{npc}{how many smooth SVs to try to extract, if \code{NA} (the
default) the hard thresholding rule of Gavish and Donoho (2014) is used (see
Details, References).}

\item{var}{logical;}

\item{simul}{logical;}

\item{sim.alpha}{numeric;}

\item{center}{logical; center \code{Y} so that its column-means are 0? Defaults to
\code{TRUE}}

\item{knots}{number of knots to use or the vectors of knots; defaults to 35}

\item{p}{integer; the degree of B-splines functions to use}

\item{m}{integer; the order of difference penalty to use}

\item{lambda}{smoothing parameter; if not specified smoothing parameter is
chosen using \code{\link[stats]{optim}} or a grid search}

\item{alpha}{numeric; tuning parameter for GCV; see parameter \code{gamma}
in \code{\link[mgcv]{gam}}}

\item{search.grid}{logical; should a grid search be used to find \code{lambda}?
Otherwise, \code{\link[stats]{optim}} is used}

\item{search.length}{integer; length of grid to use for grid search for
\code{lambda}; ignored if \code{search.grid} is \code{FALSE}}

\item{method}{method to use; see \code{\link[stats]{optim}}}

\item{lower}{see \code{\link[stats]{optim}}}

\item{upper}{see \code{\link[stats]{optim}}}

\item{control}{see \code{\link[stats]{optim}}}
}
\value{
a list like the returned object from \code{\link{fpca.sc}}, with
entries \code{Yhat}, the smoothed trajectories, \code{scores}, the
estimated FPC scores, \code{mu}, the column means of \code{Y} (or a
vector of zeroes if \code{!center}), \code{efunctions}, the estimated
smooth FPCs (note that these are orthonormal vectors, not evaluations of
orthonormal functions...), \code{evalues}, their associated eigenvalues,
and \code{npc}, the number of smooth components that were extracted.
}
\description{
Implements the algorithm of Huang, Shen, Buja (2008) for finding smooth
right singular vectors of a matrix \code{X} containing (contaminated)
evaluations of functional random variables on a regular, equidistant grid.
If the number of smooth SVs to extract is not specified, the function
hazards a guess for the appropriate number based on the asymptotically
optimal truncation threshold under the assumption of a low rank matrix
contaminated with i.i.d. Gaussian noise with unknown variance derived in
Gavish and Donoho (2014).  Please note that Gavish and Donoho (2014) should be
regarded as experimental for functional PCA, and will typically not work
well if you have more observations than grid points.
}
\examples{
\dontrun{
## as in Sec. 6.2 of Huang, Shen, Buja (2008):
 set.seed(2678695)
 n <- 101
 m <- 101
 s1 <- 20
 s2 <- 10
 s <- 4
 t <- seq(-1, 1, l=m)
 v1 <- t + sin(pi*t)
 v2 <- cos(3*pi*t)
 V <- cbind(v1/sqrt(sum(v1^2)), v2/sqrt(sum(v2^2)))
 U <- matrix(rnorm(n*2), n, 2)
 D <- diag(c(s1^2, s2^2))
 eps <- matrix(rnorm(m*n, sd=s), n, m)
 Y <- U\%*\%D\%*\%t(V) + eps

 smoothSV <- fpca.ssvd(Y, verbose=TRUE)

 layout(t(matrix(1:4, nr=2)))
 clrs <- sapply(rainbow(n), function(c)
           do.call(rgb, as.list(c(col2rgb(c)/255, .1))))
 matplot(V, type="l", lty=1, col=1:2, xlab="",
         main="FPCs: true", bty="n")
 matplot(smoothSV$efunctions, type="l", lty=1, col=1:5, xlab="",
         main="FPCs: estimate", bty="n")
 matplot(1:m, t(U\%*\%D\%*\%t(V)), type="l", lty=1, col=clrs, xlab="", ylab="",
         main="true smooth Y", bty="n")
 matplot(1:m, t(smoothSV$Yhat), xlab="", ylab="",
         type="l", lty=1,col=clrs, main="estimated smooth Y", bty="n")
}
}
\author{
Fabian Scheipl
}
\references{
Huang, J. Z., Shen, H., and Buja, A. (2008).  Functional
principal components analysis via penalized rank one approximation.
\emph{Electronic Journal of Statistics}, 2, 678-695

Gavish, M., and Donoho, D. L.  (2014). The optimal hard threshold for
singular values is 4/sqrt(3).  \emph{IEEE Transactions on Information Theory}, 60(8), 5040--5053.
}
\seealso{
\code{\link{fpca.sc}} and \code{\link{fpca.face}} for FPCA based
on smoothing a covariance estimate; \code{\link{fpca2s}} for a faster
SVD-based approach.
}

