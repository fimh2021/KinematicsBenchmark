function CardiacKinematicsPhantom_GT_Comparison

% This function is designed to allow participant of the FIMH 2021 Cardiac
% Kinematics Benchmark to compare their computational phantom solution with
% ground-truth solution calculated based on the equations of deformation
% published in ..........
% Authors: Vicky Wang and Luigi Perotti
% Note: before running this script, please ensure the participant's
% solutions are stored under "Data/participantID" and stored in the format
% specified in the benchmark instructio.

close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Ground-truth displacements %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Step 0(a): Load ground-truth displacements
GT_solution_directory='GT_solutions/';
CP_dX = load([GT_solution_directory,'/CP_dispX.mat']);
CP_dY = load([GT_solution_directory,'/CP_dispY.mat']);
CP_dZ = load([GT_solution_directory,'/CP_dispZ.mat']);
CP_Xref = load([GT_solution_directory,'/CP_Xref.mat']);
CP_Yref = load([GT_solution_directory,'/CP_Yref.mat']);
CP_Zref = load([GT_solution_directory,'/CP_Zref.mat']);
fprintf('-----> Step 0(a): Load ground-truth solutions completed ......\n');

% Step 0(b): Import participant's name from the results folder
results_directory='Data';
all_results_files=dir(results_directory);
all_results_files(1:2)=[];
ParticipantsNames=all_results_files.name;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Participant's results: displacements %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load displacement data
%[dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf, dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf] = LoadDispData(ParticipantsNames{p});
[dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf] = LoadDispData(ParticipantsNames);
fprintf('-----> Step 0(b): Load participant"s results completed ......\n');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Auxiliary parameters %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the spatial locations of solution sample points
z_bottom=4;                                 % Bottom slice
z_top=20;                                   % Top slice
number_of_z_slices=3;                       % Number of slices
[sizeX,sizeY,sizeZ]=size(CP_dX.dispX);      % Size of the sampling points matrix
x=linspace(1,sizeX,sizeX);
y=linspace(1,sizeY,sizeY);
z=linspace(z_bottom,z_top,number_of_z_slices);
[X,Y,Z]=meshgrid(x,y,z);                    % Construct the grid of sampling points
down_sampling=10;                            % Down sample the points for quiver3 plot
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Check displacement vectors %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Step 1 (check #1): 3D Displacement vector
figure(100)
z_loc_color=['b','g','r'];
%{
% Loop through each of the z slices
for s=1:sizeZ
    X_current_slice= CP_Xref.Xref(:,:,s);    % Define rows of the sampling points matrix (i)
    Y_current_slice= CP_Yref.Yref(:,:,s);    % Define columns of the sampling points matrix (j)
    Z_current_slice= CP_Zref.Zref(:,:,s);
    for i=1:down_sampling:sizeX
        for j=1:down_sampling:sizeY
            % Transforming sampling points from (i,j,k) to (x,y,z)
            % in physical coordinate system
            % i = X_current_slice;
            % j = Y_current_slice;
            % k = Z_current_slice;
            % Origin (i,j,k): top left corner -> Origin (x,y,z): bottom
            % left corner (x,y,z) involves swapping i and j, and subtract i
            % from the dimension of the sampling points matrix along the y
            % axis.
            quiver3(X_current_slice(i,j),Y_current_slice(i,j),Z_current_slice(i,j),CP_dX.dispX(i,j,s),CP_dY.dispY(i,j,s),CP_dZ.dispZ(i,j,s),2,z_loc_color(s));
            hold on;
            % ABI ground truth solutions provided by George            
            quiver3(X_current_slice(i,j),Y_current_slice(i,j),Z_current_slice(i,j),ABI_GT_dX.dispX(i,j,s),ABI_GT_dY.dispY(i,j,s),ABI_GT_dZ.dispZ(i,j,s),2,'m');
            %{
            view([0 90]);
            subplot(1,3,2),quiver3(Y_current_slice(i,j),sizeX-X_current_slice(i,j),Z_current_slice(i,j),CP_dY.dispY(i,j,s),-CP_dX.dispX(i,j,s),CP_dZ.dispZ(i,j,s),2,z_loc_color(s));
            hold on;
            view([90 0]);
            subplot(1,3,3),quiver3(Y_current_slice(i,j),sizeX-X_current_slice(i,j),Z_current_slice(i,j),CP_dY.dispY(i,j,s),-CP_dX.dispX(i,j,s),CP_dZ.dispZ(i,j,s),2,z_loc_color(s));
            hold on;
            view([30 60]);
        %}
        end
    end
end
% Lock the view in 2D
fprintf('-----> Step 1: Plot 3D displacement vectors completed ......\n');
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 2 (Check #2): Displacement spatial map
for s=1:sizeZ
    
    % Calculate the difference wrt to ground-truth solution
    dispX_diff(:,:,s)=CP_dX.dispX(:,:,s)-dispX_SNRinf(:,:,s);
    dispY_diff(:,:,s)=CP_dY.dispY(:,:,s)-dispY_SNRinf(:,:,s);
    dispZ_diff(:,:,s)=CP_dZ.dispZ(:,:,s)-dispZ_SNRinf(:,:,s);
    
    X_current_slice= CP_Xref.Xref(:,:,s);    % Define rows of the sampling points matrix (i)
    Y_current_slice= CP_Yref.Yref(:,:,s);    % Define columns of the sampling points matrix (j)
    Z_current_slice= CP_Zref.Zref(:,:,s);
    
    % Start to plot displacement spatial maps
    % subplots 1-3: ground-truth dX, dY, dZ
    % subplots 4-6: participant's results for dX, dY, dZ
    % subplots 7-9: difference in dX, dY, dZ
    %{
    for r=1:10:size(x_current_slice_phantom_r,1)
        scatter3(X_current_slice(x_current_slice_phantom_r(r),x_current_slice_phantom_c(r)),...
            Y_current_slice(x_current_slice_phantom_r(r),x_current_slice_phantom_c(r)),...
            Z_current_slice(x_current_slice_phantom_r(r),x_current_slice_phantom_c(r))+0.5,...
            30,dispX_SNRinf(x_current_slice_phantom_r(r),x_current_slice_phantom_c(r),s));
        hold on;
        
    end
    %}
    fig_number=100+s;
    figure(fig_number)
    %%%%%%%%%%%%%%%%%%%% GT solutions %%%%%%%%%%%%%%%%%%%%%
    subplot(3,3,1),imagesc(CP_dX.dispX(:,:,s));
    title(['GT dX Partition ',num2str(s)]);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,2),imagesc(CP_dY.dispY(:,:,s));
    title(['GT dY Partition ',num2str(s)]);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,3),imagesc(CP_dZ.dispZ(:,:,s));
    title(['GT dZ Partition ',num2str(s)]);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    %%%%%%%%%%%%%%%%%%%% Participant's results %%%%%%%%%%%%%%%%%%%%%
    subplot(3,3,4),imagesc(dispX_SNRinf(:,:,s));
    title([ParticipantsNames,' dX Partition',num2str(s)]);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,5),imagesc(dispY_SNRinf(:,:,s));
    title([ParticipantsNames,' dY Partition',num2str(s)]);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,6),imagesc(dispZ_SNRinf(:,:,s));
    title([ParticipantsNames,' dZ Partition',num2str(s)]);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    %%%%%%%%%%%%%%%%%%%% Differences %%%%%%%%%%%%%%%%%%%%%
    subplot(3,3,7),imagesc(dispX_diff(:,:,s));
    title(['dX difference Partition',num2str(s)]);
    axis equal;
    caxis([-0.5 0.5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,8),imagesc(dispY_diff(:,:,s));
    title(['dY difference Partition',num2str(s)]);
    axis equal;
    caxis([-0.5 0.5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,9),imagesc(dispZ_diff(:,:,s));
    title(['dZ difference Partition',num2str(s)]);
    axis equal;
    caxis([-0.5 0.5]);
    axis([0 160 0 160]);
    colorbar;
    %}
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 3 (Check #3): Displacement difference boxplot
figure(500)
dispX_diff_tmp_1=dispX_diff(:,:,1);
dispX_diff_tmp_2=dispX_diff(:,:,2);
dispX_diff_tmp_3=dispX_diff(:,:,3);
subplot(1,3,1),boxplot([dispX_diff_tmp_1(:),dispX_diff_tmp_2(:),dispX_diff_tmp_3(:)],...
                       {'Slice 1','Slice 2','Slice 3'});
title('dX difference');
set(gca,'YLim',[-0.6 0.6]);
dispY_diff_tmp_1=dispY_diff(:,:,1);
dispY_diff_tmp_2=dispY_diff(:,:,2);
dispY_diff_tmp_3=dispY_diff(:,:,3);
subplot(1,3,2),boxplot([dispY_diff_tmp_1(:),dispY_diff_tmp_2(:),dispY_diff_tmp_3(:)],...
                       {'Slice 1','Slice 2','Slice 3'});
title('dY difference');
set(gca,'YLim',[-0.6 0.6]);
dispZ_diff_tmp_1=dispZ_diff(:,:,1);
dispZ_diff_tmp_2=dispZ_diff(:,:,2);
dispZ_diff_tmp_3=dispZ_diff(:,:,3);
subplot(1,3,3),boxplot([dispZ_diff_tmp_1(:),dispZ_diff_tmp_2(:),dispZ_diff_tmp_3(:)],...
                       {'Slice 1','Slice 2','Slice 3'});
title('dX difference');
set(gca,'YLim',[-0.01 0.01]);
                   

%{
ParticipantsNames = {'ABI'};
%ParticipantsNames = {'ABI';'Delbeat';'IEC';'Osmium-CIM-AY';'Osmium-CIM-HB';'Osmium-DA-SA';'Osmium-DA-HB';'SFVA';'Stanford-Mike1';'Stanford-Mike2';'Stanford-Qiu';'UCF-CBL';'UVA'};

FigNum=10;
for p = 1:length(ParticipantsNames)
    
    ParticipantsNames{p}
    % Load displacement data
    %[dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf, dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf] = LoadDispData(ParticipantsNames{p});
    [dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf] = LoadDispData(ParticipantsNames{p});
    
    % Calculate the difference wrt to ground-truth solution
    dispX_diff=CP_dX.dispX(:,:,s)-dispX_SNRinf(:,:,s);
    dispY_diff=CP_dY.dispY(:,:,s)-dispY_SNRinf(:,:,s);
    dispZ_diff=CP_dZ.dispZ(:,:,s)-dispZ_SNRinf(:,:,s);
    
    figure(FigNum),
    subplot(1,3,1),imagesc(CP_dX.dispX(:,:,s));
    title(['GT dX Partition ',num2str(s)]);
    axis equal;
    caxis([-3 3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(1,3,2),imagesc(dispX_SNRinf(:,:,s));
    title(['Participant dX Partition ',num2str(s)]);
    axis equal;
    caxis([-3 3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(1,3,3),imagesc(dispX_diff);
    title(['dX error Partition ',num2str(s)]);
    axis equal;
    caxis([-2 2]);
    axis([0 160 0 160]);
    colorbar;
    FigNum=FigNum+10;
    
    figure(FigNum),
    subplot(1,3,1),imagesc(CP_dY.dispY(:,:,s));
    title(['GT dY Partition ',num2str(s)]);
    axis equal;
    caxis([-3 3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(1,3,2),imagesc(dispY_SNRinf(:,:,s));
    title(['Participant dY Partition ',num2str(s)]);
    axis equal;
    caxis([-3 3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(1,3,3),imagesc(dispY_diff);
    title(['dY error Partition ',num2str(s)]);
    axis equal;
    caxis([-2 2]);
    axis([0 160 0 160]);
    colorbar;
    FigNum=FigNum+10;
    
    figure(FigNum),
    subplot(1,3,1),imagesc(CP_dZ.dispZ(:,:,s));
    title(['GT dZ Partition ',num2str(s)]);
    axis equal;
    caxis([-3 3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(1,3,2),imagesc(dispZ_SNRinf(:,:,s));
    title(['Participant dY Partition ',num2str(s)]);
    axis equal;
    caxis([-3 3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(1,3,3),imagesc(dispZ_diff);
    title(['dZ error Partition ',num2str(s)]);
    axis equal;
    caxis([-2 2]);
    axis([0 160 0 160]);
    colorbar;
    FigNum=FigNum+10;
    
    % Plot boxplots for the displacement difference
    figure(FigNum)
    subplot(1,3,1),boxplot(dispX_diff(:));
    title('dX difference (mm)');
    axis([-0.5 0.5]);
    subplot(1,3,2),boxplot(dispY_diff(:));
    title('dY difference (mm)');
    axis([-0.5 0.5]);
    subplot(1,3,3),boxplot(dispZ_diff(:));
    title('dZ difference (mm)');
    axis([-0.5 0.5]);
    FigNum=FigNum+10;
end
%}