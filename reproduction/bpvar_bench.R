
library(bpvars)

model = "bench_rate_noex"

S_burn = 1e4
S      = 1e4

# the regular workflow involving 
# specification, estimation, and forecasting
########################################

# a more elaborate model
spec    = specify_bvarPANEL$new(
  data       = ilo_dynamic_panel,
  # type       = c("real", "rate", "rate", "rate"),
  # exogenous  = ilo_exogenous_variables
)

burn    = estimate(spec, S_burn)                # run the burn-in; use at least S = 5000
post    = estimate(burn, S)                # estimate the model; use at least S = 10000
fore    = forecast(
  post, 
  horizon = 5,
  # exogenous = ilo_exogenous_forecasts
)

save(
  post, fore, 
  file = paste0("results/bpvar_",model,".rda")
)
