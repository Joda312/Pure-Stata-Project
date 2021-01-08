use "data2010/hh1b.dta", clear

* Generating a dummy for school enrollment
keep hhid pid h112
drop if missing(h112)
gen dep_school_en=(h112==1)
drop h112
save "derived/sch_enrollment.dta", replace
