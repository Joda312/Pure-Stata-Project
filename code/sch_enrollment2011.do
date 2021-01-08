use "data2011/hh1b.dta", clear

* Generating a dummy for school enrollment
keep hhid pid h112
drop if missing(h112)
gen dep_school_en=(h112==1)
drop h112
save "derived/sch_enrollment2011.dta", replace
