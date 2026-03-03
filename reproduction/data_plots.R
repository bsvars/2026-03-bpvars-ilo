

library(bpvars)

ligh = "#5A58FF"
# ligh = "#2A28C4"
dark = "#1A003F"

C = length(ilo_dynamic_panel)
id_usa = which(names(ilo_dynamic_panel) == "USA")
id_pol = which(names(ilo_dynamic_panel) == "POL")
time_id = zoo::index(ilo_dynamic_panel[[id_usa]])
var_names = colnames(ilo_dynamic_panel[[id_usa]])

# fraction of missing observations
1 - sum(sapply(1:C, \(i)(sum(!is.na(ilo_dynamic_panel_missing[[i]]))))) / 
  (C * prod(dim(ilo_dynamic_panel_missing[[id_usa]])))

par(
  mfrow = c(2, 2),
  mar = c(0.5, 0.5, 0.5, 0.5),
  oma = c(2, 2, 2, 2)
)
for (n in 1:4) {
  range_i = range(sapply(1:C, \(i)(range(ilo_dynamic_panel[[i]][,n]))))
  plot.ts(
    ilo_dynamic_panel[[id_usa]][,n], 
    ylim = range_i, 
    col = ligh, 
    lwd = 0.2,
    axes = FALSE,
    ylab = "",
    xlab = ""
  )
  for (i in (1:C)[-id_usa]) {lines(ilo_dynamic_panel[[i]][,n], col = ligh, lwd = 0.2)}
  lines(ilo_dynamic_panel[[id_pol]][,n], col = dark, lwd = 2)
  if (n == 1) {
    text(
      time_id[3],
      ilo_dynamic_panel[[id_pol]][34,n],
      "POL",
      col = dark
    )
  }
  text(
    time_id[31],
    range_i[2] - 0.1 * diff(range_i),
    var_names[n],
    col = dark
  )
  if (n == 3 || n == 4) {
    axis(
      1,
      labels = c(NA, seq(from = 1995, to = 2020, by = 5), NA),
      at = c(1991, seq(from = 1995, to = 2020, by = 5), 2024),
    )
  }
}





par(
  mfrow = c(2, 2),
  mar = c(0.5, 0.5, 0.5, 0.5),
  oma = c(2, 2, 2, 2)
)
for (n in 1:4) {
  range_i = range(sapply(1:C, \(i)(range(ilo_dynamic_panel[[i]][,n]))))
  plot.ts(
    ilo_dynamic_panel_missing[[id_usa]][,n], 
    ylim = range_i, 
    col = ligh, 
    lwd = 0.2,
    axes = FALSE,
    ylab = "",
    xlab = ""
  )
  for (i in (1:C)[-id_usa]) {lines(ilo_dynamic_panel_missing[[i]][,n], col = ligh, lwd = 0.2)}
  lines(ilo_dynamic_panel_missing[[id_pol]][,n], col = dark, lwd = 2)
  if (n == 1) {
    text(
      time_id[3],
      ilo_dynamic_panel[[id_pol]][34,n],
      "POL",
      col = dark
    )
  }
  text(
    time_id[31],
    range_i[2] - 0.1 * diff(range_i),
    var_names[n],
    col = dark
  )
  if (n == 3 || n == 4) {
    axis(
      1,
      labels = c(NA, seq(from = 1995, to = 2020, by = 5), NA),
      at = c(1991, seq(from = 1995, to = 2020, by = 5), 2024),
    )
  }
}
