/**
 * @file main.cpp
 * @author Lorenzo Busellato
 * @brief Implementation of Homework 1. A potentiometer connected to A0 changes 
 * the blinking frequency of a led connected to D13 in a modifiable range of 
 * frequencies.
 * @date 2022-04-15
 * 
 */
#include <mbed.h>

AnalogIn pot(A0);     // Potentiometer analog input
DigitalOut led(D13);  // Led digital output

int main() {
  int minFreq = 1; // 1 Hz
  int maxFreq = 9; // 10 Hz
  float freq = 1.0f;
  led = 0;
  while(1) {
    led = !led;
    freq = (maxFreq * pot.read()) + minFreq; // Led blinking frequency
    wait(1 / freq); // time = 1 / frequency
  }
}