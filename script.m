close all, clear all

N=7;
xmax=9.9;
xmin=1.1;
alpha=0.0001;
beta=alpha;



%plot(int,gamma);

%%%%%%%%%%%%%%%%%%%%%%%%%%
L=1.5;
T0=20;
Tl=10;
Ta=0;
theta=[T0,Tl,Ta];
%%%%%%%%%%%%%%%%%%%%%%%%
%int=linspace(xmin,L,N);
%gamma=GammaPDF(int,alpha,1/beta);

wm=1;
wM=10;

%w=(1/(wM-wm))*(((wm<int) & (int<wM)))
%plot(int,w)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=500;

gamma=linspace(xmin,xmax,M);
w=linspace(wm,wM,M);


[X,Y]=meshgrid(gamma,w);

%%%%%%%%%%%%%%%%%%%%%%%%%%
load('DataThermiqueUn.mat');
%GridMesures1=[0.100000000000000,0.300000000000000,0.500000000000000,0.600000000000000,0.700000000000000,0.900000000000000,1]

%Mesures1=[9.39396267289403,4.50674548868151,2.11681552425357,0.284382409810610,2.11385703780643,1.17100294227979,0.528977726864491]
%phi=sum((Tn-Mesures).^2)
phi=1: M;
for i=1:M
    Tn=CalcTempSol(GridMesures,w(i),L,theta);
    phi(i)=sum((Tn-Mesures).^2);
    for j=1:M
        LP(j,i)=(0.5*N+alpha-1)*log(X(i,j))-X(i,j)*(0.5.*phi(i)+beta);
    end
end
%prior=X.^(0.5*M) * exp(-0.5*X.*phi)*X.^(alpha-1) * exp(-beta.* X)
%}
%LP=(0.5*N+alpha-1).*log(X)-X.*(0.5.*phi+beta);
figure(1);
mesh(X,Y,LP);
figure(2);
contour(LP);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure(3);
%mesh(prior)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m i j]=MaxDeux(LP);
wchap=w(27)
gammachap=gamma(1)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=linspace(0,L,N);
y2=CalcTempSol(x,wchap,L,theta);
figure(5)
hold on
load('DataThermiqueDeux');
plot(GridMesures,Mesures);
plot(x,y2);
grid;
hold off;


