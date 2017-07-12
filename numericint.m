syms x h(x)
h(x)=input('enter the function in terms of x to be integrated');
o=input('enter the size of spacing');
f=input('enter the number of the array');
m=input('enter the number of precision of digits');
s=input('enter the start of integration');
t=zeros(f,1);
y=zeros(f,1);
for i=1:f
    t(i)=vpa(int(h(x),'x',[(s+(i-1)*o) s+i*o]),m);
    if i==1
        y(1)=t(1);
    else
        y(i)=y(i-1)+t(i);
    end
end
k=o:o:size(t)*o;
k=k+s;
plot(k,y);