;
;  Program: Semaforo_Sencillo_Peatonal_y_Vehiculos.S
;  Description: Semáforo Sencillo Peatonal y Vehículos conexión LED al puerto B del ATmega328P
;  Author: Rubén Gámez Torrijos
;  Created: 04/06/2024
;

#define __SFR_OFFSET 0
#include <avr/io.h>

.org 0
rjmp setup

setup:
.global main

main:
  ; Configura los bits 0, 1 y 2 del puerto B como salidas (LEDs Coches)
  ; Configura los bits 2 y 3 del puerto D como salidas (LEDs Peatones)
  ldi r16, 0b00000111
  out _SFR_IO_ADDR(DDRB), r16
  ldi r16, 0b00001100
  out _SFR_IO_ADDR(DDRD), r16

  ; Inicializa los puertos B y D a 0
  ldi r17, 0x00
  out _SFR_IO_ADDR(PORTB), r17
  out _SFR_IO_ADDR(PORTD), r17

loop:
  ; Fase 1: Rojo Coches y Verde Peatones
  ldi r17, 0b00000100
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s

  ; Fase 2: Rojo Coches y Verde Peatones parpadeando a 1 segundo durante 5 segundos
  ldi r17, 0b00000100
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_1s
  

  ; Fase 3: Amarillo Coches y Verde Peatones parpadeando a 0.5 segundos durante 5 segundos
  ldi r17, 0b00000010
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0x00
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  ldi r18, 0b00000100
  out _SFR_IO_ADDR(PORTD), r18
  call delay_05s
  

  ; Fase 4: Verde Coches y Rojo Peatones
  ldi r17, 0b00000001
  out _SFR_IO_ADDR(PORTB), r17
  ldi r18, 0b00001000
  out _SFR_IO_ADDR(PORTD), r18
  call delay_5s
  

  rjmp loop

delay_5s:
  ; Retardo de 5 segundos
  ldi  r20, 205
  ldi  r21, 51
  ldi  r22, 0
L2: dec  r22
    brne L2
    dec  r21
    brne L2
    dec  r20
    brne L2
    lpm
    nop
    ret

delay_1s:
  ; Retardo de 1 segundo
  ldi  r20, 41
  ldi  r21, 8
  ldi  r22, 0
L3: dec  r22
    brne L3
    dec  r21
    brne L3
    dec  r20
    brne L3
    lpm
    nop
    ret

delay_05s:
  ; Retardo de 0.5 segundos
  ldi  r20, 20
  ldi  r21, 4
  ldi  r22, 0
L4: dec  r22
    brne L4
    dec  r21
    brne L4
    dec  r20
    brne L4
    lpm
    nop
    ret
