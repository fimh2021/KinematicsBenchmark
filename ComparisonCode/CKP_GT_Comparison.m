% This code is designed to allow participants of the FIMH 2021 Cardiac
% Kinematics Benchmark to compare their computational phantom solution with
% the ground-truth solution calculated based on the equations reported in
% the Benchmark Instructions

% Authors: Vicky Wang and Luigi Perotti

% Note: before running this script, please follow the instructions listed 
% below:
% 1) Generate a subfolder under the "ParticipantResults" folder using your 
% participant ID. 
% 2) Load the participant's results in the "ParticipantResults/participantID" 
% folder and ensure the data is stored according to the format specified in 
% the Benchmark Instructions.
% 3) Enter your participant ID at line 26, for example, UCF_CBL or SFVA. 
% Please make sure that the names of the variables in your .mat files still 
% agree with the names used during the Benchmark. Otherwise, please update 
% them in the LoadDispData.m and LoadStrainData.m functions.

clear all;
close all;
clc;

% Assign the ParticipantName variable according to the name you have
% chosen to report the Kinematics Benchmark results, e.g., UCF_CBL or SFVA
ParticipantName = 'UCF_CBL';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Ground-truth displacements %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 1(a): Load ground-truth displacements and sampling locations in the
% reference configuration
GT_dir = 'GT/';
% Ground-truth displacements
CP_dX = load([GT_dir,'/CP_dispX.mat']);
CP_dY = load([GT_dir,'/CP_dispY.mat']);
CP_dZ = load([GT_dir,'/CP_dispZ.mat']);
% Sampling locations
CP_Xref = load([GT_dir,'/CP_Xref.mat']);
CP_Yref = load([GT_dir,'/CP_Yref.mat']);
CP_Zref = load([GT_dir,'/CP_Zref.mat']);
fprintf('-----> Step 1(a): Load ground-truth displacements completed ......\n');
f = waitbar(0.1,'Step 1(a): Load ground-truth displacements completed','WindowStyle','normal');
pause(.5);

% Step 1(b): Load ground-truth strains
CP_ECC = load([GT_dir,'/CP_ECC.mat']);
CP_ELL = load([GT_dir,'/CP_ELL.mat']);
CP_ERR = load([GT_dir,'/CP_ERR.mat']);
fprintf('-----> Step 1(b): Load ground-truth strains completed ......\n');
waitbar(0.2,f,'Step 1(b): Load ground-truth strains completed','WindowStyle','normal');
pause(.5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Participant's results %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 1(c): Import participant's name from the results folder
% Load displacement data
[dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf] = LoadDispData(ParticipantName);
fprintf('-----> Step 1(c): Load participant displacement results completed ......\n');
waitbar(0.3,f,'Step 1(c): Load participant displacement results completed','WindowStyle','normal');
pause(.5);
% Load strain data
[ELL_SNRinf, ECC_SNRinf, ERR_SNRinf] = LoadStrainData(ParticipantName);
fprintf('-----> Step 1(d): Load participant strain results completed ......\n');
waitbar(0.4,f,'Step 1(d): Load participant strain results completed','WindowStyle','normal');
pause(.5);

% Create an output directory to store figures
Output_dir = [ParticipantName,'_ComparisonFigures'];
if ~exist(Output_dir)
    mkdir(Output_dir);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Check participant's results: displacement %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('-----> Step 2: Plot differences in displacements ......\n');
f=CompareDisp(ParticipantName, Output_dir, CP_dX, CP_dY, CP_dZ, dispX_SNRinf, dispY_SNRinf, dispZ_SNRinf, CP_Xref, CP_Yref, CP_Zref,f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Check participant's results: strain %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('-----> Step 3: Plot strain differences ......\n');
f=CompareStrain(ParticipantName, Output_dir, CP_ELL, CP_ECC, CP_ERR, ELL_SNRinf, ECC_SNRinf, ERR_SNRinf,f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Generate html report %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('-----> Step 4: Generating html report ......\n');
GenerateComparisonReport(size(dispX_SNRinf,3), ParticipantName);
waitbar(1.0,f,'Step 4: Generating html report completed','WindowStyle','normal');

fprintf('-----> Steps completed: please check your comparison html report ......\n');
f = msgbox('Steps completed: please check your comparison html report');
close all;














