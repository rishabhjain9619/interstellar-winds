tau=input('enter the value of tau ');
syms w x
t=zeros(69,2);
eqn(x)= w^(tau+1) - (w^(tau-1))*(4/x+((5-3*tau)/(tau-1))) + (2/(tau-1))*x^(2-2*tau) ==0;
for i=1:1:70
    x=i/10;
    t(i,1)=vpasolve(eqn(x),w,0.0001);
end
for i=1:1:70
    x=i/10;
    t(i,2)=vpasolve(eqn(x),w,8);
end
x=0.1:0.1:7;
plot(log(x),t,'DisplayName',['tau=' num2str(tau)])
hold on
legend('show','location','best')
xlabel('radial distance log(r/rcrit)')
ylabel('velocity of the winds v/vcrit')
title('implicit relation for polytropic winds for p =k*rho^\gamma')