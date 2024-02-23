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

object {
  sphere {
    <0, 0, 0>, 0.75
    texture {
      pigment { color Gray }
    }
    finish {
      ambient .1
      diffuse .6
      specular 1
      roughness .01
      reflection .25
    }
  }
}

light_source { <0, 5, 0> color White}
