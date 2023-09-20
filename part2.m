function part2()

     % read the 2D matrix I
     imgray = imread('gray.jpg');
 
     % set noise
     gaussnoise = 8*randn(size(imgray,1), size(imgray,2)); 
     imgaussnoise = uint8(double(imgray) + gaussnoise);
     
     % before mean filtering
     figure('Name','Gaussian Noise Variance = 64');                           
     imshow(imgaussnoise);

     % get filtered matrices, noise variance = 64
     J = meanFiltering( imgaussnoise, 9 );
     figure('Name','Gaussian Noise Variance = 64, M=9'); imshow(J);
     J = meanFiltering( imgaussnoise, 25 );
     figure('Name','Gaussian Noise Variance = 64, M=25'); imshow(J);
     J = meanFiltering( imgaussnoise, 121 );
     figure('Name','Gaussian Noise Variance = 64,M=121'); imshow(J);

     % set noise
     gaussnoise = 32*randn(size(imgray,1), size(imgray,2)); 
     imgaussnoise = uint8(double(imgray) + gaussnoise);
 
     % get filtered matrices, noise variance = 1024
     J = meanFiltering(imgaussnoise, 9);
     figure('Name','Gaussian Noise Variance=1024, M=9'); imshow(J);
     J = meanFiltering(imgaussnoise, 25);
     figure('Name','Gaussian Noise Variance=1024, M=25'); imshow(J);
     J = meanFiltering(imgaussnoise, 121);
     figure('Name','Gaussian Noise Variance=1024,M=121'); imshow(J);
     
     % Salt & Pepper 
     imsaltnoise = imgray;
     noisypixels = rand( size(imgray,1), size(imgray,2) ); 
     imsaltnoise( find( noisypixels < ( 1 / 16 ) ) ) = 255; 
     imsaltnoise( find( noisypixels > ( 15 / 16 ) ) ) = 0; 
     
     figure('Name','imsaltnoise, original'); imshow(imsaltnoise);
     J = meanFiltering(imsaltnoise, 9);
     figure('Name','imsaltnoise, M = 9'); imshow(J);
     J = meanFiltering(imsaltnoise, 25);
     figure('Name','imsaltnoise, M = 25'); imshow(J);
     J = meanFiltering(imsaltnoise, 121);
     figure('Name','imsaltnoise, M = 121'); imshow(J);

end

function [J] = meanFiltering(I, M) 
   N = ( sqrt(M) - 1 ) / 2;
   J = zeros( size(I,1), size(I,2) );
   
   n = size(I,1);
   m = size(I,2);
   
   for i = 1:n
       for j = 1:m
           if( i <= N ) 
               i_i = 1;          % i_i: i initial
           else
               i_i = i - N;
           end
           
           if( j <= N ) 
               j_i = 1;
           else
               j_i = j - N;
           end
           
           if( i > n - N ) 
               i_f = n;		% i_f: i final
           else
               i_f = i + N;
           end
           
           if( j > m - N ) 
               j_f = m;
           else
               j_f = j + N;
           end
           
           % sub-matrix:
           Isub = I( i_i:i_f, j_i:j_f);
           % take sum of all elements:
           J(i,j) = sum( sum(Isub) ); 
       end
   end
   J = uint8( J / M );
end
