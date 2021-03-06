% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot.R
\name{synthdid_plot}
\alias{synthdid_plot}
\title{Plots treated and synthetic control trajectories and overlays a 2x2 diff-in-diff diagram of our estimator.
In this overlay, the treatment effect is indicated by an arrow.
The weights lambda defining our synthetic pre-treatment time period are plotted below.
If a list of estimates is passed, plots all of them. By default, does this in different facets.
To overlay estimates in the same facet, indicate a facet for each estimator in the argument 'facet'.}
\usage{
synthdid_plot(
  estimates,
  treated.name = "treated",
  control.name = "synthetic control",
  facet = NULL,
  facet.vertical = TRUE,
  lambda.comparable = !is.null(facet),
  overlay = 0,
  lambda.plot.scale = 3,
  trajectory.linetype = 1,
  effect.curvature = 0.3,
  line.width = 0.5,
  guide.linetype = 2,
  point.size = 0.5,
  trajectory.alpha = 0.4,
  diagram.alpha = 0.95,
  effect.alpha = 0.95,
  onset.alpha = 0.3,
  ci.alpha = 0.3,
  se.method = "jackknife",
  alpha.multiplier = NULL
)
}
\arguments{
\item{estimates, }{a list of estimates output by synthdid_estimate. Or a single estimate.
If estimates have attribute 'intercept' set (scalar in [0,1]), then plot after subtracting
that fraction of the SDID adjustment for the difference between pre-treatment treated and sc curves.
With intercept of almost one, this makes it easier to assess parallel-ness by making trajectories closer
With intercept of one, this overlays curves, and plotting a diagram is suppressed as in the case of a SC estimate.}

\item{treated.name, }{the name of the treated curve that appears in the legend. Defaults to 'treated'}

\item{control.name, }{the name of the control curve that appears in the legend. Defaults to 'synthetic control'}

\item{facet, }{a list of the same length as estimates indicating the facet in which to plot each estimate.
The values of the elements of the list are used to label the facets.
If NULL, plot each estimate in a different facet. Defaults to NULL.}

\item{facet.vertical, }{TRUE if facets should be stacked vertically. Defaults to FALSE (horizonal).}

\item{lambda.comparable, }{TRUE if the weights lambda should be plotted in such a way that the ribbons
have the same mass from plot to plot, assuming the treated curve is the same. Useful for side-by-side or overlaid plots.
Defaults to FALSE if facet is not passed, TRUE if passed.}

\item{overlay}{specifies a value of 'intercept' for all SDID estimates. Defaults to 0.
If a vector is passed, plots at different intercept levels indicated by the 'frame' aesthetic. ggplotly will interpret this as an animation.}

\item{lambda.plot.scale}{determines the scale of the plot of the weights lambda.}

\item{trajectory.linetype, }{the linetype of the treated and synthetic control trajectories}

\item{effect.curvature, }{the curvature of the arrows indicating the treatment effect. Defaults to zero.
Nonzero values help avoid overplotting when plotting multiple estimates in one facet.}

\item{line.width}{the line width.}

\item{guide.linetype}{determines the (ggplot) linetype of the vertical segments of the parallelogram}

\item{point.size}{determines the size of the points of the parallelogram}

\item{trajectory.alpha}{determines transparency of trajectories}

\item{diagram.alpha}{determines transparency of diff-in-diff diagram}

\item{effect.alpha}{determines transparency of effect arrows}

\item{onset.alpha}{determines transparency of vertical lines indicating onset of treatment}

\item{ci.alpha}{determines transparency of the arrows illustrating upper and lower bounds of a 95\% confidence interval for the effect}

\item{se.method}{determines the method used to calculate the standard error used for this confidence interval}

\item{alpha.multiplier, }{a vector of the same length as estimates, is useful for comparing multiple estimates in
one facet but highlighting one or several. All plot elements associated with the estimate are displayed
with alpha multiplied by the corresponding element of alpha.multiplier. Defaults to a vector of ones.}
}
\description{
For SC estimates, i.e., if lambda is a vector of zeros, plots the trajectories and SC estimate of the effect, but no diagram.
}
\details{
Requires ggplot2
Due to differences between ggplot and ggplotly, this will warn about an unknown aesthetic frame.
}
