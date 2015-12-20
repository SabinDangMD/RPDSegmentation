% take a b-scan image and flatten it based upon the RPE contour
%   usage: flatten_bscan(im) where im = (x,y) image array of a OCT bscan

function im_new = flatten_bscan(I)
    DISPLAY = 0;
    
    % constants / parameters / initializiation
    blurWindowSize = [20 20];
    [size_y, size_x] = size(I);


    Lmed = imgaussfilt(I, 3);

    % segment RPE
    [dx yrpe] = rpe_contour(Lmed);


    % TODO: Eliminate high deviations in RPE as noise and interpolate a fit
    
    % generate flattened image
    im_new = zeros(size_y*1.2,size_x);
    
    % center the image around the mean rpe area
    zero_line = round(mean(yrpe));
    center_image_at = round(size(im_new,2)/2)-200;
    
    for x = 1:numel(yrpe)
       
       y_offset = round(yrpe(x)-zero_line);
       s = center_image_at-y_offset;
       e = (center_image_at-y_offset)+size_y-1;

       im_new(s:e,x) = I(:,x);
    end
    
    % crop final image to be same size as original
    % im_new = im_new(start-size_y:end,:);
    

    if DISPLAY
        figure;

        subplot(1,2,1);
        imshow(I,[]);
        hold;
        plot(yrpe);
        
        subplot(1,2,2);
        imshow(im_new,[]);
    
    end

end