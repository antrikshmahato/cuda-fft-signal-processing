all:
	nvcc -std=c++14 src/main.cu src/utils.cpp -lcufft -o fft_analyzer
