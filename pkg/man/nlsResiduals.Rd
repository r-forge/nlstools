\name{nlsResiduals}
\alias{nlsResiduals}
\alias{plot.nlsResiduals}
%\alias{boxplot.nlsResiduals}
%\alias{hist.nlsResiduals}
%\alias{qq.nlsResiduals}
\alias{test.nlsResiduals}
\alias{print.nlsResiduals}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{ NLS residuals }

\description{
  Provides several plots and tests for the analysis of residuals
}

\usage{
nlsResiduals (nls)
\method{plot}{nlsResiduals} (x, which = 0, \dots)
%\method{boxplot}{nlsResiduals} (x, \dots)
%\method{hist}{nlsResiduals} (x, \dots)
%qq.nlsResiduals (x)
test.nlsResiduals (x)
\method{print}{nlsResiduals} (x, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{nls}{ an object of class 'nls'  }  
	\item{x}{ an object of class 'nlsResiduals' }
	\item{which}{ an integer: \cr
		0 = 4 graphs of residuals (types 1, 2, 4 and 6) \cr
		1 = non-transformed residuals against fitted values \cr 
		2 = standardized residuals against fitted values \cr
		3 = sqrt of absolute value of standardized residuals against fitted values \cr 
		4 = auto-correlation residuals (i+1th residual against ith residual) \cr 
		5 = histogram of the residuals  \cr
		6 = qq-plot of the residuals } 
	\item{...}{ further arguments passed to or from other methods }
}
\details{

Several plots and tests are proposed to check the validity of the assumptions of the error model based on the analysis of residuals.\cr
The function \code{plot.nlsResiduals} proposes several plots of residuals from the nonlinear fit: plot of non-transformed residuals against fitted values, plot of standardized residuals against fitted values, plot of square root of absolute value of standardized residuals against fitted values, auto-correlation plot of residuals (i+1th residual against ith residual), histogram of the non-transformed residuals and normal Q-Q plot of standardized residuals.\cr
\code{test.nlsResiduals} tests the normality of the residuals with the Shapiro-Wilk test (shapiro.test in package stats) and the randomness of residuals  with the runs test (Siegel and Castellan, 1988). The runs.test function used in \code{nlstools} is the one implemented in the package \code{tseries}.

}

\value{
	\code{nlsResiduals} returns a list of five objects:
	\item{ std95 }{ the Student value for alpha=0.05 (bilateral) and the degree of freedom of the model }
	\item{ resi1 }{ a matrix with fitted values vs. non-transformed residuals }
	\item{ resi2 }{ a matrix with fitted values vs. standardized residuals }
	\item{ resi3 }{ a matrix with fitted values vs. sqrt(abs(standardized residuals)) }
	\item{ resi4 }{ a matrix with ith residuals vs. i+1th residuals }
}

\references{ 
Bates DM and Watts DG (1988) Nonlinear regression analysis and its applications. Wiley, Chichester, UK.\cr\cr
Siegel S and Castellan NJ (1988) Non parametric statistics for behavioral sciences. McGraw-Hill international, New York.
}

\author{ 
Florent Baty \email{florent.baty@gmail.com}\cr
Marie-Laure Delignette-Muller \email{ml.delignette@vetagro-sup.fr}
}

%\note{  }

\examples{
# Plots of residuals
data(growthcurve4)
nls1 <- nls(gompertzm, growthcurve4,
	list(lag = 10,mumax = 0.1, LOG10N0 = 6, LOG10Nmax = 9))
nr <- nlsResiduals(nls1)
plot(nr, which = 0)

# Histogram and qq-plot
plot(nr, which=5)
plot(nr, which=6)
	
# Tests
test.nlsResiduals(nr)
}

\keyword{ nonlinear }% at least one, from doc/KEYWORDS
