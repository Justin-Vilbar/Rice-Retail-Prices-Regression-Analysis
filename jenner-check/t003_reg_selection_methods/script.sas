proc reg data = rice;
model wellMilled = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = forward slentry = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = wellforward  p = wellforwardyhat r = wellforwardr ;
run;

proc reg data = rice;
model wellMilled = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = backward slstay = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = wellbackward  p = wellbackwardyhat r = wellbackwardr ;
run;

proc reg data = rice;
model wellMilled = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = stepwise slentry = 0.05 slstay = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = wellstep  p = wellstepyhat r = wellstepr ;
run;
