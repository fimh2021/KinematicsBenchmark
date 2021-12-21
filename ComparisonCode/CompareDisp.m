function CompareDisp(ParticipantName, Output_dir, CP_dX, CP_dY, CP_dZ, dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf, CP_Xref, CP_Yref, CP_Zref)

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


%% Step 1 (check #1): 3D Displacement vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
down_sampling = 5; 
z_loc_color = ['b','g','r'];
[sizeX, sizeY, sizeZ] = size(dispX_SNRinf);

% Plot Computational phantom and Participant displacements
for s=1:sizeZ % Slice number - s=1 (apex), s=2 (mid), s=3 (base) 
    X_slice = CP_Xref.Xref(:,:,s);    
    Y_slice = CP_Yref.Yref(:,:,s);    
    Z_slice = CP_Zref.Zref(:,:,s);
    
    dX_GT = CP_dX.dispX(:,:,s);
    dY_GT = CP_dY.dispY(:,:,s);
    dZ_GT = CP_dZ.dispZ(:,:,s);
    
    dX_P = dispX_SNRinf(:,:,s);
    dY_P = dispY_SNRinf(:,:,s);
    dZ_P = dispZ_SNRinf(:,:,s);

    h1 = figure(1);
    set(h1,'Position',[10 10 600 600]);
    title('GT displacement');
    hold on;
    for i = 1:down_sampling:sizeX
        for j = 1:down_sampling:sizeY
            if ( ~isnan(dX_GT(i,j)) )
                Xg = X_slice(i,j); Yg = Y_slice(i,j); Zg = Z_slice(i,j);
                % quiver3(X_slice(i,j), Y_slice(i,j), Z_slice(i,j), dX_GT(i,j), dY_GT(i,j), dZ_GT(i,j), 2, z_loc_color(s));
                plot3(Xg, Yg, Zg, 'o', 'Color', z_loc_color(s));
                plot3([Xg, Xg+dX_GT(i,j)], [Yg, Yg+dY_GT(i,j)], [Zg, Zg+dZ_GT(i,j)], 'Color', z_loc_color(s));
            end
        end
    end
    view(90,45)
    hold off;
    
    h2 = figure(2);
    set(h2,'Position',[610 10 600 600]);
    title('Participant displacement');
    hold on;
    for i = 1:down_sampling:sizeX
        for j = 1:down_sampling:sizeY
            if ( ~isnan(dX_P(i,j)) )
                Xg = X_slice(i,j); Yg = Y_slice(i,j); Zg = Z_slice(i,j);
                % quiver3(X_slice(i,j), Y_slice(i,j), Z_slice(i,j), dX_P(i,j), dY_P(i,j), dZ_P(i,j), 2, z_loc_color(s));
                plot3(Xg, Yg, Zg, 'o', 'Color', z_loc_color(s));
                plot3([Xg, Xg+dX_P(i,j)], [Yg, Yg+dY_P(i,j)], [Zg, Zg+dZ_P(i,j)], 'Color', z_loc_color(s));
            end
        end
    end
    view(90,45)
    hold off;
end

fprintf('-----> Step 2: Plot 3D displacement vectors completed ......\n');



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
    
    % Start to plot displacement spatial maps
    % subplots 1-3: ground-truth dX, dY, dZ
    % subplots 4-6: participant's results for dX, dY, dZ
    % subplots 7-9: difference in dX, dY, dZ
    
    hs = figure(2+s);
    set(hs,'Position',[200 200 800 800])
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 3 (Check #3): Displacement difference boxplot
h6 = figure(6);
set(h6,'Position',[200 200 800 800])

sgtitle('Displacement Differences') 
subplot(1,3,1);
title('dX difference');
dispX_diff_tmp_1 = dispX_diff(:,:,1); dispX_diff_tmp_1 = dispX_diff_tmp_1(~isnan(dispX_diff_tmp_1));
dispX_diff_tmp_2 = dispX_diff(:,:,2); dispX_diff_tmp_2 = dispX_diff_tmp_2(~isnan(dispX_diff_tmp_2));
dispX_diff_tmp_3 = dispX_diff(:,:,3); dispX_diff_tmp_3 = dispX_diff_tmp_3(~isnan(dispX_diff_tmp_3));
boxplot([dispX_diff_tmp_1(:), dispX_diff_tmp_2(:), dispX_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);

subplot(1,3,2);
title('dY difference');
dispY_diff_tmp_1 = dispY_diff(:,:,1); dispY_diff_tmp_1 = dispY_diff_tmp_1(~isnan(dispY_diff_tmp_1));
dispY_diff_tmp_2 = dispY_diff(:,:,2); dispY_diff_tmp_2 = dispY_diff_tmp_2(~isnan(dispY_diff_tmp_2));
dispY_diff_tmp_3 = dispY_diff(:,:,3); dispY_diff_tmp_3 = dispY_diff_tmp_3(~isnan(dispY_diff_tmp_3));
boxplot([dispY_diff_tmp_1(:), dispY_diff_tmp_2(:), dispY_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
    
subplot(1,3,3);
title('dZ difference');
dispZ_diff_tmp_1 = dispZ_diff(:,:,1); dispZ_diff_tmp_1 = dispZ_diff_tmp_1(~isnan(dispZ_diff_tmp_1));
dispZ_diff_tmp_2 = dispZ_diff(:,:,2); dispZ_diff_tmp_2 = dispZ_diff_tmp_2(~isnan(dispZ_diff_tmp_2));
dispZ_diff_tmp_3 = dispZ_diff(:,:,3); dispZ_diff_tmp_3 = dispZ_diff_tmp_3(~isnan(dispZ_diff_tmp_3));
boxplot([dispZ_diff_tmp_1(:), dispZ_diff_tmp_2(:), dispZ_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);

saveas(gcf,[Output_dir,'/DispComp_Boxplot'],'fig');









