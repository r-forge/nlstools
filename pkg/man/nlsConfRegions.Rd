\name{nlsConfRegions}
\alias{nlsConfRegions}
\alias{plot.nlsConfRegions}
\alias{print.nlsConfRegions}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ Confidence regions }

\description{
 Draws parameter values in the Beale's 95 percent unlinearized confidence region
}

\usage{
nlsConfRegions (nls, length = 1000, exp = 1.5)
\method{plot}{nlsConfRegions} (x, bounds = FALSE, ask = FALSE, \dots)
\method{print}{nlsConfRegions} (x, \dots)
}

%- maybe also 'usage' for other objects documented here.

\arguments{
    \item{nls}{ an object of class 'nls'  }
    \item{length}{ number of points to draw in the confidence region  }
    \item{exp}{ expansion factor of the hypercube in which random values of parameters are drawn  }
    \item{x}{ an object of class 'nlsConfRegions'  }
    \item{bounds}{ logical defining whether bounds of the drawing hypercube are plotted }
    \item{ask}{ if TRUE, draw plot interactively }
    \item{...}{ further arguments passed to or from other methods }
}

\details{
    A sample of points in the 95 percent confidence region is computed according to Beale's criterion (Beale, 1960). This region is also named the joint parameter likelihood region (Bates and Watts, 1988). The method used consists in a random sampling of parameters values in a hypercube centered on the least squares estimate and rejecting the parameters values whose residual sum of squares do not verify the Beale criterion. The confidence region is plotted by projection of the sampled points in each plane defined by a couple of parameters. Bounds of the hypercube in which random values of parameters are drawn may be plotted in order to check if the confidence region was totally included in the hypercube defined by default. If not the hypercube should be expanded in order to obtain the full confidence region
}

\value{ 
    \code{nlsConfRegions} returns a list of four objects:
    \item{ cr }{ a data frame containing the sample drawn in the Beale's confidence region }
    \item{ rss }{ a vector containing the residual sums of squares corresponding to \code{cr} }
    \item{ rss95 }{ the 95 percent residual sum of squares threshold according to Beale (1960) }
    \item{ bounds }{ lower and upper bounds of the hypercube in which random values of parameters have been drawn }
}

\seealso{
\code{ellipse.nls} in the \code{ellipse} library
}

\references{ 
Beale EML (1960) Confidence regions in non-linear estimations. \emph{Journal of the Royal Statistical Society}, \bold{22B}, 41-88.\cr\cr
Bates DM and Watts DG (1988) Nonlinear regression analysis and its applications. Wiley, Chichester, UK.
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
cr <- nlsConfRegions(nls1, exp = 2, length = 200)
plot(cr, bounds = TRUE)
}

\keyword{ nonlinear }% at least one, from doc/KEYWORDS
