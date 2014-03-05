Hardware of SSTV-RX
=======

The hardware of the SSTV reciever consists of several modules. The combination of these modules gives a software defined radio.
TODO: block diagramm

Low Noise Amplifier(LNA)
======
MAX2634:
 - supply voltage(V): 2.2 .. 5.5
 - supply current(mA): 2.5(typ) .. 4
 - frequency range(MHz):  100 .. 600
 - noise figure(dB): 1.25(typ, 315MHz)
 - gain: 15.5dB(typ, 315MHz)

Preamplifier
======
MAX2614:
 - supply voltage(V): 3.0 .. 5.0(typ) .. 5.25
 - supply current(mA): 2.5(typ) .. 40.6
 - frequency range(MHz):  40 .. 4000
 - noise figure(dB): 2(typ) .. 2.95(2GHz)
 - gain: 18.6dB(typ, 1GHz)

I/Q demodulator
======
AD8348:
 - supply voltage(V): 2.7 .. 5.5
 - supply current(mA): 38 .. 48(typ) .. 58
 - LO frequency range(MHz): 100 .. 2000
 - RF frequency range(MHz): 50 .. 1000
 - LO input level(dBm): -12 .. -10(typ) .. 0
 - noise figure(dB): 9.4(150MHz)

PLL+VCO
======
ADF4360-9:
 - supply voltage(V): 3.0 .. 3.6
 - supply current(mA): 23 .. 30
 - frequency range(MHz): 65 .. 400
 - output power(dBm): -9 .. 0

SPI ADC
======
AD7352:
 - supply voltage(V): 2.25 .. 2.75(VDD)/3.6(VDRIVE)
 - supply current(mA): 10 .. 15
 - resolution: 12 bit
 - Signal to Noise Ratio(dB): 70(min) .. 71.5(typ) 
 - Spurious Free Dynamic Range (dB): -85(min) .. -78.5(typ)

Filter and Pads
======
