/**
 * This is a simple example of how to use the Keystone library.
 *
 * To use this example in the real world, you need a projector
 * and a surface you want to project your Processing sketch onto.
 *
 * Simply drag the corners of the CornerPinSurface so that they
 * match the physical surface's corners. The result will be an
 * undistorted projection, regardless of projector position or 
 * orientation.
 *
 * You can also create more than one Surface object, and project
 * onto multiple flat surfaces using a single projector.
 *
 * This extra flexbility can comes at the sacrifice of more or 
 * less pixel resolution, depending on your projector and how
 * many surfaces you want to map. 
 */

import deadpixel.keystone.*;
import processing.video.*;

Keystone ks;
CornerPinSurface surface;
CornerPinSurface surface2;

PGraphics offscreen;
PGraphics offscreen2;

int bg_color = 255;
int updown = 0;

void setup() {
  // Keystone will only work with P3D or OPENGL renderers, 
  // since it relies on texture mapping to deform
  size(800, 600, P3D);

  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(width, height, 20);
  surface2 = ks.createCornerPinSurface(width, height, 20);
  
  // We need an offscreen buffer to draw the surface we
  // want projected
  // note that we're matching the resolution of the
  // CornerPinSurface.
  // (The offscreen buffer can be P2D or P3D)
  offscreen = createGraphics(width, height, P3D);
  offscreen2 = createGraphics(width, height, P3D);

  ks.load();
}

void draw() {

  // Convert the mouse coordinate into surface coordinates
  // this will allow you to use mouse events inside the 
  // surface from your screen. 
  PVector surfaceMouse = surface.getTransformedMouse();
  PVector surfaceMouse2 = surface2.getTransformedMouse();

  // Draw the scene, offscreen
  offscreen.beginDraw();
  offscreen.background(bg_color);
  offscreen.fill(0, 255, 0);
  offscreen.ellipse(surfaceMouse.x, surfaceMouse.y, 75, 75);
  offscreen.endDraw();

  // Draw the scene, offscreen
  offscreen2.beginDraw();
  offscreen2.background(bg_color);
  offscreen2.fill(0, 255, 0);
  offscreen2.ellipse(surfaceMouse2.x, surfaceMouse2.y, 75, 75);
  offscreen2.endDraw();

  // most likely, you'll want a black background to minimize
  // bleeding around your projection area
  background(0);
 
  // render the scene, transformed using the corner pin surface
  surface.render(offscreen);
  surface2.render(offscreen2);

  if (bg_color < 255 && updown == 0) {
    bg_color++;
  } else if (bg_color == 255 && updown == 0) {
    updown = 1;
  } else if (bg_color > 0 && updown == 1) {
    bg_color--;
  } else if (bg_color == 0 && updown == 1) {
    updown = 0;
  }

  println(bg_color);
  println(updown);

}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}