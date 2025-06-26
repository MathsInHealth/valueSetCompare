pkgname <- "valueSetCompare"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "valueSetCompare-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('valueSetCompare')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("compute_F_statistics")
### * compute_F_statistics

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: compute_F_statistics
### Title: compute_F_statistics
### Aliases: compute_F_statistics

### ** Examples

## No test: 
  # Define dimension names for EQ-5D-3L and EQ-5D-5L
  dim.names.3L <- c("mobility", "selfcare", "activity", "pain", "anxiety")
  dim.names.5L <- c("mobility5L", "selfcare5L", "activity5L", "pain5L", "anxiety5L")
  # Compute EQ-5D scores using the eq5dsuite package
  cdta$EQ5D3L <- eq5dsuite::eq5d3l(x = cdta,
                                   country = "US", 
                                   dim.names = dim.names.3L)
  cdta$EQ5D5L <- eq5dsuite::eq5d5l(x = cdta, 
                                   country = "US", 
                                   dim.names = dim.names.5L)
  cdta$EQXW <- eq5dsuite::eqxw(x = cdta, 
                               country = "US", 
                               dim.names = dim.names.5L)
  # Define combinations of utility columns for F-statistics calculation
  utility_combinations <- matrix(c("EQ5D5L", "EQ5D3L", "EQ5D5L", "EQXW"), nrow = 2)
  # Compute F-statistics for the utility columns
  result <- compute_F_statistics(df = cdta, 
                                 utility_columns = c("EQ5D3L", "EQ5D5L", "EQXW"), 
                                 utility_combinations = utility_combinations)
  # Plot the results
  print(result$plot)
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("compute_F_statistics", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("compute_utility_stats")
### * compute_utility_stats

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: compute_utility_stats
### Title: compute_utility_stats
### Aliases: compute_utility_stats

### ** Examples

compute_utility_stats(value_sets_3L = "ES", value_sets_5L = "ES")
value_set_other <- list(instrument1 = list(df = data.frame(state=c(1, 2, 3), utility = c(-1, 0, 1)), 
                        stateColumn = "state", 
                        utilityColumn = "utility"))
compute_utility_stats(value_sets_3L = "AU", value_sets_others = value_set_other)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("compute_utility_stats", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("density_plot_empirical")
### * density_plot_empirical

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: density_plot_empirical
### Title: density_plot_empirical
### Aliases: density_plot_empirical

### ** Examples

dim.names.3L <- c("mobility", "selfcare", "activity", "pain", "anxiety")
cdta$EQ5D3L <- eq5dsuite::eq5d3l(x = cdta, 
                                country = "US", 
                                dim.names = dim.names.3L)
dim.names.5L <- c("mobility5L", "selfcare5L", "activity5L", "pain5L", "anxiety5L")
cdta$EQ5D5L <- eq5dsuite::eq5d5l(x = cdta, 
                                country = "US", 
                                dim.names = dim.names.5L)
cdta$EQXW <- eq5dsuite::eqxw(x = cdta, 
                            country = "US", 
                            dim.names = dim.names.5L)
density_plot_empirical(df = cdta, utility_columns = c("EQ5D3L", "EQ5D5L", "EQXW"))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("density_plot_empirical", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("density_plot_theorical")
### * density_plot_theorical

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: density_plot_theorical
### Title: density_plot_theorical
### Aliases: density_plot_theorical

### ** Examples

density_plot_theorical(value_sets_3L = "NL", value_sets_5L = "NL")
instrument <- data.frame(HS=c(123, 456, 789), val = c(-0.3, 0.1, 0.75))
value_set_other <- list(test_instrument = list(df = instrument, 
                        stateColumn = "HS", 
                        utilityColumn = "val"))
density_plot_theorical(value_sets_3L = "HU", value_sets_others = value_set_other)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("density_plot_theorical", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("severity_ribbon_plot")
### * severity_ribbon_plot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: severity_ribbon_plot
### Title: severity_ribbon_plot
### Aliases: severity_ribbon_plot

### ** Examples

## No test: 
  # Define dimension names for EQ-5D-3L and EQ-5D-5L
  dim.names.3L <- c("mobility", "selfcare", "activity", "pain", "anxiety")
  dim.names.5L <- c("mobility5L", "selfcare5L", "activity5L", "pain5L", "anxiety5L")
  # Compute EQ-5D scores using the eq5dsuite package
  cdta$EQ5D3L <- eq5dsuite::eq5d3l(x = cdta,
                                   country = "US", 
                                   dim.names = dim.names.3L)
  cdta$EQ5D5L <- eq5dsuite::eq5d5l(x = cdta, 
                                   country = "US", 
                                   dim.names = dim.names.5L)
  cdta$EQXW <- eq5dsuite::eqxw(x = cdta, 
                               country = "US", 
                               dim.names = dim.names.5L)
  # Get severity ribbon plot
  result <- severity_ribbon_plot(df = cdta, utility_columns = c("EQ5D3L", "EQ5D5L", "EQXW"))
## End(No test)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("severity_ribbon_plot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("single_transition_plots")
### * single_transition_plots

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: single_transition_plots
### Title: single_transition_plots
### Aliases: single_transition_plots

### ** Examples

single_transition_plots(value_sets_5L = "IT")
single_transition_plots(value_sets_3L = c("JP", "US"))  
single_transition_plots(value_sets_3L ="ES", 
                        value_sets_5L = "ES", 
                        value_sets_XW = "ES", 
                        value_sets_XWR = "ES")        



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("single_transition_plots", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
