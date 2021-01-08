use "data2011/hh1b.dta", clear

* Generating a dummy variable for labor involvement
keep hhid pid h124
drop if missing(h124)
gen dep_labor=(h124>0)
drop h124
save "derived/labor2011.dta", replace
