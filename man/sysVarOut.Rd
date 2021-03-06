% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sysVarInOut.R
\name{sysVarOut}
\alias{sysVarOut}
\title{Provides results for predicting the system variable from the latent profiles of the dynamic parameters.}
\usage{
sysVarOut(
  fullData,
  sysVar_name,
  sysVarType,
  dist0name = NULL,
  dist1name = NULL,
  family = NULL
)
}
\arguments{
\item{fullData}{A dataframe created by the "makeFullData" function.}

\item{sysVar_name}{The name of the variable in the dataframe that contains the system variable to be predicted by profile membership.}

\item{sysVarType}{Whether the system variable is "dyadic", which means both partners have the same score, or "indiv" which means the partners can have different scores}

\item{dist0name}{An optional name for the level-0 of the distinguishing variable (e.g., "Women"). Default is dist0.}

\item{dist1name}{An optional name for the level-1 of the distinguishing variable (e.g., "Men"). Default is dist1}

\item{family}{An optional argument specifying the error distribution and link function to be used in the model. Any of the "family" options supported by glm (for dyadic system variables) or glmer (for individual system variables) are available. Default is gaussian.}
}
\value{
For normally distributed system variables, the function returns a list including the lm or lme objects containing the full results for each model (called "models"). Similarly, for non-normal system variables, the function returns a list of the glm or glmer objects containing the full results for the models.
}
\description{
The system variable can be either dyadic (sysVarType = "dyadic"), where both partners have the same score (e.g., relationship length) or individual (sysVarType = "indiv"), where the partners can have different scores (e.g., age). For dyadic system variables, the only predictor is profile membership and the model is a regular regression model since all variables are at the level of the dyad. If the system variable is individual then the model is a random-intercept dyadic model and 3 models are estimated: 1) the main effect of profile membership, 2) main effects of profile membership and the distinguishing variable, and 3) the interaction of profile membership and the distinguishing variable. If the system variable is not normally distributed, any of the generalized linear models supported by glm (for dyadic system variables) or glmer (for individual system variables) are available by specifying the "family" distribution.
}
\examples{
data <- rties_ExampleDataShort
newData <- dataPrep(basedata=data, dyadId="couple", personId="person", 
obs_name="dial", dist_name="female", time_name="time", time_lag=2)
ic <- indivInertCoord(prepData=newData, whichModel="inertCoord")
profiles <- inspectProfiles(whichModel="inertCoord", prepData=newData, 
paramEst=ic$params, n_profiles=2)
fullData <- makeFullData(basedata=data, dyadId="couple", personId="person", 
dist_name="female", lpaData=profiles, params=ic$params)
sysOut <- sysVarOut(fullData=fullData, sysVar_name="conflict", sysVarType="indiv")
summary(sysOut$models$profilePlusDist)

}
