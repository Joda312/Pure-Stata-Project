use "derived/merged2011_exped_ed.dta", clear
rename dep_exp_ed dep_exp_ed_11
rename mig mig_11
rename rem_total rem_total_11
rename income income_11
rename hhead_age hhead_age_11
rename child_age child_age_11
rename child_age_sq child_age_sq_11
rename numChildren numChildren_11
rename num_work_age num_work_age_11
rename numElderly numElderly_11
rename share_female share_female_11
rename adult_educ adult_educ_11
rename hhead_sex hhead_sex_11
rename child_sex child_sex_11
merge 1:1 hhid pid h103_m h103_y using "derived/merged2010_exped_ed.dta"
keep if _merge==3
drop _merge
sort hhid pid
save "derived/merged_exp_ed2010_2011.dta", replace
use "derived/merged_exp_ed2010_2011.dta", clear
keep hhid pid h103_m h103_y dep_exp_ed mig rem_total income hhead_age child_age child_age_sq numChildren num_work_age numElderly share_female adult_educ hhead_sex child_sex north south mount
sort hhid pid
gen year=2010
save "derived/merged_exp_ed2010.dta", replace
use "derived/merged_exp_ed2010_2011.dta", clear
keep hhid pid h103_m h103_y dep_exp_ed_11 mig_11 rem_total_11 income_11 hhead_age_11 child_age_11 child_age_sq_11 numChildren_11 num_work_age_11 numElderly_11 share_female_11 adult_educ_11 hhead_sex_11 child_sex_11 north south mount
rename dep_exp_ed_11 dep_exp_ed
rename mig_11 mig
rename rem_total_11 rem_total
rename income_11 income
rename hhead_age_11 hhead_age
rename child_age_11 child_age
rename child_age_sq_11 child_age_sq
rename numChildren_11 numChildren
rename num_work_age_11 num_work_age
rename numElderly_11 numElderly
rename share_female_11 share_female
rename adult_educ_11 adult_educ
rename hhead_sex_11 hhead_sex
rename child_sex_11 child_sex
gen year=2011
sort hhid pid
save "derived/merged_exp_ed2011.dta", replace
use "derived/merged_exp_ed2010.dta", clear
append using "derived/merged_exp_ed2011.dta"
sort hhid pid year
save "derived/merged_exp_ed2010_2011_final.dta", replace
