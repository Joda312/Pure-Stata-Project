use "data2010/hhcontrol.dta", clear
keep hhid oblast location

* creating regional dummies
gen north=0
replace north=1 if oblast==8 
replace north=1 if oblast==11
gen south=0
replace south=1 if oblast==3
replace south=1 if oblast==5
replace south=1 if oblast==6
replace south=1 if oblast==21
gen mount=0
replace mount=1 if oblast==2
replace mount=1 if oblast==4
replace mount=1 if oblast==7
drop oblast location
save "derived/region.dta", replace
