% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clo.R
\name{indivClo}
\alias{indivClo}
\title{Estimates either an uncoupled or coupled oscillator model for each dyad.}
\usage{
indivClo(derivData, whichModel)
}
\arguments{
\item{derivData}{A dataframe that was produced with the "estDerivs" function.}

\item{whichModel}{Whether the model to be estimated is the "uncoupled" or "coupled" oscillator.}
}
\value{
The function returns a list including: 1) the adjusted R^2 for the model for each dyad (called "R2"), and 2) the parameter estimates for the model for each dyad (called "params", for use in either predicting, or being predicted by, the system variable).
}
\description{
Both models predict the second derivatives of the observed state variables (with linear trends removed). For the uncoupled oscillator, the predictors are each person's own observed state variables (again with linear trends removed), as well as each person's own first derivatives of the observed state variables (again with linear trends removed. For the coupled oscillator, the predictors are each person's own and partner's observed state variables (again with linear trends removed), as well as each person's own and partner's first derivatives of the observed state variables (again with linear trends removed).
}
\examples{
data <- rties_ExampleDataShort
newData <- dataPrep(basedata=data, dyadId="couple", personId="person", 
obs_name="dial", dist_name="female", time_name="time")
taus <-c(2,3)
embeds <- c(3,4)
delta <- 1
derivs <- estDerivs(prepData=newData, taus=taus, embeds=embeds, delta=delta, idConvention=500)
clo <- indivClo(derivData=derivs$data, whichModel="coupled")
summary(clo$R2)
head(clo$params)
}
