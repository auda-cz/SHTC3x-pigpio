#include "../lib/SHTC3.h"
#include <iostream>

int main() {
    SHTC3 sensor(1); // Assuming I2C bus 1
    auto [temperature, humidity] = sensor.getMeasurements();
    std::cout << "Temperature: " << temperature << " C\n";
    std::cout << "Humidity: " << humidity << "%\n";
    return 0;
}