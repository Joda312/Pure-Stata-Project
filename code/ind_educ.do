use "data2010/id2.dta", clear
keep hhid pid i207
rename i207 ind_educ
save "derived/ind_educ.dta", replace
