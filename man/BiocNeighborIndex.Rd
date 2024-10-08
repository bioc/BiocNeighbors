% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BiocNeighborIndex-class.R
\name{BiocNeighborIndex}
\alias{BiocNeighborIndex}
\alias{BiocNeighborIndex-class}
\alias{show,BiocNeighborIndex-method}
\title{The BiocNeighborIndex class}
\description{
A virtual class for indexing structures of different nearest-neighbor search algorithms.
Developers should define subclasses for their own \code{\link{buildIndex}} and/or \code{\link{defineBuilder}} methods.
Subclasses containing a \code{ptr} slot will work with many of the default methods in \pkg{BiocNeighbors},
see \code{\link{buildIndex}} for details.
}
\author{
Aaron Lun
}
