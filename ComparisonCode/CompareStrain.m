function CompareStrain(ParticipantName, Output_dir, CP_ELL, CP_ECC, CP_ERR, ELL_SNRinf, ECC_SNRinf, ERR_SNRinf);

% This function is designed to plot the differences between ground-truth 
% and participant's longitudinal, circumferential, and radial strains
% CP_ELL: ground truth E_LL
% CP_ECC: ground truth E_CC
% CP_ERR: ground truth E_RR
% ELL_SNRinf: E_LL for SNR infinite evaluated by participant
% ECC_SNRinf: E_CC for SNR infinite evaluated by participant
% ERR_SNRinf: E_RR for SNR infinite evaluated by participant
% Two types of figures are generated:
% 1) Strain spatial maps
% 2) Strain difference boxplots

sizeZ = size(ELL_SNRinf,3);

% Strain spatial map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SlicePos = ['z = 4 '; 'z = 12'; 'z = 20'];
for s = 1:sizeZ % Slice number - s=1 (apex), s=2 (mid), s=3 (base) 
    
    % Compute difference between Participant strains and GT
    ELL_diff(:,:,s) = CP_ELL.ELL(:,:,s) - ELL_SNRinf(:,:,s);
    ECC_diff(:,:,s) = CP_ECC.ECC(:,:,s) - ECC_SNRinf(:,:,s);
    ERR_diff(:,:,s) = CP_ERR.ERR(:,:,s) - ERR_SNRinf(:,:,s);

    % Start to plot strain spatial maps
    % subplots 1-3: ground-truth ELL, ECC, ERR
    % subplots 4-6: participant's results for ELL, ECC, ERR
    % subplots 7-9: difference in ELL, ECC, ERR
    
    hs = figure(6+s);
    set(hs,'Position',[200 200 800 800])
    sgtitle([SlicePos(s,:),' slice']) 
    %%%%%%%%%%%%%%%%%%%% GT solutions %%%%%%%%%%%%%%%%%%%%
    subplot(3,3,1),imagesc(CP_ELL.ELL(:,:,s));
    title('GT ELL');
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,2),imagesc(CP_ECC.ECC(:,:,s));
    title('GT ECC');
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,3),imagesc(CP_ERR.ERR(:,:,s));
    title('GT ERR');
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    %%%%%%%%%%%%%%%%%%%% Participant's results %%%%%%%%%%%%%%%%%%%%
    subplot(3,3,4),imagesc(ELL_SNRinf(:,:,s));
    title([ParticipantName,' ELL']);
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,5),imagesc(ECC_SNRinf(:,:,s));
    title([ParticipantName,' ECC']);
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,6),imagesc(ERR_SNRinf(:,:,s));
    title([ParticipantName,' ERR']);
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    %%%%%%%%%%%%%%%%%%%% Differences %%%%%%%%%%%%%%%%%%%%
    subplot(3,3,7),imagesc(ELL_diff(:,:,s));
    title(['ELL difference']);
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,8),imagesc(ECC_diff(:,:,s));
    title(['ECC difference']);
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    subplot(3,3,9),imagesc(ERR_diff(:,:,s));
    title(['ERR difference']);
    axis equal;
    caxis([-0.3 0.3]);
    axis([0 160 0 160]);
    colorbar;
    % Save the figures
    saveas(gcf,[Output_dir,'/StrainComp_slice',num2str(s)],'fig');
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 3 (Check #3): Displacement differences boxplot
h10 = figure(10);
set(h10,'Position',[200 200 800 800])

sgtitle('Strain Differences') 
subplot(1,3,1);
ELL_diff_tmp_1 = ELL_diff(:,:,1); ELL_diff_tmp_1 = ELL_diff_tmp_1(~isnan(ELL_diff_tmp_1));
ELL_diff_tmp_2 = ELL_diff(:,:,2); ELL_diff_tmp_2 = ELL_diff_tmp_2(~isnan(ELL_diff_tmp_2));
ELL_diff_tmp_3 = ELL_diff(:,:,3); ELL_diff_tmp_3 = ELL_diff_tmp_3(~isnan(ELL_diff_tmp_3));
boxplot([ELL_diff_tmp_1(:), ELL_diff_tmp_2(:), ELL_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
ylabel('ELL difference');

subplot(1,3,2);
ECC_diff_tmp_1 = ECC_diff(:,:,1); ECC_diff_tmp_1 = ECC_diff_tmp_1(~isnan(ECC_diff_tmp_1));
ECC_diff_tmp_2 = ECC_diff(:,:,2); ECC_diff_tmp_2 = ECC_diff_tmp_2(~isnan(ECC_diff_tmp_2));
ECC_diff_tmp_3 = ECC_diff(:,:,3); ECC_diff_tmp_3 = ECC_diff_tmp_3(~isnan(ECC_diff_tmp_3));
boxplot([ECC_diff_tmp_1(:), ECC_diff_tmp_2(:), ECC_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
ylabel('ECC difference');

subplot(1,3,3);
title('ERR difference');
ERR_diff_tmp_1 = ERR_diff(:,:,1); ERR_diff_tmp_1 = ERR_diff_tmp_1(~isnan(ERR_diff_tmp_1));
ERR_diff_tmp_2 = ERR_diff(:,:,2); ERR_diff_tmp_2 = ERR_diff_tmp_2(~isnan(ERR_diff_tmp_2));
ERR_diff_tmp_3 = ERR_diff(:,:,3); ERR_diff_tmp_3 = ERR_diff_tmp_3(~isnan(ERR_diff_tmp_3));
boxplot([ERR_diff_tmp_1(:), ERR_diff_tmp_2(:), ERR_diff_tmp_3(:)], ....
        'Notch','on','Labels',{'z = 4','z = 12','z = 20'},'Whisker',1);
ylabel('ERR diference');

saveas(gcf,[Output_dir,'/StrainComp_Boxplot'],'fig');











