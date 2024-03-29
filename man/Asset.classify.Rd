\name{classify,Asset-method}
\alias{classify,Asset-method}
\alias{classify}

\title{
Data classification
}

\description{
Assigns category labels to new data.
}

\usage{
classify(obj, dat, covariates)
}

\arguments{
  \item{obj}{
An object of the class Asset.
  }
  \item{dat}{
A matrix that containts variables as rows and samples as columns.
  }
  \item{covariates}{
A data.frame or matrix that containts samples as rows and
covariates as columns.
  }
}

\details{
The input data will be automatically normalized and standardized using
the internal asset parameters, see \code{\link{configuration}()} for
details.
}

\value{
Returns a data frame that contains predicted category labels and performance
indicators. The column 'CATEG' contains the final predictions, including
"Unclassified" or "Ambiguous" for samples that could not be reliably
classified. The columns 'MATCH.1st' and 'MATCH.2nd' contain the first and
second best matching categories, respectively.

The column 'BIOMRK' contains a standardized biomarker score that indicates
how similar the sample is with respect to the best-matching category. The
column 'PROX' tells the likelihood of how likely it is that the observed
biomarker score would have been generated by a training sample from the
best-matching category (balanced group sizes). The column 'EXCL' tells the
likelihood that the sample does not share characteristic features with any
other category.

The returned data frame also has the attribute "biomarkers" that
contains biomarker scores for all categories.
}

\examples{
# Import ALL subtyping asset.
base <- system.file(package = "Allspice")
folder <- file.path(base, "subtypes")
a <- asset(folder)

# Simulated data.
simu <- bcellALL(5)

# Predict categories.
res <- classify(a, dat = simu$counts, covariates = simu$metadata)
print(res[,c("LABEL","PROX","EXCL")])
}