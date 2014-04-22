#include "mex.h"

/* Code modified from http://www.maths.tcd.ie/~nryan/mandelbrot/mand.c */

const int width = 640;
const int height = 480;

matlab
(unsigned char pic[height][width][3]) = mandelbrot(double xstart, double xend, double ystart, double yend, double iter_d)
{
  const int iter = (int) iter_d;
  
  double x, y;
  double xstep = (xend - xstart) / width;
  double ystep = (yend - ystart) / height;

  y = ystart;
  for(int i = 0; i < height; i++) {
    x = xstart;
    for (int j = 0; j < width; j++) {
      double z = 0, zi = 0;
      int inset = 1;
      double colour;
      
      for (int k = 0; k < iter; k++) {
        /* z^2 = (a+bi)(a+bi) = a^2 + 2abi - b^2 */
	double newz = (z*z)-(zi*zi) + x;
	double newzi = 2*z*zi + y;
        z = newz;
        zi = newzi;
	if(((z*z)+(zi*zi)) > 4) {
	  inset = 0;
	  colour = k;
	  break;
	}
      }
      if (inset) {
	matrix pic(i,j,0) = 0;
	matrix pic(i,j,1) = 0;
	matrix pic(i,j,2) = 0;
      } else { 
	matrix pic(i,j,0) = colour / iter * 255;
	matrix pic(i,j,1) = colour / iter * 255 / 2;
	matrix pic(i,j,2) = colour / iter * 255 / 2;
      }
      x += xstep;
    }
    y += ystep;
  }
}

