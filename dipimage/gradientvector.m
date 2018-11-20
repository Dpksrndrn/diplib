%GRADIENTVECTOR   Gradient vector
%
% SYNOPSIS:
%  image_out = gradientvector(image_in,sigma,method,boundary_condition,process,truncation)
%
%  IMAGE_IN is a scalar image with N dimensions.
%  IMAGE_OUT is a N-by-1 tensor image, where each image component
%  is the Gaussian derivative along one dimensions. That is, each
%  pixel contains the gradient vector of the image at that point.
%
%  PROCESS determines along which dimensions to take the derivative.
%  For the N-dimensional image above, if PROCESS==1, then the output
%  is a scalar image with only the derivative along the first
%  dimension.
%
%  See DERIVATIVE for a description of the parameters and the defaults.
%
%  This function is identical to DIP_IMAGE/GRADIENT if IMAGE_IN is
%  a DIP_IMAGE object.
%
% DIPlib:
%  This function calls the DIPlib function dip::Gradient.

% (c)2017-2018, Cris Luengo.
% Based on original DIPlib code: (c)1995-2014, Delft University of Technology.
% Based on original DIPimage code: (c)1999-2014, Delft University of Technology.
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%    http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

function out = gradientvector(varargin)
out = filtering('gradientvector',varargin{:});
