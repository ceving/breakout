#version 3.7;
#include "colors.inc"        
#include "shapes.inc"
global_settings {
 assumed_gamma 0.4 
}
background { colour srgbt <0.0, 0.0, 0.0, 1.0> }
camera {
  location <0, 5, 0>
  look_at  <0, -1, 0>
}

#declare pA = <-1,  0, -0.5>;  // A corner
#declare pB = <+1, -1, +0.5>;  // The opposite corner
#declare EdgeAndcornerRadius = 0.25;
#declare UseMerge = false;

object {
  Round_Box(pA, pB, EdgeAndcornerRadius, UseMerge)
  texture {
    pigment { color Silver }
  }
  finish {
    ambient .1
    diffuse .3
    specular 1
    roughness .01
    metallic
    reflection {
      .75
      metallic
    }
  }
}

light_source { <-2, 4, 4> color White}
