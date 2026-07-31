% Importing the image
inputImage = imread("saba.jpeg");
I = rgb2gray(inputImage);

% Display the original grayscale image
subplot(2, 4, 1);
imshow(I);
title("Gray Scale Image");

% Sobel Edge Detection
J = edge(I, 'Sobel');
subplot(2, 4, 2);
imshow(J);
title("Sobel");

% Prewitt Edge detection
K = edge(I, 'Prewitt');
subplot(2, 4, 3);
imshow(K);
title("Prewitt");

% Robert Edge Detection
L = edge(I, 'Roberts');
subplot(2, 4, 4);
imshow(L);
title("Robert");

% Log Edge Detection
M = edge(I, 'log');
subplot(2, 4, 5);
imshow(M);
title("Log");

% Zerocross Edge Detection
Z = edge(I, 'zerocross');
subplot(2, 4, 6);
imshow(Z);
title("Zerocross");

% Canny Edge Detection
N = edge(I, 'Canny');
subplot(2, 4, 7);
imshow(N);
title("Canny");

% Read the input image
inputImage = imread("saba.jpeg");

% Create a face detector object
faceDetector = vision.CascadeObjectDetector();

% Detect faces in the image
bbox = step(faceDetector, inputImage);

% Display the original image with detected faces
subplot(2, 4, 8);
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
