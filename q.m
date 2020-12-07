close all, clear all
L=1.5;
w1=4;
T0=20;
Tl=10;
Ta=0;
N=50;
x=linspace(0,L,N);
theta=[T0,Tl,Ta];
y=CalcTempSol(x,w1,L,theta);
figure(1);
hold on;

plot(x,y);
title("profil de température");

grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load('DataThermiqueUn.mat');
%figure(2);

%plot(GridMesures,Mesures)

load('DataThermiqueDeux.mat');


%figure(3);

plot(GridMesures,Mesures,'*');
hold off;
