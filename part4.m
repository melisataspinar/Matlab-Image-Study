function part4()
     I = imread('image0part4.jpg');
     G = sobel(I);
     figure('Name','I'); imshow(I);
     figure('Name','G'); imshow(G);
end

function [G] = sobel(I)
     Gx(:,:,1) = conv2( [1 0 -1; 2 0 -2; 1 0 -1], I(:,:,1)); 
     Gx(:,:,2) = conv2( [1 0 -1; 2 0 -2; 1 0 -1], I(:,:,2));
     Gx(:,:,3) = conv2( [1 0 -1; 2 0 -2; 1 0 -1], I(:,:,3));
     
     Gy(:,:,1) = conv2( [1 2 1; 0 0 0; -1 -2 -1], I(:,:,1));
     Gy(:,:,2) = conv2( [1 2 1; 0 0 0; -1 -2 -1], I(:,:,2));
     Gy(:,:,3) = conv2( [1 2 1; 0 0 0; -1 -2 -1], I(:,:,3));
     
     G = sqrt( Gx.*Gx + Gy.*Gy );
     G = uint8(G);
end
