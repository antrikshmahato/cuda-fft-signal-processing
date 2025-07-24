#include "utils.h"
#include <fstream>
#include <sstream>
#include <iostream>

std::vector<float> readCSV(const std::string &filename) {
    std::vector<float> data;
    std::ifstream file(filename);
    std::string line;
    while (getline(file, line)) {
        data.push_back(std::stof(line));
    }
    return data;
}

void saveFFTOutput(const std::string &filename, const std::vector<cufftComplex> &data) {
    std::ofstream file(filename);
    for (const auto &val : data) {
        file << sqrt(val.x * val.x + val.y * val.y) << "\n";
    }
}

std::string getBaseName(const std::string &path) {
    return path.substr(path.find_last_of("/\\") + 1, path.find_last_of(".") - path.find_last_of("/\\") - 1);
}
