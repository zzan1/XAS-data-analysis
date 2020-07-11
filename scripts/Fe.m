
% this file is used to calculate Fe2O3, FeO, FeFoil statics.



% I dark
DARK_PATH = "D:\J.XAS-Statics\Lin\Research_Project\solei beamtime\2018-12\4mM-FeSO4-20181207\Dark&I&I0&standard-sample\dark-1208_f000000000000_0_ascii";
prefix = "dark-1208_f000000000000_0_";
suffix = ".txt";
dark_Array = calculateDarkMean(DARK_PATH, prefix, suffix);

% I0
I0_PATH = "D:\J.XAS-Statics\Lin\Research_Project\solei beamtime\2018-12\4mM-FeSO4-20181207\Dark&I&I0&standard-sample\I0-1208_f000000000000_1_ascii";
prefix = "I0-1208_f000000000000_1_";
suffix = ".txt";
I0_Array = calculateDarkMean(I0_PATH, prefix, suffix);

% I Fe2O3
Fe2O3_PATH = "D:\J.XAS-Statics\Lin\Research_Project\solei beamtime\2018-12\4mM-FeSO4-20181207\Dark&I&I0&standard-sample\Fe2O3-1208_f000000000000_4_ascii";
prefix = "Fe2O3-1208_f000000000000_4_";
suffix = ".txt";
Fe2O3_result = calXASMean(Fe2O3_PATH, prefix, suffix, I0_Array, dark_Array);

% I Fefoil
Fefoil_PATH = "D:\J.XAS-Statics\Lin\Research_Project\solei beamtime\2018-12\4mM-FeSO4-20181207\Dark&I&I0&standard-sample\Fefoil-1208_f000000000000_2_ascii";
prefix = "Fefoil-1208_f000000000000_2_";
suffix = ".txt";
Fefoil_result = calXASMean(Fefoil_PATH, prefix, suffix, I0_Array, dark_Array);

% I FeO
FeO_PATH = "D:\J.XAS-Statics\Lin\Research_Project\solei beamtime\2018-12\4mM-FeSO4-20181207\Dark&I&I0&standard-sample\FeO-1208_f000000000000_5_ascii";
prefix = "FeO-1208_f000000000000_5_";
suffix = ".txt";
FeO_result = calXASMean(FeO_PATH, prefix, suffix, I0_Array, dark_Array);