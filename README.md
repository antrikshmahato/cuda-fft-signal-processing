# CUDA Signal Analyzer

CUDA Signal Analyzer is a high-performance GPU-accelerated tool that performs Fast Fourier Transform (FFT) on large-scale CSV-based signal data using NVIDIA's cuFFT library. It processes signal data in the time domain and transforms it into the frequency domain efficiently using CUDA.

---

## 🚀 Features

- ⚡ GPU-accelerated FFT using `cuFFT`
- 📂 Processes large CSV signal files or batches of files
- 📉 Outputs FFT magnitude spectrum for visualization
- 🛠️ CLI-based usage for flexibility
- 📁 Clean structure with Makefile and run script

---

## 📁 Project Structure
cuda-signal-analyzer/
├── src/
│ ├── main.cu # Main CUDA logic
│ ├── utils.cpp # Utility functions
│ ├── utils.h
├── data/
│ ├── signal1.csv # Input signal
├── results/
│ ├── signal1_fft_output.csv # FFT output
├── images/
│ ├── signal1_plot.png # Optional visualization
├── Makefile
├── run.sh
├── README.md


---

## 📦 Requirements

- NVIDIA GPU with CUDA support
- CUDA Toolkit (>=10.x)
- `cuFFT` library
- GNU Make

---

## 🛠️ Build Instructions

```bash
make

./fft_analyzer data/signal1.csv
./run.sh

