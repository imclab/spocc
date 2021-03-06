\name{occ}
\alias{occ}
\title{Search for species occurrence data across many data sources.}
\usage{
  occ(query = NULL, rank = "species",
    from = c("gbif", "bison", "inat", "npn", "ebird"),
    type = "sci", gbifopts = list(), bisonopts = list(),
    inatopts = list(), npnopts = list(),
    ebirdopts = list())
}
\arguments{
  \item{query}{A single name. Either a scientific name or a
  common name. Specify whether a scientific or common name
  in the type parameter. Only scientific names supported
  right now.}

  \item{rank}{Taxonomic rank.}

  \item{from}{Data source to get data from, any combination
  of gbif, bison, or inat}

  \item{type}{Type of name, sci (scientific) or com (common
  name, vernacular)}

  \item{gbifopts}{List of options to pass on to rgbif}

  \item{bisonopts}{List of options to pass on to rbison}

  \item{inatopts}{List of options to pass on to rinat}

  \item{npnopts}{List of options to pass on to rnpn}

  \item{ebirdopts}{List of options to pass on to ebird}
}
\description{
  Search on a single species name.
}
\details{
  The \code{occ} and \code{occlist} functions are
  opinionated wrappers around the rgbif, rbison, rinat, and
  rebird packages to allow data access from a single access
  point. We take care of making sure you get useful objects
  out at the cost of flexibility/options - if you need
  options you can use the functions inside each of those
  packages.
}
\examples{
\dontrun{
# Single data sources
occ(query='Accipiter striatus', from='gbif')
occ(query='Danaus plexippus', from='inat')
occ(query='Bison bison', from='bison')
occ(query='Pinus contorta', from='npn', npnopts=list(startdate='2008-01-01', enddate='2011-12-31'))
occ(query='Setophaga caerulescens', from='ebird', ebirdopts=list(region='US'))
occ(query='Spinus tristis', from='ebird', ebirdopts=list(method='ebirdgeo', lat=42, lng=-76, dist=50))

# Many data sources
npnopts <- list(startdate='2008-01-01', enddate='2011-12-31')
out <- occ(query='Pinus contorta', npnopts=npnopts)

## Select individual elements
out
}

