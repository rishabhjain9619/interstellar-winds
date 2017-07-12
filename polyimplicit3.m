% this is for the implicit solution for the polytropic winds
%eqn= w^(tau+1) - (w^(tau-1))*(4/x+((5-3*tau)/(tau-1))) + (2/(tau-1))*x^(2-2*tau) ==0;
tau=input('enter the value of tau ');
syms w x
t=zeros(70,2);
a=zeros(1,2);
eqn(x)= w^(tau+1) - (w^(tau-1))*(4/x+((5-3*tau)/(tau-1))) + (2/(tau-1))*x^(2-2*tau) ==0;
i=1;
while i<=70
    x=i/10;
    for n = 1:2 
        a(n)=vpasolve(eqn(x),w,[0.001 10],'random',true);
    end
     if a(1)<a(2)
         t(i,1)=a(1);
         t(i,2)=a(2);
     elseif a(1)>a(2)
         t(i,1)=a(2);
         t(i,2)=a(1);
     end
     if t(i,1)==0
         i=i-1;
     end
     i=i+1;
end
x=0.1:0.1:7;
plot(log(x),t,'DisplayName',['tau=' num2str(tau)])
hold on
legend('show','location','best')
xlabel('radial distance log(r/rcrit)')
ylabel('velocity of the winds v/vcrit')
title('implicit relation for polytropic winds for p =k*rho^\gamma')