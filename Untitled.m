t = linspace(-50*pi,50*pi);
x = square(t/2*(15*pi),50);
y = square(((t-5)/(15*pi)),50);
q = conv(x,y);
plot(t,q)
