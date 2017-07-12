syms r f(r) q(r) W(r) Q(r) e(r) M2(r)
f(r)=input('enter the function of the force in terms of r : ');
q(r)=input('enter the function of the heat in terms of r : ');
enot=input('enter the initial energy of the winds ');
W(r)=int(f(r),'r');
Q(r)=int(q(r),'r');
e(r)=W(r)+Q(r)+enot;
%b=input('the mass of the star and b will be GM');
b=0;
eqn= ((M2-1)/M2)*diff( M2(r),r) == (4*(3+M2)/3)*((e(r)/r+f-((3+5*M2)*(q/12)))/e(r)+b/r);
eqn2 = e(r)/r+f-((2)*(q/3)) == 0;
solr=solve(eqn2,r);
solr=double(solr);
k=1;
for i=1:size(solr)
    if solr(i)~=0
       cond(k)= M2(solr(i))==1; 
       k=k+1;
    end
end
M2(r)=dsolve(eqn,cond(1),'Ignoreanalyticconstraints',false);
Mach(r)=sqrt(M2(r));

