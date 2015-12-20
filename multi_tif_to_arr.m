function arr = multi_tif_to_arr(filename)
    info = imfinfo(filename);
    num_images = numel(info);
    arr = [];
    for k = 1:num_images
       A = imread(filename, k, 'Info', info); 
       arr(:,:,k) = A;
    end

    
end