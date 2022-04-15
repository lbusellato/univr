/**
 * @file main.cpp
 * @author Lorenzo Busellato
 * @brief Implementation of Homework 3. A led is blinked continuously at a given
 * frequency, while the readings from a potentiometer are printed to the serial 
 * at the maximum possible frequency.
 * @date 2022-04-13
 * 
 */
#include <mbed.h>

#define TIM_LED TIM3
#define TIM_POT TIM4
#define TIM_LED_IRQ TIM3_IRQn
#define TIM_POT_IRQ TIM4_IRQn

Serial pc(USBTX,USBRX);
AnalogIn pot(A0);
DigitalOut led(D13);
Timer t; // To test serial printf timing

// Timer flags
volatile char led_timer_flag = 0;
volatile char pot_timer_flag = 0;
// Timer handles
TIM_HandleTypeDef ledTimerHandle;
TIM_HandleTypeDef potTimerHandle;

// Timer interrupt handlers
extern "C" void LED_TIM_HANDLER(void) {
  if(__HAL_TIM_GET_FLAG(&ledTimerHandle, TIM_FLAG_UPDATE) == SET) {
    __HAL_TIM_CLEAR_FLAG(&ledTimerHandle, TIM_FLAG_UPDATE);
    led_timer_flag = 1;
  }
}
extern "C" void POT_TIM_HANDLER(void) {
  if(__HAL_TIM_GET_FLAG(&potTimerHandle, TIM_FLAG_UPDATE) == SET) {
    __HAL_TIM_CLEAR_FLAG(&potTimerHandle, TIM_FLAG_UPDATE);
    pot_timer_flag = 1;
  }
}

void computePrescalerPeriod(int* settings, float freq) {
  // Just iterate the computation of the period decreasing each time the 
  // prescaler until period < 65535
  int prescaler = 65535;
  int period = (90e6 / (freq * (prescaler + 1))) - 1;
  while (period > 65535) {
    prescaler--;
    period = (90e6 / freq * (prescaler + 1)) - 1;
  }
  settings[0] = prescaler; settings[1] = period;
}

void initTimers(float freq1, float freq2) {
  // Enable the timer clocks
  __HAL_RCC_TIM3_CLK_ENABLE();
  __HAL_RCC_TIM4_CLK_ENABLE();
  // Setup the handles
  ledTimerHandle.Instance = TIM_LED;
  ledTimerHandle.Init.CounterMode = TIM_COUNTERMODE_UP;
  ledTimerHandle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  int* settings = new int[2];
  computePrescalerPeriod(settings, freq1);
  ledTimerHandle.Init.Prescaler = settings[0];
  ledTimerHandle.Init.Period = settings[1];
  potTimerHandle.Instance = TIM_POT;
  potTimerHandle.Init.CounterMode = TIM_COUNTERMODE_UP;
  potTimerHandle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  computePrescalerPeriod(settings, freq2);
  potTimerHandle.Init.Prescaler = *(settings);
  potTimerHandle.Init.Period = *(settings + 1);
  // Init and enable the handles
  HAL_TIM_Base_Init(&ledTimerHandle);
  HAL_TIM_Base_Init(&potTimerHandle);
  HAL_TIM_Base_Start_IT(&ledTimerHandle);
  HAL_TIM_Base_Start_IT(&potTimerHandle);
  // Set the IRQ handlers and enable the IRQs
  NVIC_SetVector(TIM_LED_IRQ, (uint32_t)LED_TIM_HANDLER);
  NVIC_SetVector(TIM_POT_IRQ, (uint32_t)POT_TIM_HANDLER);
  NVIC_EnableIRQ(TIM_LED_IRQ);
  NVIC_EnableIRQ(TIM_POT_IRQ);
}

int main() {

  // Test the maximum frequency for writing on the serial with a given message
  t.start();
  pc.printf("Pot reading:%f\n", pot.read());
  t.stop();
  // Round up to 2 decimals to have some play with the frequency, since the time
  // computed this way doesn't account for everything that happens during printf
  float elapsedTime = ceil(t.read() * 100) / 100;
  float maxFreq = (1 / elapsedTime);
  pc.printf("Maximum frequency:%f Hz\n", maxFreq);
  // Init the timers
  initTimers(1, maxFreq);
  
  while(1) {
    if(led_timer_flag) {
      led_timer_flag = 0;
      led = !led;
    }
    if(pot_timer_flag) {
      pot_timer_flag = 0;
      pc.printf("Pot reading:%f\n", pot.read());
      if(pot_timer_flag) {
        pc.printf("Something went wrong with the timer frequency.");
        break;
      }
    }
  }
}
  
