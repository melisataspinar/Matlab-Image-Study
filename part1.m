function part1()

     % read the image file & convert it to 3D matrix A
     A = imread('image0.jpg');
 
     % create the matrices
     R = A(:,:,1) > 140;
     G = A(:,:,2) > 140;
     B = A(:,:,3) > 140;
     part1d = (A(:,:,3)<30).*R.*G;
     gray = uint8( floor( (uint16(A(:,:,1)) + uint16(A(:,:,2)) + uint16(A(:,:,3)) ) / 3) );
 
     % display the matrices
     figure('Name','R > 140'); imshow(R);
     figure('Name','G > 140'); imshow(G);
     figure('Name','B > 140'); imshow(B);
     figure('Name','R > 140, G > 140, B < 30');imshow(part1d);
     figure('Name','Gray'); imshow(gray);
 
     % create gray.jpg
     imwrite( gray,'gray.jpg', 'jpg' );
end
