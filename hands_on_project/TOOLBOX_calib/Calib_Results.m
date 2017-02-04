% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2670.773081262386800 ; 2662.954509530894500 ];

%-- Principal point:
cc = [ 1640.882380023739000 ; 1154.503639262783300 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.135823014108107 ; -0.250743800415338 ; -0.001993957895450 ; 0.001553419373229 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 8.941158708305697 ; 8.696254627295529 ];

%-- Principal point uncertainty:
cc_error = [ 11.213905150821624 ; 8.239316575227356 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.013920863582395 ; 0.052573975049742 ; 0.001212125158388 ; 0.001751917232862 ; 0.000000000000000 ];

%-- Image size:
nx = 3264;
ny = 2448;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 16;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.988814e+00 ; 6.128836e-03 ; 5.743845e-01 ];
Tc_1  = [ -1.306424e+02 ; 6.919020e+01 ; 3.159600e+02 ];
omc_error_1 = [ 4.044160e-03 ; 1.643751e-03 ; 6.984447e-03 ];
Tc_error_1  = [ 1.331487e+00 ; 9.955360e-01 ; 1.015151e+00 ];

%-- Image #2:
omc_2 = [ 2.680477e+00 ; -1.434867e-03 ; -4.963787e-02 ];
Tc_2  = [ -1.142004e+02 ; 4.862340e+01 ; 2.725492e+02 ];
omc_error_2 = [ 4.116405e-03 ; 1.697620e-03 ; 6.353367e-03 ];
Tc_error_2  = [ 1.158860e+00 ; 8.829710e-01 ; 1.068809e+00 ];

%-- Image #3:
omc_3 = [ 2.633963e+00 ; 3.773818e-01 ; -1.782185e-01 ];
Tc_3  = [ -1.294896e+02 ; 2.310155e+01 ; 3.121291e+02 ];
omc_error_3 = [ 4.301028e-03 ; 1.867804e-03 ; 6.436589e-03 ];
Tc_error_3  = [ 1.316770e+00 ; 9.984380e-01 ; 1.166857e+00 ];

%-- Image #4:
omc_4 = [ 2.354563e+00 ; -1.237595e+00 ; 2.701066e-01 ];
Tc_4  = [ 3.350378e+01 ; 7.912027e+01 ; 2.948917e+02 ];
omc_error_4 = [ 3.753589e-03 ; 3.176233e-03 ; 6.645779e-03 ];
Tc_error_4  = [ 1.258275e+00 ; 9.511316e-01 ; 1.232470e+00 ];

%-- Image #5:
omc_5 = [ 2.598052e+00 ; -8.207953e-01 ; 1.165381e-01 ];
Tc_5  = [ -1.533468e+01 ; 1.033702e+02 ; 2.883493e+02 ];
omc_error_5 = [ 4.171143e-03 ; 2.316929e-03 ; 7.450916e-03 ];
Tc_error_5  = [ 1.236907e+00 ; 9.458255e-01 ; 1.195308e+00 ];

%-- Image #6:
omc_6 = [ 2.046686e+00 ; -2.013444e+00 ; -5.051287e-01 ];
Tc_6  = [ 8.898410e+01 ; 7.164204e+01 ; 2.347090e+02 ];
omc_error_6 = [ 3.726711e-03 ; 3.004386e-03 ; 6.136574e-03 ];
Tc_error_6  = [ 1.024306e+00 ; 7.435416e-01 ; 8.935616e-01 ];

%-- Image #7:
omc_7 = [ -2.123630e+00 ; 2.101988e+00 ; 4.002641e-01 ];
Tc_7  = [ 9.405803e+01 ; 5.954402e+01 ; 2.754854e+02 ];
omc_error_7 = [ 2.996388e-03 ; 3.708771e-03 ; 6.768976e-03 ];
Tc_error_7  = [ 1.164860e+00 ; 8.534512e-01 ; 9.614785e-01 ];

