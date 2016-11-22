% making colormap

red = gray;
red(:,1) =1;
colormap(red);
colorbar

blue = gray;
blue(:,3) =1;
colormap(blue);
colorbar

green1 =gray;
green1(:,2) =1;
colormap(green1);
colorbar

purple =(red + blue)/2;
colormap(purple);
colorbar

green4 =  [linspace(1, 0.1, 64)' linspace(1, 0.5, 64)' linspace(1, 0.1, 64)'];
colormap(green4);
colorbar

blue3 =  [linspace(1, 0, 64)' linspace(1, 0.2, 64)' linspace(1, 0.6, 64)'];
colormap(blue3);
colorbar

red2 =  [linspace(1, 0.8, 64)' linspace(1, 0.2, 64)' linspace(1, 0.2, 64)'];
colormap(red2);
colorbar


yellow =(red + green1)/2;
colormap(yellow);
colorbar

teal =(blue + green1)/2;
colormap(teal);
colorbar
