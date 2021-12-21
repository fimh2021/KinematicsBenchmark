function [ELL_SNRinf, ECC_SNRinf, ERR_SNRinf] = LoadData(Participant)

switch Participant
    case{'ABI'}
        
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S04_Ell.mat'); ELL_SNRinf(:,:,1) = temp.ELL_grid_apex;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S12_Ell.mat'); ELL_SNRinf(:,:,2) = temp.ELL_grid_mid;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S20_Ell.mat'); ELL_SNRinf(:,:,3) = temp.ELL_grid_base;
        
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.ECC_grid_apex;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.ECC_grid_mid;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.ECC_grid_base;
        
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.ERR_grid_apex;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.ERR_grid_mid;
        temp = load('./ParticipantResults/ABI/ComputationalPhantom/ABI_CompPhan_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.ERR_grid_base;
        
    case{'Delbeat'}
       
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S04_Ezz.mat'); ELL_SNRinf(:,:,1) = temp.Ezz;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S12_Ezz.mat'); ELL_SNRinf(:,:,2) = temp.Ezz;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S20_Ezz.mat'); ELL_SNRinf(:,:,3) = temp.Ezz;
        
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.Ecc;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.Ecc;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.Ecc;
        
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.Err;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.Err;
        temp = load('./ParticipantResults/Delbeat/Computational_Phantom/Mehrzad_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.Err;
        
    case{'UCF_CBL'}
        
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S04_Ell.mat'); ELL_SNRinf(:,:,1) = temp.EllGrid;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S12_Ell.mat'); ELL_SNRinf(:,:,2) = temp.EllGrid;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S20_Ell.mat'); ELL_SNRinf(:,:,3) = temp.EllGrid;
        
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.EccGrid;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.EccGrid;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.EccGrid;
        
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.ErrGrid;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.ErrGrid;
        temp = load('./ParticipantResults/UCF_CBL/Computational_Phantom/UCF_CompPhan_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.ErrGrid;
       
    case{'Epstein_UVA'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S04_Ecc.mat');  ECC_SNRinf(:,:,1) = temp.Ecc;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S12_Ecc.mat');  ECC_SNRinf(:,:,2) = temp.Ecc;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_CompPhan_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.Ecc;
        
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S04_Err.mat');  ERR_SNRinf(:,:,1) = temp.Err;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_ComPhan_SNRinf_S12_Err.mat');  ERR_SNRinf(:,:,2) = temp.Err;
        temp = load('./ParticipantResults/Epstein_UVA/Computational_Phantom/UVA_CompPhan_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.Err;
        
    case{'IEC'}

        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S04_Ell.mat'); ELL_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S12_Ell.mat'); ELL_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S20_Ell.mat'); ELL_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/IEC/Computational_Phantom/IEC_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.data;
        
    case{'Osmium_CIM_AY'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_AY/Computational_Phantom_CIM_AY/OsmiumCIMAY_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.data;
        
    case{'Osmium_CIM_HB'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_CIM_HB/Computational_Phantom_CIM_HB/OsmiumCIMHB_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.data;
        
    case{'Osmium_DA_SA'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_SA/Computational_Phantom_DA_AS/OsmiumDAAS_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.data;
        
    case{'Osmium_DA_HB'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.data;
        
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.data;
        temp = load('./ParticipantResults/Osmium_DA_HB/Computational_Phantom_DA_HB/OsmiumDAHB_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.data;
        
    case{'SFVA'}
        
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S04_Ell.mat'); ELL_SNRinf(:,:,1) = temp.CompPham_SNRInf_S04_Ell;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S12_Ell.mat'); ELL_SNRinf(:,:,2) = temp.CompPham_SNRInf_S12_Ell;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S20_Ell.mat'); ELL_SNRinf(:,:,3) = temp.CompPham_SNRInf_S20_Ell;
      
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.CompPham_SNRInf_S04_Ecc;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.CompPham_SNRInf_S12_Ecc;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.CompPham_SNRInf_S20_Ecc;
        
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.CompPham_SNRInf_S04_Err;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.CompPham_SNRInf_S12_Err;
        temp = load('./ParticipantResults/SFVA/Computational_Phantom/SFVA_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.CompPham_SNRInf_S20_Err;
        
    case{'Stanford_RSL_Mike_re1'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.Ecc;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.Ecc;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.Ecc;
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.Err;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.Err;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re1/Computational_Phantom/StanfordRSL_Mike_re1_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.Err;
        
    case{'Stanford_RSL_Mike_re2'}
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S04_Ell.mat'); ELL_SNRinf(:,:,1) = temp.Ell;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S12_Ell.mat'); ELL_SNRinf(:,:,2) = temp.Ell;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S20_Ell.mat'); ELL_SNRinf(:,:,3) = temp.Ell;
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.Ecc;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.Ecc;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.Ecc;
        
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.Err;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.Err;
        temp = load('./ParticipantResults/Stanford_RSL_Mike_re2/Computational_Phantom/StanfordRSL_Mike_re2_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.Err;

    case{'Stanford_RSL_Qiu'}
        
        % 2D analysis only -> set ELL to 0
        ELL_SNRinf(:,:,1) = zeros(160,160);
        ELL_SNRinf(:,:,2) = zeros(160,160);
        ELL_SNRinf(:,:,3) = zeros(160,160);
        
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S04_Ecc.mat'); ECC_SNRinf(:,:,1) = temp.CC;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S12_Ecc.mat'); ECC_SNRinf(:,:,2) = temp.CC;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S20_Ecc.mat'); ECC_SNRinf(:,:,3) = temp.CC;
        
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S04_Err.mat'); ERR_SNRinf(:,:,1) = temp.RR;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S12_Err.mat'); ERR_SNRinf(:,:,2) = temp.RR;
        temp = load('./ParticipantResults/Stanford_RSL_Qiu/Computational_Phantom/StanfordRSL_Qiu_CompPham_SNRinf_S20_Err.mat'); ERR_SNRinf(:,:,3) = temp.RR;
        
end
    



end

