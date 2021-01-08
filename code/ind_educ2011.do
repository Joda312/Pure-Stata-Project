use "data2011/id2.dta", clear
keep hhid pid i207
rename i207 ind_educ
save "derived/ind_educ2011.dta", replace
