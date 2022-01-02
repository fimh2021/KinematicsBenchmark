function f=CompareDisp(ParticipantName, Output_dir, CP_dX, CP_dY, CP_dZ, dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf, CP_Xref, CP_Yref, CP_Zref,f)

% This function is designed to plot the differences between ground-truth 
% and participant's displacements
% CP_dX: ground truth dX
% CP_dY: ground truth dY
% CP_dZ: ground truth dZ
% dispX_SNRinf: dX for SNR infinite evaluated by participant
% dispY_SNRinf: dY for SNR infinite evaluated by participant
% dispZ_SNRinf: dZ for SNR infinite evaluated by participant
% CP_Xref: Computational phantom sampling points X position in ref configuration 
% CP_Yref: Computational phantom sampling points Y position in ref configuration 
% CP_Zref: Computational phantom sampling points Z position in ref configuration 
% Three types of figures are generated:
% 1) 3D displacement vectors plot
% 2) Displacement spatial maps
% 3) Displacement difference boxplots


%% Step 1 (check #1): 3D Displacement vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
down_sampling = 5; 
z_loc_color = ['b','g','r'];
[sizeX, sizeY, sizeZ] = size(dispX_SNRinf);

% Plot ground-truth and participant's displacements for the computational
% phantom
for s=1:sizeZ % Slice number:  s=1 (apex), s=2 (mid), s=3 (base) 
    
    % X coordinates for the sampling points
    X_slice = CP_Xref.Xref(:,:,s);    
    % Y coordinates for the sampling points
    Y_slice = CP_Yref.Yref(:,:,s);  
    % Z coordinates for the sampling points
    Z_slice = CP_Zref.Zref(:,:,s);
    
    % Ground-truth dX
    dX_GT = CP_dX.dispX(:,:,s);
    % Ground-truth dY
    dY_GT = CP_dY.dispY(:,:,s);
    % Ground-truth dZ
    dZ_GT = CP_dZ.dispZ(:,:,s);
    
    % Participant's calculation for dX
    dX_P = dispX_SNRinf(:,:,s);
    % Participant's calculation for dY
    dY_P = dispY_SNRinf(:,:,s);
    % Participant's calculation for dZ
    dZ_P = dispZ_SNRinf(:,:,s);

    h1 = figure(1);
    % Maximize the figure
    set(h1,'Units','normalized','Position',[0 0 1 1]);
    % set(h1,'Position',[10 10 600 600]);
    subplot(1,2,1),
    title('GT displacement (b:z=4;g:z=12;r:z=20;)');
    hold on;
    number_of_voxels_GT=0;
    for i = 1:down_sampling:sizeX
        for j = 1:down_sampling:sizeY
            if ( ~isnan(dX_GT(i,j)) )
                Xg = X_slice(i,j); Yg = Y_slice(i,j); Zg = Z_slice(i,j);
                % quiver3(X_slice(i,j), Y_slice(i,j), Z_slice(i,j), dX_GT(i,j), dY_GT(i,j), dZ_GT(i,j), 2, z_loc_color(s));
                plot3(Xg, Yg, Zg, 'o', 'Color', z_loc_color(s));
                plot3([Xg, Xg+dX_GT(i,j)], [Yg, Yg+dY_GT(i,j)], [Zg, Zg+dZ_GT(i,j)], 'Color', z_loc_color(s));
                number_of_voxels_GT=number_of_voxels_GT+1;
            end
        end
    end
    view(90,45);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    axis([-40 40 -40 40 0 25]);
    hold off;
    
    subplot(1,2,2);
    title('Participant displacement (b:z=4;g:z=12;r:z=20;)');
    hold on;
    number_of_voxels_P=0;
    for i = 1:down_sampling:sizeX
        for j = 1:down_sampling:sizeY
            if ( ~isnan(dX_P(i,j)) )
                Xg = X_slice(i,j); Yg = Y_slice(i,j); Zg = Z_slice(i,j);
                % quiver3(X_slice(i,j), Y_slice(i,j), Z_slice(i,j), dX_P(i,j), dY_P(i,j), dZ_P(i,j), 2, z_loc_color(s));
                plot3(Xg, Yg, Zg, 'o', 'Color', z_loc_color(s),'MarkerFaceColor',z_loc_color(s));
                plot3([Xg, Xg+dX_P(i,j)], [Yg, Yg+dY_P(i,j)], [Zg, Zg+dZ_P(i,j)], 'Color', z_loc_color(s));
                number_of_voxels_P=number_of_voxels_P+1;
            end
        end
    end
    view(90,45)
    hold off;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    axis([-40 40 -40 40 0 25]);
end
% Save the displacment plot to be included in the comparison report
saveas(h1,[Output_dir,'/Displacement_comparison_3D'],'fig');
fprintf('-----> Step 2(a): Plot 3D displacement vectors completed ......\n');
waitbar(0.5,f,'Step 2(a): Plot 3D displacement vectors completed','WindowStyle','modal');
pause(.5);
close all;

%% Step 2 (Check #2): Displacement spatial map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SlicePos = ['z = 4 '; 'z = 12'; 'z = 20'];
for s = 1:sizeZ % Slice number - s=1 (apex), s=2 (mid), s=3 (base) 
    
    % Compute difference between Participant displacements and GT
    dispX_diff(:,:,s) = dispX_SNRinf(:,:,s) - CP_dX.dispX(:,:,s);
    dispY_diff(:,:,s) = dispY_SNRinf(:,:,s) - CP_dY.dispY(:,:,s);
    dispZ_diff(:,:,s) = dispZ_SNRinf(:,:,s) - CP_dZ.dispZ(:,:,s);
    
    % Define the position of the sample points
    X_slice = CP_Xref.Xref(:,:,s);    
    Y_slice = CP_Yref.Yref(:,:,s);    
    Z_slice = CP_Zref.Zref(:,:,s);
    
    % Plot displacement spatial maps
    % subplots 1-3: ground-truth dX, dY, dZ
    % subplots 4-6: participant's results for dX, dY, dZ
    % subplots 7-9: difference in dX, dY, dZ
    
    hs = figure(2+s);
    set(hs,'Units','normalized','Position',[0 0 1 1]);
    sgtitle([SlicePos(s,:),' slice']) 
    %%%%%%%%%%%%%%%%%%%% GT solutions %%%%%%%%%%%%%%%%%%%%
    subplot(3,3,1),imagesc(CP_dX.dispX(:,:,s));
    title('GT dX');
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,2),imagesc(CP_dY.dispY(:,:,s));
    title('GT dY');
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,3),imagesc(CP_dZ.dispZ(:,:,s));
    title('GT dZ');
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    %%%%%%%%%%%%%%%%%%%% Participant's results %%%%%%%%%%%%%%%%%%%%
    subplot(3,3,4),imagesc(dispX_SNRinf(:,:,s));
    title([ParticipantName,' dX']);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,5),imagesc(dispY_SNRinf(:,:,s));
    title([ParticipantName,' dY']);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,6),imagesc(dispZ_SNRinf(:,:,s));
    title([ParticipantName,' dZ']);
    axis equal;
    caxis([-5 5]);
    axis([0 160 0 160]);
    colorbar;
    %%%%%%%%%%%%%%%%%%%% Differences %%%%%%%%%%%%%%%%%%%%
    subplot(3,3,7),imagesc(dispX_diff(:,:,s));
    title(['dX difference']);
    axis equal;
    caxis([-0.5 0.5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,8),imagesc(dispY_diff(:,:,s));
    title(['dY difference']);
    axis equal;
    caxis([-0.5 0.5]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,9),imagesc(dispZ_diff(:,:,s));
    title(['dZ difference']);
    axis equal;
    caxis([-0.5 0.5]);
    axis([0 160 0 160]);
    colorbar;
    % Save the figures
    saveas(gcf,[Output_dir,'/DispComp_slice',num2str(s)],'fig');

end
fprintf('-----> Step 2(b): Plot displacement maps completed ......\n');
waitbar(0.55,f,'Step 2(b): Plot displacement maps completed','WindowStyle','modal');
pause(.5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 3 (Check #3): Displacement difference boxplot
h6 = figure(6);
set(h6,'Units','normalized','Position',[0 0 1 1]);

sgtitle('Displacement Differences Boxplots') 
subplot(1,3,1);
dispX_diff_tmp_1 = dispX_diff(:,:,1); dispX_diff_tmp_1 = dispX_diff_tmp_1(~isnan(dispX_diff_tmp_1));
dispX_diff_tmp_2 = dispX_diff(:,:,2); dispX_diff_tmp_2 = dispX_diff_tmp_2(~isnan(dispX_diff_tmp_2));
dispX_diff_tmp_3 = dispX_diff(:,:,3); dispX_diff_tmp_3 = dispX_diff_tmp_3(~isnan(dispX_diff_tmp_3));
boxplot([dispX_diff_tmp_1(:), dispX_diff_tmp_2(:), dispX_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
ylabel('dX difference');
set(gca,'FontSize',14);

subplot(1,3,2);
dispY_diff_tmp_1 = dispY_diff(:,:,1); dispY_diff_tmp_1 = dispY_diff_tmp_1(~isnan(dispY_diff_tmp_1));
dispY_diff_tmp_2 = dispY_diff(:,:,2); dispY_diff_tmp_2 = dispY_diff_tmp_2(~isnan(dispY_diff_tmp_2));
dispY_diff_tmp_3 = dispY_diff(:,:,3); dispY_diff_tmp_3 = dispY_diff_tmp_3(~isnan(dispY_diff_tmp_3));
boxplot([dispY_diff_tmp_1(:), dispY_diff_tmp_2(:), dispY_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
ylabel('dY difference');
set(gca,'FontSize',14);

subplot(1,3,3);
dispZ_diff_tmp_1 = dispZ_diff(:,:,1); dispZ_diff_tmp_1 = dispZ_diff_tmp_1(~isnan(dispZ_diff_tmp_1));
dispZ_diff_tmp_2 = dispZ_diff(:,:,2); dispZ_diff_tmp_2 = dispZ_diff_tmp_2(~isnan(dispZ_diff_tmp_2));
dispZ_diff_tmp_3 = dispZ_diff(:,:,3); dispZ_diff_tmp_3 = dispZ_diff_tmp_3(~isnan(dispZ_diff_tmp_3));
boxplot([dispZ_diff_tmp_1(:), dispZ_diff_tmp_2(:), dispZ_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
ylabel('dZ difference');
set(gca,'FontSize',14);

saveas(gcf,[Output_dir,'/DispComp_Boxplot'],'fig');
close all;

fprintf('-----> Step 2(c): Displacement differences boxplots completed ......\n');
waitbar(0.6,f,'Step 2(c): Displacement differences boxplots completed','WindowStyle','modal');
pause(.5);

return




