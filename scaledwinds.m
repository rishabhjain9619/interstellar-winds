R=8.3144598;
T=input('enter the temperature of the star in kelvin');
mu=0.602*10^-3;%in kg for solar composition given in book
rhonot=10^-11;%given as 10^-14 gm/cm^3 as lower boundary condition in book and converted to kg/m^3
a=sqrt(R*T/mu);
M=input('the mass of the star in terms of solar masses');
rnot=input('the radius of the star in terms of solar radius');
rnot=rnot*695700*10^3; %radius of the sun in meter
G=6.6741e-11;
M=M*1.989*10^30;
b=G*M;
rcrit=b/(2*a^2);
mdotyear=6.303*10^22;%given in mass loss rate as solar mass loss rate per year in kg/sec
a=round(a);
b=round(b);
syms v(r) r;
eqn= diff(v(r),r)==v*(((2*a^2)/r - (b/r^2))/(v^2-a^2));
cond =v(rcrit)==a;
k(r)=dsolve(eqn,cond,'Ignoreanalyticconstraints',false);
i=0.3:0.1:2;
z=zeros(size(i));
y=zeros(size(i));
j=1;
for i=0.3:0.1:2
    t=k(i*rcrit);
    z(j)=t(1);
    y(j)=t(2);
    j=j+1;
end
y=y/a;
z=z/a;
i=0.3:0.1:2;
plot(i,z)
hold on
plot(i,y)
xlabel('radial distance scaled by rcrit')
ylabel('velocity of the winds scaled by vrcit(a)')
title('interstellar winds of a star for critical solution')

