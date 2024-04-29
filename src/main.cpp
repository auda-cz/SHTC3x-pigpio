#include "../lib/SHTC3.h"
#include <iostream>
#include <cstdlib>
#include <unistd.h>

int main(int argc, char** argv) {
    int avgCount = 6;  // Default average count
    float totalTemperature = 0.0, totalHumidity = 0.0;
    if (argc > 1) {
        avgCount = std::atoi(argv[1]);
    }


    SHTC3 sensor(1); // Assuming I2C bus 1
    for(int i=0;i < avgCount; i++ )
    {
        auto [temperature, humidity] = sensor.getMeasurements();
        totalTemperature += temperature;
        totalHumidity += humidity;
        usleep(1000);
    }
    
    std::cout << "Temperature: " << totalTemperature / avgCount << " C\n";
    std::cout << "Humidity: " << totalHumidity / avgCount << "%\n";
    return 0;
}