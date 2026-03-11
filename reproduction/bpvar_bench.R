
library(bpvars)                                   # load the package
tail(ilo_dynamic_panel$COL, 8)                    # inspect Colombian data

spec = specify_bvarPANEL$new(                           # specify the model
  ilo_dynamic_panel,                                    # data
  exogenous = ilo_exogenous_variables                   # exogenous variables
)

burn = estimate(spec, S = 5000, show_progress = FALSE) # run the burn-in
post = estimate(burn, S = 5000)                        # estimate the model

fore = forecast(                                    # forecast the model
  post,                                             # estimation output
  horizon = 5,                                      # forecast horizon
  exogenous_forecast = ilo_exogenous_forecasts,     # forecasts for exogenous variables
) 
plot(fore, "COL", main = "Forecasts for Colombia")  # plot the forecasts

summ = summary(fore, "COL")                       # compute forecast summaries
summ$variable2                                    # report forecasts for UR

post |>                                              # estimation output
  compute_variance_decompositions(horizon = 5) |>    # compute variance decompositions
  plot(which_c = "COL")                              # plot variance decompositions 

