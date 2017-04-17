%GETSAMPLESTATISTICS   Compute the first four central moments of the image's sample values
%
% SYNOPSIS:
%  out = getsamplestatistics(image_in,mask)
%
%  OUT will be a double array with four values: [mean, variance, skewness, excess_kurtosis].
%
% DEFAULTS:
%  mask = [] (all pixels are examined)
%
% DIPlib:
%  This function calls the DIPlib function dip::GetSampleStatistics.

% (c)2017, Cris Luengo.
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