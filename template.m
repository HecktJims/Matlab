clear; % clear all variables
close all; % close all figures

eps0 = 1e-9/(36*pi); % epsilon_0, permittivity of free space
Q = 1.602e-19; % charge of a proton
E0 = 1; % electric field intensity = 1 (V/m)
R0 = sqrt(Q/(4*pi*eps0*E0)); % distance where E field is 1 (V/m)


% Use denser grid for coutour plot
x = [-5:0.01:5]*R0;
y = [-5:0.01:5]*R0;
z = 0*R0;

[X,Y,Z] = meshgrid(x,y,z); % generate grid
R = sqrt(X.^2+Y.^2+Z.^2); % distance to the point charge

Ex = Q*X./(4*pi*eps0*R.^3); % x-component of E field vector
Ey = Q*Y./(4*pi*eps0*R.^3); % y-component of E field vector
Ez = Q*Z./(4*pi*eps0*R.^3); % z-component of E field vector

E = sqrt(Ex.^2+Ey.^2+Ez.^2); % magnitude of E field vector
V = Q./(4*pi*eps0*R); % electric potential V
V0 = Q/(4*pi*eps0*R0); % V at R0


figure(1)
subplot(2, 2, 3)
contourf(X/R0,Y/R0,log2(E),[-4:0.05:2]); hold on; % contour plot of log2|E|
title('log_2|E|','FontSize',14,'FontWeight','bold')
colormap jet % set colormap
colorbar % show colorbar
axis([-5 5 -5 5 -5 5]);
xlabel('x/R_0','FontSize',12,'FontWeight','bold');
ylabel('y/R_0','FontSize',12,'FontWeight','bold');
axis square;
set(gca,'Xtick',[-5:1:5],'Ytick',[-5:1:5],'FontSize',12,'FontWeight','bold');

subplot(2, 2, 2)
contourf(X/R0,Y/R0,log2(V/V0),[-2:0.5:2]); hold on; % contour plot of log2(V/V0)
title('log_2(V/V_0)','FontSize',14,'FontWeight','bold')
colormap jet % set colormap
colorbar % show colorbar
plot3(0,0,0,'ko'); % plot a black circle at the origin
axis([-5 5 -5 5 -5 5]);
xlabel('x/R_0','FontSize',12,'FontWeight','bold');
ylabel('y/R_0','FontSize',12,'FontWeight','bold');
axis square;
set(gca,'Xtick',[-5:1:5],'Ytick',[-5:1:5],'FontSize',12,'FontWeight','bold');
view(0,90); % view from top
grid on


% Use scarcer grid for vector plot
x = [-4:0.5:4]*R0;
y = [-4:0.5:4]*R0;
z = 0*R0;
[X,Y,Z] = meshgrid(x,y,z); % generate grid
R = sqrt(X.^2+Y.^2+Z.^2); % distance to the point charge

Ex = Q*X./(4*pi*eps0*R.^3); % x-component of E field vector
Ey = Q*Y./(4*pi*eps0*R.^3); % y-component of E field vector
Ez = Q*Z./(4*pi*eps0*R.^3); % z-component of E field vector
E = sqrt(Ex.^2+Ey.^2+Ez.^2); % magnitude of E field vector


% plot E field vector normalized to 4|E|
% After normalization, length of E vector at every point becomes the same.
% The purpose of this plot is to show the direction of E field vector. 
subplot(2, 2, 3)
quiver3(X/R0,Y/R0,Z/R0,Ex./(4*E),Ey./(4*E),Ez./(4*E),'LineWidth',1,'AutoScale','off','Color',[0.3 0.3 0.3]); hold on; % plot the vectors on top of the contour plot
plot3(0,0,0,'ko'); % plot a black circle at the origin
view(0,90); % view from top

% plot E field vector (no normalization)
subplot(2, 2, 1)
quiver3(X/R0,Y/R0,Z/R0,Ex,Ey,Ez,'LineWidth',1,'AutoScale','off','Color','k','Marker','none'); hold on
plot3(0,0,0,'ko'); % plot a black circle at the origin
axis([-5 5 -5 5 -5 5]);
xlabel('x/R_0','FontSize',12,'FontWeight','bold');
ylabel('y/R_0','FontSize',12,'FontWeight','bold');
axis square;
set(gca,'Xtick',[-5:1:5],'Ytick',[-5:1:5],'FontSize',12,'FontWeight','bold')
view(0,90); % view from top


% make 3-D plot
x = [-4:0.5:4]*R0;
y = [-4:0.5:4]*R0;
z = [-4:0.5:4]*R0;
[X,Y,Z] = meshgrid(x,y,z);
R = sqrt(X.^2+Y.^2+Z.^2);

Ex = Q*X./(4*pi*eps0*R.^3);
Ey = Q*Y./(4*pi*eps0*R.^3);
Ez = Q*Z./(4*pi*eps0*R.^3);
E = sqrt(Ex.^2+Ey.^2+Ez.^2);

subplot(2, 2, 4)
quiver3(X/R0,Y/R0,Z/R0,Ex,Ey,Ez,'LineWidth',1,'AutoScale','off','Color','k'); hold on
plot3(0,0,0,'ro'); % plot a red circle at the origin
axis([-5 5 -5 5 -5 5]);
xlabel('x/R_0','FontSize',12,'FontWeight','bold');
ylabel('y/R_0','FontSize',12,'FontWeight','bold');
zlabel('z/R_0','FontSize',12,'FontWeight','bold');
set(gca,'Xtick',[-5:1:5],'Ytick',[-5:1:5],'Ztick',[-5:1:5],'FontSize',12,'FontWeight','bold')
axis square;
view(120,30); % set viewpoint