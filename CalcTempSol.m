% CalcTempSol.m -- JFG -- 06/04/2017
%
% Calcul de la solution en temp�rature
% pour un jeu de Omega et un jeu de Positions
%

function ProfilTemperature = CalcTempSol(Position, Omega, Longueur, ParamTemp) 

% R�cup�re les temp�ratures
	Temp0   = ParamTemp(1);
	Temp1   = ParamTemp(2);
	TempExt = ParamTemp(3);
	clear ParamTemp

% Calcul du profil de temp�rature
	ProfilTemperature = (Temp1-TempExt) * sinh(Omega.*Position) - (Temp0-TempExt) * sinh(Omega.*(Position-Longueur)); 
	ProfilTemperature = TempExt + ProfilTemperature ./ sinh(Omega*Longueur); 
