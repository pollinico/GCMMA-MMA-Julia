########################################################################################################
### GCMMA-MMA-Julia                                                                                  ### 
###                                                                                                  ###
### This file is part of GCMMA-MMA-Julia. GCMMA-MMA-Julia is licensed under the terms of GNU         ###
### General Public License as published by the Free Software Foundation. For more information and    ###
### the LICENSE file, see <https://github.com/pollinico/GCMMA-MMA-Julia/blob/main/LICENSE>.          ###
###                                                                                                  ###
### The orginal work is written by Krister Svanberg in MATLAB.                                       ###
### This is the Julia version of the code written by Nicolò Pollini.                                 ###
### version 18-05-2023                                                                               ###
########################################################################################################

#-------------------------------------------------------------
#
#    Copyright (C) 2009 Krister Svanberg
#
#    This file, toy2.m, is part of GCMMA-MMA-code.
#    
#    GCMMA-MMA-code is free software; you can redistribute it and/or
#    modify it under the terms of the GNU General Public License as 
#    published by the Free Software Foundation; either version 3 of 
#    the License, or (at your option) any later version.
#    
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#    
#    You should have received a copy of the GNU General Public License
#    (file COPYING) along with this file.  If not, see 
#    <http://www.gnu.org/licenses/>.
#    
#    You should have received a file README along with this file,
#    containing contact information.  If not, see
#    <http://www.smoptit.se/> or e-mail mmainfo@smoptit.se or krille@math.kth.se.
#
#------
#
#  Version September 2009.
#  This file calculates function values and gradients
#  for the following "toy problem":
#
#    minimize x(1)^2 + x(2)^2 + x(3)^2
#  subject to (x(1)-5)^2 + (x(2)-2)^2 + (x(3)-1)^2 =< 9
#             (x(1)-3)^2 + (x(2)-4)^2 + (x(3)-3)^2 =< 9
#              0 =< x(j) =< 5, for j=1,2,3.
#
function  toy2(x)
    #
    f0val = x[1]^2 + x[2]^2 + x[3]^2
    #
    df0dx = [2*x[1] ,
        2*x[2] ,
        2*x[3]]
    #
    fval  = [(x[1]-5)^2+(x[2]-2)^2+(x[3]-1)^2-9 ,
        (x[1]-3)^2+(x[2]-4)^2+(x[3]-3)^2-9]
    #
    dfdx  = 2*[x[1]-5  x[2]-2  x[3]-1;
        x[1]-3  x[2]-4  x[3]-3]
    return f0val, df0dx, fval, dfdx
end
#---------------------------------------------------------------------
