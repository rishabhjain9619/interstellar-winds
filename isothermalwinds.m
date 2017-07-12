% this program is for plotting graph of isothermal winds

%{
T=input('enter the temperature of the star');
mu=input('enter the mean atomic mass in kg');
a=sqrt(R*T/mu);
M=input('the mass of the star');
a=372000;
G=6.6741e-11;
M=1.989*10^30;
b=G*M;
eqn= diff(v(r),r)==v*((2*(a)^2/r-b/r^2)/(v^2-a^2));
cond =v(b/(2*a^2))==a;
k(r)=dsolve(eqn,cond);
n=(1000:1000:1000000);
m=k(n);
%}


syms v(r) r;
eqn= diff(v(r),r)==v*((10/r-100/r^2)/(v^2-100));
cond =v(10)==10;
k(r)=dsolve(eqn,cond,'Ignoreanalyticconstraints',false);
i=2:0.1:50;
z=zeros(size(i));
y=zeros(size(i));
j=1;
for i=2:0.1:50
    t=k(i);
    z(j)=t(1);
    y(j)=t(2);
    j=j+1;
end
i=2:0.1:50;
plot(i,z)
hold on
plot(i,y)
xlabel('radial distance')
ylabel('velocity of the winds')
title('interstellar winds of a star for critical solution')
