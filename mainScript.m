% Santosh Aryal
% Final Project Code
% Implementation of the paper:  "A Simple Single Seeded Region Growing Algorithm for Color Image Segmentation using Adaptive Thresholding.”


% Reading the image
image = im2double(imread('Plane.jpg'));

% Creating a REGION matrix with same size of image, all values set to zero
I = mean(image,3);
[R,C] = size(I);
REGION = I;
REGION(:) = 0;

% Declaring the first seed which is the centre pixel of the image
SEEDi = round(R/2);
SEEDj = round(C/2);

% RCOUNT to keep track of the current region being grown
RCOUNT = 1;

% PG is the stack to store the pixels to grow
PG(1) = string(SEEDi) + ',' + string(SEEDj);

%BP is the stack to store boundary pixels of grown region
BP = "";

%Calculating  Otsu's adaptive threshold of original image
THR = multithresh(image);

% The first step to grow the region based on similarirty index between the seed and the 8-neighbourhood pixels.
[BP,REGION] = mainLoop(THR,PG,image,REGION,SEEDi,SEEDj,BP,RCOUNT,R,C);


% After the region growing is completed from the first seed, the value stored in BP is set to new PG and region growing loop is called
while ~isempty(BP)
    if(BP == "")
        break
    end
    SEED = BP(end);
    newSEED = str2double(split(SEED,','));
    SEEDi = newSEED(1);
    SEEDj = newSEED(2);
    % Deleting the last element of the BP after loop
    BP(end) = [];
    % Checking if the RCOUNT is set to REGION or not
    if(ismember(RCOUNT,REGION))
        RCOUNT = RCOUNT + 1;
    end
    % Setting the boundary pixel as seed and call the seed growing loop for further calculation until all the pixel are set to a region
    PG(1) = SEED;
    [BP,REGION] = mainLoop(THR,PG,image,REGION,SEEDi,SEEDj,BP,RCOUNT,R,C);
end

% Converting Labeled REGION into RGB image for better visualization.
RGB2 = label2rgb(REGION,'spring','c','shuffle');  
imshow(RGB2);
title("Segmented Image Using A Simple Single Seeded Region Growing and Adaptive Thresholding");

