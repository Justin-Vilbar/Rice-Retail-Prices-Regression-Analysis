proc corr data=rice;
    var regularMilled volumePalay areaPalay areaApplied; 
run;

data rice2;
set rice;
regularMilled3 = regularMilled*regularMilled*regularMilled;
proc print data = rice2;
run;

proc reg data = rice2;
model regularMilled3 = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = rsquare adjrsq mse cp AIC SBC press alpha = 0.05;
run;

proc reg data = rice2;
model regularMilled3 = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4/
clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = regresult p = regyhat r = regresid;
run;
