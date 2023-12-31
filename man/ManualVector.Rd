% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/0_FlowSOM.R
\name{ManualVector}
\alias{ManualVector}
\title{Summarize the gating matrix into one vector, only including the cell types of
interest}
\usage{
ManualVector(manualMatrix, cellTypes)
}
\arguments{
\item{manualMatrix}{Matrix containing boolean values, indicating for every
gate (column) whether the cell (row) is part of it or not.}

\item{cellTypes}{Cell types to use in the summary vector. All others will be
ignored and cells which do not fall in one of these gates
will get the label "Unknown". Order is important!}
}
\value{
A factor with one label for every cell
}
\description{
Extract the compensated and transformed data and all gate labels.
}
