proc print data = rice;
run;

proc corr data=rice;
    var wellMilled volumePalay areaPalay areaApplied; 
run;

proc reg data = rice;
model wellMilled = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = rsquare adjrsq mse cp AIC SBC press alpha = 0.05;
run;

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





proc reg data = rice;
model wellMilled = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = forward slentry = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = wellforward  p = wellforwardyhat r = wellforwardr ;
run;

proc univariate data = wellforward freq plot normal;
var wellforwardr;
run;

proc means data = wellforward ;
var wellforwardr;
run;

proc anova data = wellforward;
class year;
model wellforwardr = year;
means year / hovtest=Levene;
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

proc univariate data = regresult freq plot normal;
var regresid;
run;

proc means data = regresult ;
var regresid;
run;

proc anova data = regresult;
class year;
model regresid = year;
means year / hovtest=Levene;
run;

proc reg data = rice2;
model regularMilled3 = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = forward slentry = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = regforward  p = regforwardyhat r = regforwardr ;
run;


proc univariate data = regforward freq plot normal;
var regforwardr;
run;

proc means data = regforward;
var regforwardr;
run;

proc anova data = regforward;
class year;
model regforwardr = year;
means year / hovtest=Levene;
run;

proc reg data = rice2;
model regularMilled3 = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = backward slstay = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = regbackward  p = regbackwardyhat r = regbackwardr ;
run;

proc univariate data = regbackward freq plot normal;
var regbackwardr;
run;

proc means data = regbackward;
var regbackwardr;
run;

proc anova data = regbackward;
class year;
model regbackwardr = year;
means year / hovtest=Levene;
run;







proc reg data = rice2;
model regularMilled3 = volumePalay areaPalay areaApplied region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = stepwise slentry = 0.05 slstay = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = regstep  p = regstepyhat r = regstepr ;
run;

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

proc means data = specialresult;
var specialresid;
run;



proc anova data = specialresult;
class year;
model specialresid = year;
means year / hovtest=Levene;
run;

proc reg data = rice3;
model lnspecialMilled = volumePalay areaPalay areaApplied2 region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = forward slentry = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = specialforward  p = specialforwardyhat r = specialforwardr ;
run;

proc univariate data = specialforward freq plot normal;
var specialforwardr;
run;

proc means data = specialforward;
var specialforwardr;
run;

proc anova data = specialforward;
class year;
model specialforwardr = year;
means year / hovtest=Levene;
run;

proc reg data = rice3;
model lnspecialMilled = volumePalay areaPalay areaApplied2 region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = backward slstay = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = specialbackward  p = specialbackwardyhat r = specialbackwardr ;
run;

proc univariate data = specialbackward freq plot normal;
var specialbackwardr;
run;



proc means data = specialbackward;
var specialbackwardr;
run;

proc anova data = specialbackward;
class year;
model specialbackwardr = year;
means year / hovtest=Levene;
run;

proc reg data = rice3;
model lnspecialMilled = volumePalay areaPalay areaApplied2 region2 region3 region4 region5  region6 year2 year3 year4
	 / selection = stepwise slentry = 0.05 slstay = 0.05
	clm cli clb covb corrb all r influence dwprob vif tol collin alpha = .05;
output out = specialstep  p = specialstepyhat r = specialstepr ;
run;
