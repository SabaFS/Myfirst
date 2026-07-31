% Read the input image
I = rgb2gray(imread("saba.jpeg"));

% Create subplots for original image and different edge detection methods
subplot(2, 4, 1), imshow(I), title("Gray Scale Image");

% Sobel Edge Detection 
J = edge(I, 'Sobel'); 
subplot(2, 4, 2), imshow(J), title("Sobel"); 

% Prewitt Edge detection 
K = edge(I, 'Prewitt'); 
subplot(2, 4, 3), imshow(K), title("Prewitt"); 

% Robert Edge Detection 
L = edge(I, 'Roberts'); 
subplot(2, 4, 4), imshow(L), title("Robert"); 

% Log Edge Detection 
M = edge(I, 'log'); 
subplot(2, 4, 5), imshow(M), title("Log"); 

% Zerocross Edge Detection 
N = edge(I, 'zerocross'); 
subplot(2, 4, 6), imshow(N), title("Zerocross"); 

% Canny Edge Detection 
O = edge(I, 'Canny'); 
subplot(2, 4, 7), imshow(O), title("Canny"); 

% Canny Edge Detection with specific parameters
P = edge(I, 'Canny', [], 10);
subplot(2, 4, 8), imshow(P), title("Canny (Custom Parameters)");

% Face detection and segmentation
inputImage = imread("saba.jpeg");
faceDetector = vision.CascadeObjectDetector();
bbox = step(faceDetector, inputImage);

figure;
imshow(inputImage);
hold on;
if ~isempty(bbox)
    rectangle('Position', bbox, 'EdgeColor', 'r', 'LineWidth', 2);
    title('Detected Faces');
    
    % Crop the detected face region
    faceRegion = imcrop(inputImage, bbox(1, :));
    
    % Convert the face region to grayscale
    grayFace = rgb2gray(faceRegion);
    
    % Perform image segmentation (example: simple thresholding)
    threshold = graythresh(grayFace);
    segmentedFace = imbinarize(grayFace, threshold);
    
    % Display the segmented face
    figure;
    subplot(1, 2, 1), imshow(faceRegion), title('Original Face');
    subplot(1, 2, 2), imshow(segmentedFace), title('Segmented Face');
else
    disp('No faces detected.');
end

% K-means clustering
[L, Centers] = imsegkmeans(I, 2);
B = labeloverlay(I, L);
figure;
imshow(B);
title("Labeled Image");

% Grayscale image with a user-drawn face mask
grayImage = imread('saba.jpeg');
subplot(1, 2, 1);
imshow(grayImage, []);
title('Original Grayscale Image');
message = sprintf('Left click and hold to draw a face mask.\nLift the mouse button to finish.');
uiwait(msgbox(message));
hFH = imfreehand();
binaryMask = hFH.createMask();
subplot(1, 2, 2);
imshow(binaryMask);
title('Face Mask');
meanIntensity = mean(grayImage(binaryMask));
fprintf('Mean intensity within the face mask: %.3f\n', meanIntensity);
