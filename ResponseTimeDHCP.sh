#!/bin/bash
Input1="$1"
Input2="$2"
Input3="$3"
Input4="$4"
EXT2=".csv"
EXT3=".mat"
VIrg=","
APP="'"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotEuropeDHCP($APP$Input1$EXT2$APP$VIrg $APP$Input2$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotEuropeDHCP($APP$Input3$EXT2$APP$VIrg $APP$Input4$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotEurope90PercentDHCP($APP$Input1$EXT2$APP$VIrg $APP$Input2$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotEurope90PercentDHCP($APP$Input3$EXT2$APP$VIrg $APP$Input4$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotCountryDHCP($APP$Input1$EXT2$APP$VIrg $APP$Input2$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotCountryDHCP($APP$Input3$EXT2$APP$VIrg $APP$Input4$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotCountry90PercentDHCP($APP$Input1$EXT2$APP$VIrg $APP$Input2$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "PlotCountry90PercentDHCP($APP$Input3$EXT2$APP$VIrg $APP$Input4$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "plotErrorDHCP($APP$Input1$EXT2$APP$VIrg $APP$Input2$EXT3$APP)"
/usr/local/MATLAB/R2020b/bin/matlab -batch "plotErrorDHCP($APP$Input3$EXT2$APP$VIrg $APP$Input4$EXT3$APP)"
