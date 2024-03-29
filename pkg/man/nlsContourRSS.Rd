\name{nlsContourRSS}
\alias{nlsContourRSS}
\alias{plot.nlsContourRSS}
\alias{print.nlsContourRSS}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Surface contour of RSS }

\description{
Provides residual sum of squares (RSS) contours
}

\usage{
nlsContourRSS (nls, lseq = 100, exp = 2)
\method{plot}{nlsContourRSS} (x, nlev = 0, col = TRUE, col.pal = terrain.colors(100), ask = FALSE, useRaster = TRUE, \dots)
\method{print}{nlsContourRSS} (x, \dots)
}

%- maybe also 'usage' for other objects documented here.

\arguments{
	\item{nls}{ an object of class 'nls'  }
	\item{lseq}{ length of the sequences of parameters  }
	\item{exp}{ expansion factor of the parameter intervals defining the grids  }
	\item{nlev}{ number of contour levels to add to the likelihood contour at level 95 percent }
	\item{col}{ logical. Contours are plotted with colors if \code{TRUE} }
	\item{col.pal}{ Palette of colors. Colors to be used as background (default is terrain.colors(100); unused if col is FALSE) }
	\item{x}{ an object of class 'nlsContourRSS'  }
	\item{ask}{ if TRUE, draw plot interactively (default is FALSE) }
	\item{useRaster}{ a bitmap raster is used to plot the image instead of polygons (default is TRUE) }
	\item{...}{ further arguments passed to or from other methods }
}

\details{
The aim of these functions is to plot the residual sum of squares (RSS) contours which correspond to likelihood contours for a Gaussian model. For each pair of parameters the RSS is calculated on a grid centered on the least squares estimates of both parameters, the other parameters being fixed to their least square estimates. The contours of RSS values are then plotted for each pair of parameters. For each pair of parameters, one of this contour corresponds to a section of the 95 percent Beale's confidence region in the plane of these parameters. This contour is plotted in a different color.
}

\value{ 
	\code{nlsContourRSS} returns a list of three objects:
	\item{ seqPara }{ a matrix with the sequence of grid values for each parameter }
	\item{ lrss }{ a list of matrices with logarithm values of RSS in the grid for each pair of parameters }
	\item{ lrss95 }{ the logarithm of the 95 percent residual sum of squares threshold according to Beale (1960) }
}

\references{ 
Beale EML (1960) Confidence regions in non-linear estimations. \emph{Journal of the Royal Statistical Society}, \bold{22B}, 41-88.\cr\cr
Bates DM and Watts DG (1988) Nonlinear regression analysis and its applications. Wiley, Chichester, UK.\cr
}

\author{ 
Florent Baty \email{florent.baty@gmail.com}\cr
Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}
}

%\note{  }

\examples{
data(growthcurve4)
nls1 <- nls(gompertzm, growthcurve4,
	list(lag = 10, mumax = 0.1, LOG10N0 = 6, LOG10Nmax = 9))
crss <- nlsContourRSS(nls1)
plot(crss)
}

\keyword{ nonlinear }% at least one, from doc/KEYWORDS
