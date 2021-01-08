use "data2010/hh1b.dta", clear

* Expenditure on education
keep hhid pid h121_4 age
drop if missing(h121_4)
rename h121_4 dep_exp_ed
drop age
save "derived/exped_ed.dta", replace
