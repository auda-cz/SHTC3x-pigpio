# SHTC3x-pigpio
A bare minimum C++ library for reading temperature and humidity from SHTC3x senser. It is inspired by the Python version of the library from [Adafruit](https://github.com/adafruit/Adafruit_CircuitPython_SHTC3/) but adapted for use on more general platforms

Unlike the original, this version utilizes the low-level C/C++ library `pigpio.h`  for direct I2C communication, making it well-suited for applications requiring direct hardware control without overhead.

It is tested for the Raspberry Pi 4B.

## Usage

A example is provided in [src/main.cpp](src/main.cpp):
```
#include "../lib/SHTC3.h"
#include <iostream>

int main() {
    SHTC3 sensor(1); // Assuming I2C bus 1
    auto [temperature, humidity] = sensor.getMeasurements();
    std::cout << "Temperature: " << temperature << " C\n";
    std::cout << "Humidity: " << humidity << "%\n";
    return 0;
}
```
## License
This project is licensed under the MIT License

