# MTI & Pulse-Doppler Radar Simulation (Simulink & MATLAB)

## 📌 Project Overview
This project presents the design and simulation of a Moving Target Indicator (MTI) radar system using MATLAB Simulink, combined with Pulse-Doppler FFT processing to estimate target radial velocity.

The system suppresses stationary clutter using MTI filtering and extracts Doppler frequency shifts caused by moving targets. MATLAB is then used to convert FFT bin indices into Doppler frequencies and compute the corresponding target speed.

---

## 🎯 Objectives
- Design an MTI radar model for clutter rejection
- Implement pulse-Doppler processing
- Analyze Doppler spectrum using FFT
- Estimate target radial velocity from Doppler frequency shifts
- Validate theoretical radar equations through simulation

---

## 🧠 System Description

### 1️⃣ MTI Radar (Simulink)
The Simulink model includes
- Signal generation
- Delay-line canceller ( ( z^{-1} ) ) for MTI filtering
- Subtraction to suppress stationary clutter
- FFT-based Doppler processing
- Magnitude spectrum visualization

The MTI filter removes echoes from stationary targets while preserving signals from moving targets.

---

### 2️⃣ Pulse-Doppler Processing (MATLAB)
After observing Doppler peaks in the FFT output, MATLAB is used to
- Convert FFT bin indices into Doppler frequencies
- Compute target radial velocity using the Doppler radar equation

Key equations used

[
Delta f = frac{text{PRF}}{N}
]

[
v = frac{lambda f_d}{2}
]

Where
- PRF = Pulse Repetition Frequency
- N = FFT size
- ( lambda ) = radar wavelength
- ( f_d ) = Doppler frequency

---

## ⚙️ Parameters Used
- FFT length 128
- PRF 50 kHz
- Radar wavelength 0.03 m (10 GHz carrier)
- Detected Doppler bins k = 43 and k = 91

---

## 📊 Results
- Clear Doppler peaks observed in the frequency domain
- Positive and negative Doppler shifts corresponding to approaching and receding targets
- Accurate radial velocity estimation based on FFT peak locations

---

## 📁 Project Structure
