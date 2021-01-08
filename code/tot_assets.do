use "data2010/hh2b.dta", clear

* assigning 0 to missing observations
replace h215_s = 0 if missing(h215_v)
replace h215_v = 1 if missing(h215_v)

* summing the value of total assets by hhid and currency (usd/soms)
gen tot_assets_soms = h215_s if h215_v == 1
replace tot_assets_soms = 0 if missing(tot_assets_soms)
gen tot_assets_usd = h215_s if h215_v == 2
replace tot_assets_usd = 0 if missing(tot_assets_usd)
replace tot_assets_soms = tot_assets_soms + 45.9884*tot_assets_usd
collapse (sum) tot_assets_soms = tot_assets_soms, by(hhid)
save "derived/tot_assets.dta", replace
