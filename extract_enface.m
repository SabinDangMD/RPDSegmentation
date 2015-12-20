% Extract out an enface summed voxel image from a 3D OCT datastructure
%   usage: extract_enface(image_array) where image_array is an array of
%   (x,y,n) OCT b-scans (unflattened), usually created by using
%   mutli_tif_to_arr

function im = extract_enface(cube,slab_size)
    % get the center of the RPE image
    I = cube(:,:,1);
    [size_y, size_x] = size(I);
    
    im_new = zeros(size_y*1.2,size_x);
    center_image_at = round(size(im_new,2)/2)-200
    
    flattened_cube = flatten_cube(cube);
    c = permute(flattened_cube,[3 2 1]);
    imshow(sum(c(:,:,center_image_at-slab_size:center_image_at),3),[]);
end
