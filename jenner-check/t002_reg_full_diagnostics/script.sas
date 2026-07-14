proc reg data = rice;
model wellMilled = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4/ 
clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = wellresult p = wellyhat r = wellresid;
run;

proc univariate data = wellresult freq plot normal;
var wellresid;
run;

proc means data = wellresult ;
var wellresid;
run;

proc anova data = wellresult;
class year;
model wellresid = year;
means year / hovtest=Levene;
run;
