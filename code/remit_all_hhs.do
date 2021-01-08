use "data2010/hh6a1.dta", clear
drop if missing(h601)
gen mig=0
  replace mig=1 if h601>0
drop h601
save "derived/mig.dta", replace
use "data2010/hh6.dta", clear
keep hhid h616 h617s h617c h617t h624 h625s h625c h626 h628s h628c h628t h635 h636s h636c
gen vol_rem=h617s*12 if h617t==2
  replace vol_rem=h617s if h617t==3
gen vol_soms=vol_rem*45.9884 if h617c==2
  replace vol_soms=vol_rem if h617c==1
  replace vol_soms=vol_rem*1.5156 if h617c==3
  replace vol_soms=vol_rem*61.0115 if h617c==4
  
*plus remittances in terms of goods 
 gen hhm_total_vol_soms=vol_soms
  replace hhm_total_vol_soms=vol_soms+h625s if h625c==1
  replace hhm_total_vol_soms=vol_soms+(5000*1.5156) if h625c==3
drop h616 h617s h617c h617t h624 h625s h625c h626 vol_rem vol_soms  
replace hhm_total_vol_soms=0 if missing(hhm_total_vol_soms)
rename hhm_total_vol_soms rem_total
drop h628s h628c h628t h635 h636s h636c
save "derived/remittances.dta", replace
use "derived/mig.dta", clear
merge 1:1 hhid using "derived\remittances.dta"
drop _merge
replace rem_total=0 if missing(rem_total)
sort hhid
save "derived/remit_all_hhs.dta", replace
