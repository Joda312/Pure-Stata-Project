use "derived/ind_educ2011.dta", clear
sort hhid pid, stable
save "derived/1.dta", replace
use "derived/hhold_comp2011.dta"
sort hhid pid, stable
merge 1:1 hhid pid using "derived/1.dta"
drop _merge
save "derived/merged1.dta", replace
use "derived/hhold_income2011.dta" 
sort hhid
merge 1:m hhid using "derived/merged1.dta"
keep if _merge==3
drop _merge
save "derived/2.dta", replace
gen adult_educ=ind_educ if adult
drop ind_educ adult
sort hhid
by hhid: egen temp=max(adult_educ)
drop adult_educ 
rename temp adult_educ
drop if adult_educ==.
save "derived/3.dta", replace
use "derived/remit_all_hhs2011.dta"
sort hhid
merge 1:m hhid using "derived/3.dta"
keep if _merge==3
drop _merge
save "derived/4.dta", replace
use "derived/labor2011.dta"
sort hhid pid
merge 1:1 hhid pid using "derived/4.dta"
keep if _merge==3
drop _merge
gen temp=0
replace temp=1 if hhead_sex==2
drop hhead_sex
rename temp hhead_sex
gen temp=0
replace temp=1 if h102==2
drop h102
rename temp child_sex
sort hhid pid
save "derived/merged2011_labor.dta", replace
