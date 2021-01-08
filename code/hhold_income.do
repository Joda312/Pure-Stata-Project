use "data2010/hh5.dta", clear
collapse (sum) income=h502, by(hhid)
replace income=12*income
save "derived/income_temp.dta", replace
use "derived/tot_assets.dta", clear
merge 1:1 hhid using "derived/income_temp.dta"
keep if _merge==3
replace income=tot_assets_soms+income
drop tot_assets_soms _merge
save "derived/hhold_income.dta", replace
