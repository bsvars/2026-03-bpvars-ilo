
library(bpvars)

model = "bench_miss_rate"

S_burn = 1e4
S      = 1e4

# the regular workflow involving 
# specification, estimation, and forecasting
########################################

# a more elaborate model
spec    = specify_bvarPANEL$new(
  data       = ilo_dynamic_panel_missing,
  type       = c("real", "rate", "rate", "rate"),
)

burn    = estimate(spec, S_burn)                # run the burn-in; use at least S = 5000
post    = estimate(burn, S)                # estimate the model; use at least S = 10000
fore    = forecast(
  post, 
  horizon = 5,
)

save(
  post, fore, 
  file = paste0("results/bpvar_",model,".rda")
)
