* please run this from the root folder of the project so that code can called be from code/...
* here is a master do-file

* data processing for 2010
do code/tot_assets
do code/sch_enrollment
do code/remit_all_hhs
do code/region
do code/labor
do code/ind_educ
do code/exped_ed
do code/BMI 
do code/hhold_comp
do code/hhold_income

* data processing for 2011
do code/tot_assets2011
do code/sch_enrollment2011
do code/remit_all_hhs2011
do code/labor2011
do code/ind_educ2011
do code/exped_ed2011
do code/BMI2011
do code/hhold_comp2011
do code/hhold_income2011

* merging the datasets
do code/merged2010_sch_enrollment
do code/merged2010_health
do code/merged2010_labor
do code/merged2010_exped_ed
do code/merged2011_sch_enrollment
do code/merged2011_health
do code/merged2011_labor
do code/merged2011_exped_ed

* merging the datasets over time (2010-2011)
do code/merged_sch_enr2010_2011
do code/merged_health2010_2011
do code/merged_labor2010_2011
do code/merged_exp_ed2010_2011
