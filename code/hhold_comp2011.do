use "data2011/hh1a.dta", clear
keep hhid-h104

* finding the age and gender of the household head
gen hhead_age=age if h104==1
sort hhid, stable
by hhid: egen temp=mean(hhead_age)
drop hhead_age
rename temp hhead_age
gen hhead_sex=h102 if h104==1
by hhid: egen temp=mean(hhead_sex)
drop hhead_sex
rename temp hhead_sex 

*finding the number, age, age^2 of children and creating a dummy for adults (in order to find the educ of the adult with the highest educ later on)
gen child=(age<=18)
gen child_age=age if child
gen child_age_sq=child_age^2
by hhid: egen numChildren=total(child)
gen adult=(age>18)

* finding the number of working age individuals by household
gen fem_work_age=(age>18 & age<58) if h102==2
by hhid: egen num_fem_work_age=total(fem_work_age)
gen male_work_age=(age>18 & age<63) if h102==1
by hhid: egen num_male_work_age=total(male_work_age)
by hhid: gen num_work_age=num_male_work_age+num_fem_work_age
drop fem_work_age num_fem_work_age male_work_age num_male_work_age 

* finding the number of elderly by household
gen elderly_fem=(age>=58) if h102==2
by hhid: egen num_elderly_fem=total(elderly_fem)
gen elderly_male=(age>=63) if h102==1
by hhid: egen num_elderly_male=total(elderly_male)
by hhid: gen numElderly=num_elderly_fem+num_elderly_male
drop elderly_fem num_elderly_fem elderly_male num_elderly_male

* finding the share of females by household
gen female=(h102==2)
by hhid: egen numFemale=total(female)
by hhid: gen size=_N
gen share_female=numFemale/size
drop h104 female numFemale size
save "derived/hhold_comp2011.dta", replace
