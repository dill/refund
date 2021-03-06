% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f_sum.R
\name{f_sum}
\alias{f_sum}
\title{Sum computation 1}
\usage{
f_sum(mu.q.c, sig.q.c, theta, obspts.mat)
}
\arguments{
\item{mu.q.c}{current value of mu.q.c}

\item{sig.q.c}{current value of sig.q.c}

\item{theta}{spline basis}

\item{obspts.mat}{matrix indicating the points on which data is observed}
}
\description{
Internal function used compute a sum in FPCA-based covariance updates
}
\author{
Jeff Goldsmith \email{ajg2202@cumc.columbia.edu}
}

