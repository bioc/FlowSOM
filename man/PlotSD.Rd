% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/5_plotFunctions.R
\name{PlotSD}
\alias{PlotSD}
\title{PlotSD}
\usage{
PlotSD(fsom, marker = NULL, ...)
}
\arguments{
\item{fsom}{FlowSOM object, as generated by \code{\link{FlowSOM}}}

\item{marker}{If a marker/channel is given, the sd for this marker is 
shown. Otherwise, the maximum ratio is used.}

\item{...}{Additional arguments to pass to \code{\link{PlotFlowSOM}}}
}
\value{
Nothing is returned. A plot is drawn in which each node 
        is colored depending on its standard deviation
}
\description{
Plot FlowSOM grid or tree, colored by standard deviation.
}
\examples{
# Read from file, build self-organizing map and minimal spanning tree
fileName <- system.file("extdata", "68983.fcs", package  = "FlowSOM")
flowSOM.res <- ReadInput(fileName, compensate  = TRUE, transform  = TRUE,
                         scale  = TRUE)
flowSOM.res <- BuildSOM(flowSOM.res, colsToUse  = c(9, 12, 14:18))
flowSOM.res <- BuildMST(flowSOM.res)

PlotSD(flowSOM.res)

}
\seealso{
\code{\link{PlotStars}}, \code{\link{PlotVariable}},
\code{\link{PlotFlowSOM}}, \code{\link{PlotLabels}}, 
\code{\link{PlotNumbers}}, \code{\link{PlotMarker}}, 
\code{\link{PlotPies}}, \code{\link{QueryStarPlot}}
}
