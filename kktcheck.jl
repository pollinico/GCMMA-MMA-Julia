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
#    Copyright (C) 2006 Krister Svanberg
#
#    This file, kktcheck.m, is part of GCMMA-MMA-code.
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
#    Version Dec 2006.
#
function kktcheck(m,n,x,y,z,lam,xsi,eta,mu,zet,s,xmin,xmax,df0dx,fval,dfdx,a0,a,c,d)
    #
    #  The left hand sides of the KKT conditions for the following
    #  nonlinear programming problem are calculated.
    #         
    #      Minimize  f_0(x) + a_0*z + sum( c_i*y_i + 0.5*d_i*(y_i)^2 )
    #    subject to  f_i(x) - a_i*z - y_i <= 0,  i = 1,...,m
    #                xmax_j <= x_j <= xmin_j,    j = 1,...,n
    #                z >= 0,   y_i >= 0,         i = 1,...,m
    #*** INPUT:
    #
    #   m    = The number of general constraints.
    #   n    = The number of variables x_j.
    #   x    = Current values of the n variables x_j.
    #   y    = Current values of the m variables y_i.
    #   z    = Current value of the single variable z.
    #  lam   = Lagrange multipliers for the m general constraints.
    #  xsi   = Lagrange multipliers for the n constraints xmin_j - x_j <= 0.
    #  eta   = Lagrange multipliers for the n constraints x_j - xmax_j <= 0.
    #   mu   = Lagrange multipliers for the m constraints -y_i <= 0.
    #  zet   = Lagrange multiplier for the single constraint -z <= 0.
    #   s    = Slack variables for the m general constraints.
    #  xmin  = Lower bounds for the variables x_j.
    #  xmax  = Upper bounds for the variables x_j.
    #  df0dx = Vector with the derivatives of the objective function f_0
    #          with respect to the variables x_j, calculated at x.
    #  fval  = Vector with the values of the constraint functions f_i,
    #          calculated at x.
    #  dfdx  = (m x n)-matrix with the derivatives of the constraint functions
    #          f_i with respect to the variables x_j, calculated at x.
    #          dfdx(i,j) = the derivative of f_i with respect to x_j.
    #   a0   = The constants a_0 in the term a_0*z.
    #   a    = Vector with the constants a_i in the terms a_i*z.
    #   c    = Vector with the constants c_i in the terms c_i*y_i.
    #   d    = Vector with the constants d_i in the terms 0.5*d_i*(y_i)^2.
    #     
    #*** OUTPUT:
    #
    # residu     = the residual vector for the KKT conditions.
    # residunorm = sqrt(residu'*residu).
    # residumax  = max(abs(residu)).
    #
    rex   = df0dx + dfdx'*lam - xsi + eta
    rey   = c + d.*y - mu - lam
    rez   = a0 - zet - a'*lam
    relam = fval - a*z - y + s
    rexsi = xsi.*(x-xmin)
    reeta = eta.*(xmax-x)
    remu  = mu.*y
    rezet = zet*z
    res   = lam.*s
    #
    residu1 = [rex' rey' rez]'
    residu2 = [relam' rexsi' reeta' remu' rezet res']'
    residu = [residu1' residu2']'
    residunorm = sqrt(residu'*residu)
    residumax = maximum(abs.(residu))
    #---------------------------------------------------------------------
    return residu,residunorm,residumax
end
