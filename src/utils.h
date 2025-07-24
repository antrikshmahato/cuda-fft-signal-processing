#pragma once
#include <vector>
#include <string>
#include <cufft.h>

std::vector<float> readCSV(const std::string &filename);
void saveFFTOutput(const std::string &filename, const std::vector<cufftComplex> &data);
std::string getBaseName(const std::string &path);
