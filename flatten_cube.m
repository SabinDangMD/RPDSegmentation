% take a macular cube array structure and flatten it using flatten_bscan

function im = flatten_cube(cube)

    z = size(cube,3);
    im = [];
    % for each (x,y) bscan in cube
    
    for idx = 1:z
        im(:,:,idx) = flatten_bscan(cube(:,:,idx));
    end
    
    
end