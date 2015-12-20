# Reticular Pseudodrusen Segmentation

This set of MATLAB scripts creates an en face image map of reticular pseudodrusen from a macular cube scan. 

## Instructions

- use multi_tif_to_arr('tifname.tif') to load a multipage tiff into MATLAB array structure
- use extract_enface(mac_cube_arr,slab_size) to generate an RPD en face image

## Componenets

- multi_tif_to_arr.m : Convert multi page tiff to matlab array structure
- flatten_bscan.m : Flatten an OCT B-scan image at the level of the RPE
- flatten_cube.m : Flatten a mac cube by iterratively calling flatten_bscan
- rpe_contour.m : script to identify RPE contour on an OCT b-scan
- extract_enface.m : wrapper script which simplifies generation of flattened en face images from structural OCT data
