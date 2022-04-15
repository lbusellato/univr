/**
 * @file main.cpp
 * @author Lorenzo Busellato
 * @brief Implementation of Homework 2. A potentiometer connected to A0 controls
 * the blinking frequency of a led connected to D13. Meanwhile the frequency 
 * value is printed via serial every 0.2 seconds.
 * @date 2022-04-15
 * 
 */
#include <mbed.h>

Serial pc(USBTX, USBRX);
AnalogIn pot(A0);
DigitalOut led(D13);
Ticker ticker;

int minFreq = 1;
int maxFreq = 9;
float freq = 1;
float sample;

void blink() {
  led = !led;
}

int main() {
  while(1) {
    ticker.detach();
    ticker.attach(&blink, 1/freq);
    sample = ceil(100 * pot.read()) / 100;
    freq = (maxFreq * sample) + minFreq;
    pc.printf("Pot value: %.2f\n", sample);
    wait(1);
  }
}