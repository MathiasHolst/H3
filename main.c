#include <msp430.h>

int main(void)
{
  WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT
  ADC12CTL0 = ADC12SHT02 + ADC12ON;    // Sampling time, ADC12 on
  ADC12CTL1 = ADC12SHP;           // Use sampling timer
  //ADC12IE = 0x01;                          // Enable interrupt
  ADC12CTL0 |= ADC12ENC;
  P6SEL |= 0x01;                               // P6.0 ADC option select
  P1DIR |= 0x01;                               // P1.0 output
  P6DIR |= BIT5;
  P6DIR |= BIT1;
  
  while (1)
  {
    ADC12CTL0 |= ADC12SC;            // Start sampling/conversion
    while ( ADC12CTL1 & ADC12BUSY );  
    if (ADC12MEM0 > 0x0009)              // ADC12MEM = A0 > 0.5AVcc?
      P6OUT |= BIT5;            // P1.0 = 1
    else
      P6OUT &= ~BIT5;        // P1.0 = 0
    if (ADC12MEM0 == 0x0fff)
      P6OUT |= BIT1;
    else
      P6OUT &= ~BIT1;
  }
}
