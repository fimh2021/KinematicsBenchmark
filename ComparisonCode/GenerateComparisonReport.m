function GenerateComparisonReport(sizeZ, ParticipantName)

% This function is designed to collect all the comparison figures and 
% generate a summary html report

% Create a report object
import mlreportgen.dom.*

% Define the name of the html file (htmx)
htmlDoc = Document(['GT_',ParticipantName,'_ResultsComparison'],'html-file');
open(htmlDoc);

% Define the results path
ResultsDirectory = [ParticipantName,'_ComparisonFigures/'];

% Write a brief introduction
Par = Paragraph(['This report summarizes the comparison between the computational phantom ground truth and the participant''s results']);
Par.FontSize = ['20'];
Par.Color = ['blue'];
Par.BackgroundColor = ['yellow'];
Par.Bold = true;
append(htmlDoc, Par);
    


%% Displacement comparison
% Displacment maps %
SlicePos = ['z = 4 '; 'z = 12'; 'z = 20'];
for s = 1:sizeZ
    
    % Define a plot
    Par = Paragraph(['Displacement comparison (spatial maps) ',SlicePos(s)]);
    Par.Bold = true;
    Par.FontSize = ['18'];
    append(htmlDoc, Par);
    
    % Load image to be appended to the report
    input_fig = openfig([ResultsDirectory,'DispComp_slice',num2str(s),'.fig']);
    set(gcf,'units','normalized','position',[0 0 0.8 0.8]);
    input_fig = get(groot,'CurrentFigure');
    
    % Save the figure as an image
    output_image = [ResultsDirectory,'DispComp_slice',num2str(s),'.png'];
    saveas(gcf, output_image, 'png');
   
    % Add image to report
    mlreportgen.dom.Height.Value = '0.5in';
    append(htmlDoc, Image(output_image));
    
    close all;
end

% Displacment box plots %

% Load image to be appended to the report
input_fig = openfig([ResultsDirectory,'DispComp_Boxplot.fig']);
set(gcf,'units','normalized','position',[0 0 0.8 0.8]);
input_fig = get(groot,'CurrentFigure');

% Save the figure as an image
output_image=[ResultsDirectory,'DispComp_Boxplot.png'];
saveas(gcf,output_image,'png');
   
% Add image to report
mlreportgen.dom.Height.Value = '0.5in';
append(htmlDoc, Image(output_image));

close all;



%% Strain comparison
% Strain maps %
for s = 1:sizeZ
    
    % Define a plot
    Par = Paragraph(['Strain comparison (spatial maps) ',SlicePos(s)]);
    Par.Bold = true;
    Par.FontSize = ['18'];
    append(htmlDoc, Par);
    
    % Load image to be appended to the report
    input_fig = openfig([ResultsDirectory,'StrainComp_slice',num2str(s),'.fig']);
    set(gcf,'units','normalized','position',[0 0 0.8 0.8]);
    input_fig = get(groot,'CurrentFigure');
    
    % Save the figure as an image
    output_image = [ResultsDirectory,'StrainComp_slice',num2str(s),'.png'];
    saveas(gcf, output_image, 'png');
   
    % Add image to report
    mlreportgen.dom.Height.Value = '0.5in';
    append(htmlDoc, Image(output_image));
    
    close all;
end
    
% Strain box plots %

% Load image to be appended to the report
input_fig = openfig([ResultsDirectory,'StrainComp_Boxplot.fig']);
set(gcf,'units','normalized','position',[0 0 0.8 0.8]);
input_fig = get(groot,'CurrentFigure');

% Save the figure as an image
output_image=[ResultsDirectory,'StrainComp_Boxplot.png'];
saveas(gcf,output_image,'png');
   
% Add image to report
mlreportgen.dom.Height.Value = '0.5in';
append(htmlDoc, Image(output_image));

close all;



%% Close the report
close(htmlDoc);










