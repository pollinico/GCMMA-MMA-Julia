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
#    Copyright (C) 2007 Krister Svanberg
#
#    This file, concheck.m, is part of GCMMA-MMA-code.
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
#  If the current approximations are conservative,
#  the parameter conserv is set to 1.
#
function concheck(m,epsimin,f0app,f0valnew,fapp,fvalnew)
    #
    conserv = 0
    eeem   = ones(m)
    f0appe = f0app+epsimin
    fappe = fapp+epsimin*eeem
    if [f0appe;fappe] >= [f0valnew;fvalnew]
        conserv = 1
    end
    #---------------------------------------------------------------------
    return conserv
end
