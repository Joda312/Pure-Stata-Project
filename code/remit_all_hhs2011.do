use "data2011/hh6.dta", clear
drop if missing(h601)
gen mig=0
  replace mig=1 if h601>0
drop h601 h600a h600a_2 h600b h600b_2 h600b_3
save "derived/mig2011.dta", replace
use "data2011/hh6b.dta", clear
keep hhid h616 h617_s h617_c h617_t h625s h625c

* why we have value 3 in h617_t ???
* data quality issue: we assume that 3 means year (period)
generate vol_rem=h617_s
  replace vol_rem=h617_s*12 if h617_t==1
  replace vol_rem=0 if missing(vol_rem)
gen vol_soms=vol_rem*46.1359 if h617_c==2
  replace vol_soms=vol_rem if h617_c==1
  replace vol_soms=vol_rem*1.5729 if h617_c==3
  replace vol_soms=vol_rem*64.2766 if h617_c==4
  replace vol_soms=0 if missing(vol_soms)
  
*plus remitances in terms of goods (their volume)
gen hhm_total_vol_soms=vol_soms
  replace hhm_total_vol_soms=vol_soms+h625s if h625c==1
  replace hhm_total_vol_soms=vol_soms+(h625s*1.5729) if h625c==3
rename hhm_total_vol_soms rem_total
drop h616 h617_s h617_c h617_t h625s h625c vol_rem vol_soms
save "derived/remittances2011.dta", replace
use "derived/mig2011.dta", clear
merge 1:1 hhid using "derived/remittances2011.dta"
drop _merge
replace rem_total=0 if missing(rem_total)
sort hhid
save "derived/remit_all_hhs2011.dta", replace
