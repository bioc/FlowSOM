% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/0_FlowSOM.R
\name{GetFlowJoLabels}
\alias{GetFlowJoLabels}
\title{Process a FlowJo workspace file}
\usage{
GetFlowJoLabels(
  files,
  wspFile,
  group = "All Samples",
  cellTypes = NULL,
  getData = FALSE,
  ...
)
}
\arguments{
\item{files}{The FCS files of interest}

\item{wspFile}{The FlowJo wsp file to read}

\item{group}{The FlowJo group to parse. Default "All Samples".}

\item{cellTypes}{Cell types to use for final labeling the cells. Should
correspond with a subset of the gate names in FlowJo.}

\item{getData}{If true, flowFrames are returned as well.}

\item{...}{Extra arguments to pass to CytoML::flowjo_to_gatingset}
}
\value{
This function returns a list, which for every file contains a list
in which the first element ("matrix") is a matrix containing filtering 
results for each specified gate and the second element ("manual") is a vector
which assigns one label to each cell. If only one file is given, only one
list is returned instead of a list of lists.
}
\description{
Reads a FlowJo workspace file using the flowWorkspace library 
and returns a list with a matrix containing gating results and a vector with 
a label for each cell from a set of specified gates
}
\examples{

# Identify the files
fcs_file <- system.file("extdata", "68983.fcs", package = "FlowSOM")
wspFile <- system.file("extdata", "gating.wsp", package = "FlowSOM")

# Specify the cell types of interest for assigning one label per cell
cellTypes <- c("B cells",
                "gd T cells", "CD4 T cells", "CD8 T cells",
                "NK cells", "NK T cells")

# Parse the FlowJo workspace   
gatingResult <- GetFlowJoLabels(fcs_file, wspFile,
                                cellTypes = cellTypes,
                                getData = TRUE)

# Check the number of cells assigned to each gate
colSums(gatingResult$matrix)

# Build a FlowSOM tree
flowSOM.res <- FlowSOM(gatingResult$flowFrame,
                       colsToUse = c(9, 12, 14:18),
                       nClus = 10,
                       seed = 1)
   
 # Plot pies indicating the percentage of cell types present in the nodes
 PlotPies(flowSOM.res,
          gatingResult$manual,
          backgroundValues = flowSOM.res$metaclustering)

}
\seealso{
\code{\link{PlotPies}}
}
