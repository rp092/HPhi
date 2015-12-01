/* HPhi  -  Quantum Lattice Model Simulator */
/* Copyright (C) 2015 Takahiro Misawa, Kazuyoshi Yoshimi, Mitsuaki Kawamura, Youhei Yamaji, Synge Todo, Naoki Kawashima */

/* This program is free software: you can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation, either version 3 of the License, or */
/* (at your option) any later version. */

/* This program is distributed in the hope that it will be useful, */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the */
/* GNU General Public License for more details. */

/* You should have received a copy of the GNU General Public License */
/* along with this program.  If not, see <http://www.gnu.org/licenses/>. */

//Define Mode for mltply
// complex version

#pragma once
#include <complex.h>
#include "struct.h"


void GC_child_general_hopp_MPIdouble(unsigned long int itrans, struct BindStruct *X,
  double complex *tmp_v0, double complex *tmp_v1);

void GC_child_general_hopp_MPIsingle(unsigned long int itrans, struct BindStruct *X,
  double complex *tmp_v0, double complex *tmp_v1);

void child_general_hopp_MPIdouble(unsigned long int itrans, struct BindStruct *X,
  double complex *tmp_v0, double complex *tmp_v1);

void child_general_hopp_MPIsingle(unsigned long int itrans, struct BindStruct *X,
  double complex *tmp_v0, double complex *tmp_v1);

void child_general_int_spin_MPIdouble(unsigned long int i_int, struct BindStruct *X,
  double complex *tmp_v0, double complex *tmp_v1);

void child_general_int_spin_MPIsingle(unsigned long int i_int, struct BindStruct *X,
  double complex *tmp_v0, double complex *tmp_v1);
