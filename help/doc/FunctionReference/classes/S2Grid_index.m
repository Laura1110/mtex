%% Discretisation of 2 - Sphere (The Class @S2Grid)
% represents a grid of nodes on the sphere 
%
%% Contents
%
%% Class Description
% The class *S2Grid* is used in MTEX to store the set of specimen
% directions organized in a [[PoleFigure_index.html,pole figure]]. Of 
% central importance is also the plotting method of this class since it is 
% used by almost all other plotting methods in MTEX to perform spherical 
% plots. 
%
%% SUB: Defining a S2Grid
%
% There are various ways to define a S2Grid. Next you find some exaples.
% For a detailed description of possible specifications look for the
% documentation of the copnstructor [[S2Grid_index.html,S2Grid]]. 

% grid from a vector of nodes v - vector3d
S2G = S2Grid([xvector,yvector]);      % specify points directly

% equidistributions
S2G = S2Grid('equispaced','points',100,'antipodal');  % specified by number of points
S2G = S2Grid('equispaced','RESOLUTION',5*degree,'antipodal');  % specified by resolution

% regular grids
S2G = S2Grid('regular','points',[72,19]); % specified by number of theta and rho steps
S2G = S2Grid('theta',linspace(0,2*pi,72),...
             'rho',linspace(0,pi/2,19)); % explicitely determine theta and rho values

% restrictes grids
S2G = S2Grid('equispaced','points',100,'MAXTHETA',75*degree);  % specifiy maximum theta angle

%% SUB: Plots

set(gcf,'position',[100,100,200,200])
plot(S2Grid('equispaced','points',100,'antipodal'))  % plot grid of nodes

