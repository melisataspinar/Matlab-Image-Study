function part3()
     % read the 2D matrix I
     imgray = imread('gray.jpg');
 
     % set noise variance to 64
     gaussnoise = 8*randn(size(imgray,1), size(imgray,2)); 
     imgaussnoise = uint8(double(imgray) + gaussnoise);
     % before mean filtering
     figure('Name','Gaussian Noise Variance = 64');                           
     imshow(imgaussnoise);
     % get filtered matrices, noise variance = 64
     J = medianFiltering( imgaussnoise, 9 );
     figure('Name','Gaussian Noise Variance = 64, M=9'); imshow(J);
     J = medianFiltering( imgaussnoise, 25 );
     figure('Name','Gaussian Noise Variance = 64, M=25'); imshow(J);
     J = medianFiltering( imgaussnoise, 121 );
     figure('Name','Gaussian Noise Variance = 64,M=121'); imshow(J);
 
     % set noise variance to 1024
     gaussnoise = 32*randn(size(imgray,1), size(imgray,2)); 
     imgaussnoise = uint8(double(imgray) + gaussnoise);
     % before mean filtering
     figure('Name','Gaussian Noise Variance = 1024');                           
     imshow(imgaussnoise);
     % get filtered matrices, noise variance = 1024
     J = medianFiltering(imgaussnoise, 9);
     figure('Name','Gaussian Noise Variance=1024, M=9'); imshow(J);
     J = medianFiltering(imgaussnoise, 25);
     figure('Name','Gaussian Noise Variance=1024, M=25'); imshow(J);
     J = medianFiltering(imgaussnoise, 121);
     figure('Name','Gaussian Noise Variance=1024,M=121'); imshow(J);
     
     % Salt & Pepper 
     imsaltnoise = imgray;
     noisypixels = rand( size(imgray,1), size(imgray,2) ); 
     imsaltnoise( find( noisypixels < ( 1 / 16 ) ) ) = 255; 
     imsaltnoise( find( noisypixels > ( 15 / 16 ) ) ) = 0; 
     figure('Name','imsaltnoise, original'); imshow(imsaltnoise);
     J = medianFiltering(imsaltnoise, 9);
     figure('Name','imsaltnoise, M = 9'); imshow(J);
     J = medianFiltering(imsaltnoise, 25);
     figure('Name','imsaltnoise, M = 25'); imshow(J);
     J = medianFiltering(imsaltnoise, 121);
     figure('Name','imsaltnoise, M = 121'); imshow(J);
 
end


function [J] = medianFiltering(I, M) 
  
   N = ( sqrt(M) - 1 ) / 2;
   J = zeros( size(I,1), size(I,2) );  
   n = size(I,1);
   m = size(I,2);
   
   for i = 1:n
       for j = 1:m
           square = zeros(sqrt(M)); % assume outside values are 0
           
           if( i <= N ) 
               i_i = 1;
           else
               i_i = i - N;
           end
           
           if( j <= N ) 
               j_i = 1;
           else
               j_i = j - N;
           end
           
           if( i > n - N ) 
               i_f = n;
           else
               i_f = i + N;
           end
           
           if( j > m - N ) 
               j_f = m;
           else
               j_f = j + N;
           end
           
           % sub matrix: 
           square( 1:i_f-i_i+1, 1:j_f-j_i+1) = I( i_i:i_f, j_i:j_f);
           % median of the sub matrix:
           J(i,j) = median( square, 'all' );
       end
   end
   J = uint8(J);  
end
