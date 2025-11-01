/* -----------------------------------------------------------
   SoundReactive Shapes — v1.0 (Week 12 Final)
   -----------------------------------------------------------
   Keys:
     SPACE = Play / Pause
     + / - = Adjust sensitivity
   ----------------------------------------------------------- */

import processing.sound.*;

SoundFile file;
FFT fft;
Amplitude amp;

int bands = 512;
float[] spectrum = new float[bands];

float bassSmooth = 0, midSmooth = 0, trebleSmooth = 0;
float gain = 2.0;
float ease = 0.12;

void setup() {
  size(900, 600);
  colorMode(HSB, 360, 100, 100, 100);
  textSize(16);
  smooth(8);
  
  try {
    file = new SoundFile(this, "track.mp3");
    file.loop();
    println("✅ track.mp3 is playing!");
  } catch(Exception e) {
    println("⚠️ Error: track.mp3 not found in /data folder.");
  }

  fft = new FFT(this, bands);
  amp = new Amplitude(this);
  fft.input(file);
  amp.input(file);
}

void draw() {
  // Analyze sound
  fft.analyze(spectrum);
  float loud = amp.analyze() * gain;

  float bass   = avg(2, 20) * gain;
  float mid    = avg(21, 120) * gain;
  float treble = avg(121, 300) * gain;

  bassSmooth   += (bass - bassSmooth) * ease;
  midSmooth    += (mid - midSmooth) * ease;
  trebleSmooth += (treble - trebleSmooth) * ease;

  // Background pulse
  float hueShift = (millis() * 0.05) % 360;
  float bgBrightness = map(loud, 0, 0.1, 40, 90);
  background(hueShift, 40, bgBrightness);

  // Bass Circle
  pushMatrix();
  translate(width * 0.5, height * 0.5);
  float circleSize = map(bassSmooth, 0, 0.02, 100, 400);
  fill((hueShift + 30) % 360, 80, 100, 80);
  noStroke();
  ellipse(0, 0, circleSize, circleSize);
  popMatrix();

  // Mid Rectangle
  pushMatrix();
  translate(width * 0.25, height * 0.65);
  rectMode(CENTER);
  float rw = map(midSmooth, 0, 0.02, 100, 250);
  float rh = map(midSmooth, 0, 0.02, 50, 150);
  fill((hueShift + 120) % 360, 70, 95, 90);
  noStroke();
  rect(0, 0, rw, rh, 20);
  popMatrix();

  // Treble Triangles
  pushMatrix();
  translate(width * 0.78, height * 0.5);
  float spinSpeed = map(trebleSmooth, 0, 0.02, 0.01, 0.08);
  rotate(frameCount * spinSpeed);
  int triCount = (int)map(trebleSmooth, 0, 0.02, 4, 14);
  for (int i = 0; i < triCount; i++) {
    pushMatrix();
    rotate(TWO_PI / triCount * i);
    float s = map(trebleSmooth, 0, 0.02, 30, 120);
    fill((hueShift + 180 + i * 5) % 360, 90, 100, 85);
    triangle(-s / 2, s / 2, 0, -s, s / 2, s / 2);
    popMatrix();
  }
  popMatrix();

  // UI Text
  fill(255);
  text("SoundReactive Shapes — v1.0", 20, 30);
  text("Press SPACE to pause | +/- to adjust sensitivity", 20, 55);
}

void keyPressed() {
  if (key == ' ') {
    if (file.isPlaying()) file.pause();
    else file.loop();
  }
  if (key == '+') gain += 0.1;
  if (key == '-') gain = max(0.1, gain - 0.1);
}

// Helper function
float avg(int a, int b) {
  a = constrain(a, 0, bands - 1);
  b = constrain(b, 0, bands - 1);
  float sum = 0;
  for (int i = a; i <= b; i++) sum += spectrum[i];
  return sum / max(1, b - a + 1);
}
