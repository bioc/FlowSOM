% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/5_plotFunctions.R
\name{PlotVariable}
\alias{PlotVariable}
\title{PlotVariable}
\usage{
PlotVariable(
  fsom,
  variable,
  variableName = "",
  colorPalette = FlowSOM_colors,
  lim = NULL,
  ...
)
}
\arguments{
\item{fsom}{FlowSOM object}

\item{variable}{A vector containing a value for every cluster}

\item{variableName}{Label to show on the legend}

\item{colorPalette}{Color palette to use. Can be a function or a vector.}

\item{lim}{Limits for the scale}

\item{...}{Additional arguments to pass to \code{\link{PlotFlowSOM}},
e.g. view, backgroundValues, equalNodeSize ...}
}
\description{
Plot a variable for all nodes
}
\details{
Plot FlowSOM grid or tree, colored by node values given in variable
}
\examples{
# Build FlowSOM model
fileName <- system.file("extdata", "68983.fcs", package = "FlowSOM")
flowSOM.res <- FlowSOM(fileName, 
                       compensate = TRUE, transform = TRUE, scale = FALSE,
                       colsToUse = c(9, 12, 14:18),
                       nClus = 10,
                       seed = 1)
                       
# Plot some random values
rand <- runif(flowSOM.res$map$nNodes)
PlotVariable(flowSOM.res, 
             variable = rand,
             variableName = "Random")
             
PlotVariable(flowSOM.res, 
             variable = flowSOM.res$metaclustering,
             variableName = "Metaclustering") \%>\% 
  AddLabels(labels = flowSOM.res$metaclustering)             
   
}
\seealso{
\code{\link{PlotStars}}, \code{\link{QueryStarPlot}},
\code{\link{PlotFlowSOM}}, \code{\link{PlotLabels}}, 
\code{\link{PlotNumbers}}, \code{\link{PlotMarker}}, 
\code{\link{PlotPies}}, \code{\link{PlotSD}}
}
