function [dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf] = LoadData(Participant)

switch Participant
    case{'ABI'}
      
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.dx_grid_apex;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.dx_grid_mid;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.dx_grid_base;
        
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.dy_grid_apex;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.dy_grid_mid;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.dy_grid_base;
        
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S04_dz.mat'); dispZ_SNRinf(:,:,1) = temp.dz_grid_apex;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S12_dz.mat'); dispZ_SNRinf(:,:,2) = temp.dz_grid_mid;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.dz_grid_base;
        
    case{'Delbeat'}
        
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.dx;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.dx;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.dx;
        
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.dy;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.dy;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.dy;
        
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S04_dz.mat'); dispZ_SNRinf(:,:,1) = temp.dz;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S12_dz.mat'); dispZ_SNRinf(:,:,2) = temp.dz;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.dz;
        
    case{'UCF_CBL'}
       
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.dispX;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.dispX;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.dispX;
        
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.dispY;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.dispY;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.dispY;
        
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S04_dz.mat'); dispZ_SNRinf(:,:,1) = temp.dispZ;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S12_dz.mat'); dispZ_SNRinf(:,:,2) = temp.dispZ;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.dispZ;
       
    case{'Epstein_UVA'}
       
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S04_dx.mat');  dispX_SNRinf(:,:,1) = temp.dXt_ps_nan1;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S12_dx.mat');  dispX_SNRinf(:,:,2) = temp.dXt_ps_nan1;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_CompPhan_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.dXt_ps_nan1;
        
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S04_dy.mat');  dispY_SNRinf(:,:,1) = temp.dYt_ps_nan1;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S12_dy.mat');  dispY_SNRinf(:,:,2) = temp.dYt_ps_nan1;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_CompPhan_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.dYt_ps_nan1;
        
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S04_dz.mat');  dispZ_SNRinf(:,:,1) = temp.dZt_ps_nan1;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S12_dz.mat');  dispZ_SNRinf(:,:,2) = temp.dZt_ps_nan1;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_CompPhan_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.dZt_ps_nan1;
        
    case{'IEC'}
        
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S04_dz.mat'); dispZ_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S12_dz.mat'); dispZ_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.data;
        
    case{'Osmium_CIM_AY'}
        
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.data;
        
        % 2D analysis only -> set dispZ to 0
        dispZ_SNRinf(:,:,1) = zeros(160,160);
        dispZ_SNRinf(:,:,2) = zeros(160,160);
        dispZ_SNRinf(:,:,3) = zeros(160,160);
        
    case{'Osmium_CIM_HB'}
        
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.data;
        
        % 2D analysis only -> set dispZ to 0
        dispZ_SNRinf(:,:,1) = zeros(160,160);
        dispZ_SNRinf(:,:,2) = zeros(160,160);
        dispZ_SNRinf(:,:,3) = zeros(160,160);
        
    case{'Osmium_DA_SA'}
       
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.data;
        
        % 2D analysis only -> set dispZ to 0
        dispZ_SNRinf(:,:,1) = zeros(160,160);
        dispZ_SNRinf(:,:,2) = zeros(160,160);
        dispZ_SNRinf(:,:,3) = zeros(160,160);
        
    case{'Osmium_DA_HB'}
        
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.data;
        
        % 2D analysis only -> set dispZ to 0
        dispZ_SNRinf(:,:,1) = zeros(160,160);
        dispZ_SNRinf(:,:,2) = zeros(160,160);
        dispZ_SNRinf(:,:,3) = zeros(160,160);
        
    case{'SFVA'}
        
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.CompPham_SNRInf_S04_dx;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.CompPham_SNRInf_S12_dx;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.CompPham_SNRInf_S20_dx;
        
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.CompPham_SNRInf_S04_dy;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.CompPham_SNRInf_S12_dy;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.CompPham_SNRInf_S20_dy;
        
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S04_dz.mat'); dispZ_SNRinf(:,:,1) = temp.CompPham_SNRInf_S04_dz;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S12_dz.mat'); dispZ_SNRinf(:,:,2) = temp.CompPham_SNRInf_S12_dz;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.CompPham_SNRInf_S20_dz;
        
    case{'Stanford_RSL_Mike_re1'}
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S04_dx.mat'); dispY_SNRinf(:,:,1) = temp.dx;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S12_dx.mat'); dispY_SNRinf(:,:,2) = temp.dx;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S20_dx.mat'); dispY_SNRinf(:,:,3) = temp.dx;
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S04_dy.mat'); dispX_SNRinf(:,:,1) = temp.dy;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S12_dy.mat'); dispX_SNRinf(:,:,2) = temp.dy;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S20_dy.mat'); dispX_SNRinf(:,:,3) = temp.dy;
        
        % 2D analysis only -> set dispZ to 0
        dispZ_SNRinf(:,:,1) = zeros(160,160);
        dispZ_SNRinf(:,:,2) = zeros(160,160);
        dispZ_SNRinf(:,:,3) = zeros(160,160);
        
    case{'Stanford_RSL_Mike_re2'}

        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S04_dx.mat'); dispX_SNRinf(:,:,1) = temp.dx;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S12_dx.mat'); dispX_SNRinf(:,:,2) = temp.dx;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S20_dx.mat'); dispX_SNRinf(:,:,3) = temp.dx;
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S04_dy.mat'); dispY_SNRinf(:,:,1) = temp.dy;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S12_dy.mat'); dispY_SNRinf(:,:,2) = temp.dy;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S20_dy.mat'); dispY_SNRinf(:,:,3) = temp.dy;
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S04_dz.mat'); dispZ_SNRinf(:,:,1) = temp.dz;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S12_dz.mat'); dispZ_SNRinf(:,:,2) = temp.dz;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S20_dz.mat'); dispZ_SNRinf(:,:,3) = temp.dz;

    case{'Stanford_RSL_Qiu'}
        
        %%% Notice rescaling %%%
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S04_dX.mat'); dispX_SNRinf(:,:,1) = temp.dX*2.5;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S12_dX.mat'); dispX_SNRinf(:,:,2) = temp.dX*2.5;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S20_dX.mat'); dispX_SNRinf(:,:,3) = temp.dX*2.5;
        
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S04_dY.mat'); dispY_SNRinf(:,:,1) = temp.dY*2.5;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S12_dY.mat'); dispY_SNRinf(:,:,2) = temp.dY*2.5;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S20_dY.mat'); dispY_SNRinf(:,:,3) = temp.dY*2.5;
        
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S04_dZ.mat'); dispZ_SNRinf(:,:,1) = temp.dZ*2.5;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S12_dZ.mat'); dispZ_SNRinf(:,:,2) = temp.dZ*2.5;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S20_dZ.mat'); dispZ_SNRinf(:,:,3) = temp.dZ*2.5;
        
end
    



end

