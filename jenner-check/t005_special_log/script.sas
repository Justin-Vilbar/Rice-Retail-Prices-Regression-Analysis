proc corr data=rice;
    var specialMilled volumePalay areaPalay areaApplied; 
run;

data rice3;
set rice;
areaApplied2=areaApplied*areaApplied;
lnspecialMilled=log(specialMilled);
proc print data = rice3;
run;

proc reg data = rice3;
model lnspecialMilled = volumePalay areaPalay areaApplied2 region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = rsquare adjrsq mse cp AIC SBC press alpha = 0.05;
run;

proc reg data = rice3;
model lnspecialMilled = volumePalay areaPalay areaApplied2 region2 region3 region4 region5  region6 year2 year3 year4/
clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = specialresult p = specialyhat r = specialresid;
run;

proc univariate data = specialresult freq plot normal;
var specialresid;
run;
