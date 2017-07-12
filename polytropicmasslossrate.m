M=input('enter the mass of the star in terms of solar mass');
rnot=input('enter the radius of the star in terms of solar radius');
tau=input('enter the value of tau');
R=8.3144598;
G=6.6741e-11;
rnot=rnot*695700*10^3;
M=M*1.989*10^30;
M2=1.989*10^30; %mass of sun in kg
mu=0.5;%given in book
tnot=4*10^6;
rhonot=10^-11;%given as 10^-14 gm/cm^3 as lower boundary condition in book and converted to kg/m^3
syms w x
eqn1= w^(tau+1) - (w^(tau-1))*(4/x+((5-3*tau)/(tau-1))) + (2/(tau-1))*x^(2-2*tau) ==0;
eqn2= (w^(tau-1)).*(x^(2*tau-3))==(G*M/(2*rnot))*((mu)/(tau*R*tnot));
[solx, solw] = vpasolve([eqn1, eqn2], [x, w]);
masslossrate=4*pi*rhonot*rnot^2*sqrt((tau*R*tnot)/mu)*solw^((tau+1)/2)*solx^(tau-1);
finalmasslossrate=masslossrate*(365*24*3600)/M2;%in solar mass per year
double(finalmasslossrate)