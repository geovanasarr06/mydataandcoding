
Author: Geovana Sarr
Subject: Data and Coding
University: University of Technology Sydney (UTS)
Year: 2025
Project Overview
Sound Reactive Shapes is an interactive audio-visual project made using Processing and the Sound library.
The program visualises sound in real time through geometric shapes (circles, rectangles, and triangles) that react to audio frequency data.
It tests the relationship between sound, motion, and colour — transforming audio signals into a dynamic piece of digital art that answers to rhythm, energy, and mood.
This project shows my growing code literacy, focusing on how data inputs (sound) can be mapped to visual outputs (motion, brightness, and colour).
How It Works
The code imports a music track or microphone input using Processing’s SoundFile.
It performs a FFT to separate the audio into bass, mid, and treble frequency bands.
Each band controls a unique visual shape:
Circle → Bass frequencies (low beats)
 Rectangle → Mid frequencies (vocals and rhythm)
 Triangles → High frequencies (cymbals, treble sounds)
The shapes grow, rotate, and shift colours in real time, creating an expressive reaction to the music.
Smooth transitions and hue shifting add a sense of flow and depth
Core Features
Real-time audio-reactive visuals using FFT analysis.
3 dynamic shape systems responding to frequency bands.
Gradual hue-shifting background synced with rhythm.
Adjustable gain and sensitivity using keyboard controls:
+ → Increase gain
– → Decrease gain
Spacebar → Pause / play the track
Anti-aliasing and brightness balancing for clear, fluid visuals.
Learning Results
Through this project, I learned to:
Integrate audio analysis with generative visuals using Processing.
Understand and implement FFT for frequency-based motion.
Apply smoothing (ease) to improve animation fluidity.
Debug visual balance (brightness, frame rate, gain).
Enhance interactivity with user-controlled parameters.
Setup Instructions
Requirements:
Processing 4.0+
Sound Library 
How to Run:
Download this repository.
Open the .pde file in Processing.
Place your audio file (e.g., track.mp3) inside the data/ folder.
Press ▶️ to run the sketch.
Use + and – to adjust gain, and Spacebar to pause/play audio.
file structure
SoundReactiveShapes/
│
├── SoundReactiveShapes.pde       # Main Processing sketch
├── /data                         # Folder containing the audio file
│   └── track.mp3
├── README.md                     # Project documentation
└── reflection.pdf                # Written reflection (1000 words)
Acknowledgements
The Processing Foundation for maintaining the open-source Processing and Sound libraries.
Daniel Shiffman’s The Nature of Code for creative coding inspiration.
Karen Collins’ Playing with Sound for insights into sound interactivity.
