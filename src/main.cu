#include <iostream>
#include <fstream>
#include <vector>
#include <cuda_runtime.h>
#include <cufft.h>
#include "utils.h"

int main(int argc, char *argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: ./fft_analyzer <input_csv>\n";
        return 1;
    }

    std::string input_file = argv[1];
    std::vector<float> signal = readCSV(input_file);
    int N = signal.size();

    cufftComplex *d_data;
    cudaMalloc((void **)&d_data, sizeof(cufftComplex) * N);

    std::vector<cufftComplex> complex_input(N);
    for (int i = 0; i < N; ++i) {
        complex_input[i].x = signal[i];
        complex_input[i].y = 0;
    }

    cudaMemcpy(d_data, complex_input.data(), sizeof(cufftComplex) * N, cudaMemcpyHostToDevice);

    cufftHandle plan;
    cufftPlan1d(&plan, N, CUFFT_C2C, 1);
    cufftExecC2C(plan, d_data, d_data, CUFFT_FORWARD);

    cudaMemcpy(complex_input.data(), d_data, sizeof(cufftComplex) * N, cudaMemcpyDeviceToHost);
    saveFFTOutput("results/" + getBaseName(input_file) + "_fft_output.csv", complex_input);

    cufftDestroy(plan);
    cudaFree(d_data);

    std::cout << "FFT complete for " << input_file << "\n";
    return 0;
}