%-- Image #8:
omc_8 = [ NaN ; NaN ; NaN ];
Tc_8  = [ NaN ; NaN ; NaN ];
omc_error_8 = [ NaN ; NaN ; NaN ];
Tc_error_8  = [ NaN ; NaN ; NaN ];

%-- Image #9:
omc_9 = [ -2.005507e+00 ; 2.013204e+00 ; -2.304927e-01 ];
Tc_9  = [ 9.183706e+01 ; 6.595671e+01 ; 3.212158e+02 ];
omc_error_9 = [ 3.265973e-03 ; 3.813113e-03 ; 6.649705e-03 ];
Tc_error_9  = [ 1.354654e+00 ; 9.858298e-01 ; 1.050486e+00 ];

%-- Image #10:
omc_10 = [ -3.023880e+00 ; 4.231016e-02 ; -7.377908e-01 ];
Tc_10  = [ -8.852736e+01 ; 6.388882e+01 ; 2.359306e+02 ];
omc_error_10 = [ 4.305052e-03 ; 1.695853e-03 ; 7.052251e-03 ];
Tc_error_10  = [ 1.028968e+00 ; 7.516594e-01 ; 9.101040e-01 ];

%-- Image #11:
omc_11 = [ 1.788471e+00 ; 1.823954e+00 ; 2.077300e-01 ];
Tc_11  = [ -9.253636e+01 ; -5.249362e+01 ; 2.500736e+02 ];
omc_error_11 = [ 3.097419e-03 ; 3.456080e-03 ; 5.414747e-03 ];
Tc_error_11  = [ 1.073029e+00 ; 7.883532e-01 ; 9.990175e-01 ];

%-- Image #12:
omc_12 = [ 1.757269e+00 ; 1.590490e+00 ; -1.639766e-01 ];
Tc_12  = [ -9.575695e+01 ; -5.072973e+01 ; 2.517908e+02 ];
omc_error_12 = [ 2.697284e-03 ; 3.403571e-03 ; 4.894479e-03 ];
Tc_error_12  = [ 1.064907e+00 ; 7.873833e-01 ; 9.437885e-01 ];

%-- Image #13:
omc_13 = [ 2.341601e+00 ; -2.242474e-01 ; 4.240843e-01 ];
Tc_13  = [ -7.282880e+01 ; 4.412528e+01 ; 1.880833e+02 ];
omc_error_13 = [ 3.463092e-03 ; 2.316374e-03 ; 5.219690e-03 ];
Tc_error_13  = [ 8.146493e-01 ; 6.168898e-01 ; 8.391657e-01 ];

%-- Image #14:
omc_14 = [ 2.571643e+00 ; -1.928768e-01 ; 1.510019e-01 ];
Tc_14  = [ -9.367088e+01 ; 6.354274e+01 ; 2.178150e+02 ];
omc_error_14 = [ 3.700908e-03 ; 1.777345e-03 ; 5.817464e-03 ];
Tc_error_14  = [ 9.436295e-01 ; 7.207901e-01 ; 9.068752e-01 ];

%-- Image #15:
omc_15 = [ 2.905537e+00 ; -1.639488e-01 ; 2.066144e-01 ];
Tc_15  = [ -9.280885e+01 ; 5.912625e+01 ; 2.232020e+02 ];
omc_error_15 = [ 4.074026e-03 ; 1.294353e-03 ; 6.785407e-03 ];
Tc_error_15  = [ 9.601125e-01 ; 7.295859e-01 ; 9.103641e-01 ];

%-- Image #16:
omc_16 = [ 2.571416e+00 ; -3.476116e-01 ; 4.646670e-01 ];
Tc_16  = [ -6.393823e+01 ; 4.436222e+01 ; 2.050008e+02 ];
omc_error_16 = [ 3.642544e-03 ; 2.145981e-03 ; 5.850766e-03 ];
Tc_error_16  = [ 8.770442e-01 ; 6.623971e-01 ; 8.574027e-01 ];

