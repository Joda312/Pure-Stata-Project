use "data2011/hh1a.dta", clear

* keeping hhid, pid, age and gender
keep hhid pid h102 age

* sorting variables(hhid pid age) in ascending order for further operations
sort hhid pid age

*dropping individuals older than 12 and younger than 2
drop if age>12
drop if age<2

*using the data10/household/hh1c
merge 1:1 hhid pid using "data2011/hh1c.dta"
keep if _merge==3

* dropping unnecessary data
drop h127 h130 h131 h132 h133 h134 h135 h136 h137 h138 h139 _merge

*dropping missing data
drop if missing(h128, h129)

*calculating BMI
gen BMI=(h128*2.20462262*703)/((h129*0.3937007874)^2)

*creating BMI categories
gen BMI_cat=BMI
 replace BMI_cat=1 if age==2 & BMI<14.8 & h102==1
 replace BMI_cat=1 if age==3 & BMI<14.4 & h102==1
 replace BMI_cat=1 if age==4 & BMI<14 & h102==1
 replace BMI_cat=1 if age==5 & BMI<13.8 & h102==1
 replace BMI_cat=1 if age==6 & BMI<13.7 & h102==1
 replace BMI_cat=1 if age==7 & BMI<13.7 & h102==1
 replace BMI_cat=1 if age==8 & BMI<13.8 & h102==1
 replace BMI_cat=1 if age==9 & BMI<14 & h102==1
 replace BMI_cat=1 if age==10 & BMI<14.2 & h102==1
 replace BMI_cat=1 if age==11 & BMI<14.5 & h102==1
 replace BMI_cat=1 if age==12 & BMI<15 & h102==1
 replace BMI_cat=2 if age==2 & BMI>=14.8 & BMI<18.2 & h102==1
 replace BMI_cat=2 if age==3 & BMI>=14.4 & BMI<17.4 & h102==1
 replace BMI_cat=2 if age==4 & BMI>=14 & BMI<16.9 & h102==1
 replace BMI_cat=2 if age==5 & BMI>=13.8 & BMI<16.8 & h102==1
 replace BMI_cat=2 if age==6 & BMI>=13.7 & BMI<17 & h102==1
 replace BMI_cat=2 if age==7 & BMI>=13.7 & BMI<17.4 & h102==1
 replace BMI_cat=2 if age==8 & BMI>=13.8 & BMI<17.9 & h102==1
 replace BMI_cat=2 if age==9 & BMI>=14 & BMI<18.6 & h102==1
 replace BMI_cat=2 if age==10 & BMI>=14.2 & BMI<19.4 & h102==1
 replace BMI_cat=2 if age==11 & BMI>=14.5 & BMI<20.2 & h102==1
 replace BMI_cat=2 if age==12 & BMI>=15 & BMI<21 & h102==1
 replace BMI_cat=3 if age==2 & BMI>=18.2 & h102==1
 replace BMI_cat=3 if age==3 & BMI>=17.4 & h102==1
 replace BMI_cat=3 if age==4 & BMI>=16.9 & h102==1
 replace BMI_cat=3 if age==5 & BMI>=16.8 & h102==1
 replace BMI_cat=3 if age==6 & BMI>=17 & h102==1
 replace BMI_cat=3 if age==7 & BMI>=17.4 & h102==1
 replace BMI_cat=3 if age==8 & BMI>=17.9 & h102==1
 replace BMI_cat=3 if age==9 & BMI>=18.6 & h102==1
 replace BMI_cat=3 if age==10 & BMI>=19.4 & h102==1
 replace BMI_cat=3 if age==11 & BMI>=20.2 & h102==1
 replace BMI_cat=3 if age==12 & BMI>=21 & h102==1
 replace BMI_cat=1 if age==2 & BMI<14.4 & h102==2
 replace BMI_cat=1 if age==3 & BMI<14 & h102==2
 replace BMI_cat=1 if age==4 & BMI<13.7 & h102==2
 replace BMI_cat=1 if age==5 & BMI<13.5 & h102==2
 replace BMI_cat=1 if age==6 & BMI<13.4 & h102==2
 replace BMI_cat=1 if age==7 & BMI<13.4 & h102==2
 replace BMI_cat=1 if age==8 & BMI<13.6 & h102==2
 replace BMI_cat=1 if age==9 & BMI<13.7 & h102==2
 replace BMI_cat=1 if age==10 & BMI<14 & h102==2
 replace BMI_cat=1 if age==11 & BMI<14.4 & h102==2
 replace BMI_cat=1 if age==12 & BMI<14.8 & h102==2
 replace BMI_cat=2 if age==2 & BMI>=14.4 & BMI<18 & h102==2
 replace BMI_cat=2 if age==3 & BMI>=14 & BMI<17.2 & h102==2
 replace BMI_cat=2 if age==4 & BMI>=13.7 & BMI<16.8 & h102==2
 replace BMI_cat=2 if age==5 & BMI>=13.5 & BMI<16.8 & h102==2
 replace BMI_cat=2 if age==6 & BMI>=13.4 & BMI<17.1 & h102==2
 replace BMI_cat=2 if age==7 & BMI>=13.4 & BMI<17.6 & h102==2
 replace BMI_cat=2 if age==8 & BMI>=13.6 & BMI<18.3 & h102==2
 replace BMI_cat=2 if age==9 & BMI>=13.7 & BMI<19.1 & h102==2
 replace BMI_cat=2 if age==10 & BMI>=14 & BMI<19.9 & h102==2
 replace BMI_cat=2 if age==11 & BMI>=14.4 & BMI<20.8 & h102==2
 replace BMI_cat=2 if age==12 & BMI>=14.8 & BMI<21.7 & h102==2
 replace BMI_cat=3 if age==2 & BMI>=18 & h102==2
 replace BMI_cat=3 if age==3 & BMI>=17.2 & h102==2
 replace BMI_cat=3 if age==4 & BMI>=16.8 & h102==2
 replace BMI_cat=3 if age==5 & BMI>=16.8 & h102==2
 replace BMI_cat=3 if age==6 & BMI>=17.1 & h102==2
 replace BMI_cat=3 if age==7 & BMI>=17.6 & h102==2
 replace BMI_cat=3 if age==8 & BMI>=18.3 & h102==2
 replace BMI_cat=3 if age==9 & BMI>=19.1 & h102==2
 replace BMI_cat=3 if age==10 & BMI>=19.9 & h102==2
 replace BMI_cat=3 if age==11 & BMI>=20.8 & h102==2
 replace BMI_cat=3 if age==12 & BMI>=21.7 & h102==2
 
*creating underweight and overweight dummies
 gen underw=0
  replace underw=1 if BMI_cat==1
 gen overw=0
  replace overw=1 if BMI_cat==3
drop h102 h128 h129 age

*saving file
save "derived/BMI2011.dta", replace