.equ PIN_VERDE_COCHES, 0   ; PB0
.equ PIN_AMARILLO_COCHES, 1 ; PB1
.equ PIN_ROJO_COCHES, 2    ; PB2
.equ PIN_VERDE_PEATONES, 2 ; PD2
.equ PIN_ROJO_PEATONES, 3  ; PD3

.equ DELAY_5_SECONDS, 50    ; 50 unidades de 100 ms = 5000 ms
.equ DELAY_2_SECONDS, 20    ; 20 unidades de 100 ms = 2000 ms

.equ DDRB_ADDR, 0x04        ; Dirección del registro de datos del puerto B
.equ DDRD_ADDR, 0x0A        ; Dirección del registro de datos del puerto D
.equ PORTB_ADDR, 0x05       ; Dirección del puerto B
.equ PORTD_ADDR, 0x0B       ; Dirección del puerto D

.macro SET_BIT port, bit
    sbi \port, \bit
.endm

.macro CLEAR_BIT port, bit
    cbi \port, \bit
.endm

.section .text
.global main
.type main, @function
main:
    ; Configurar pines como salida
    ldi r16, (1 << PIN_VERDE_COCHES) | (1 << PIN_AMARILLO_COCHES) | (1 << PIN_ROJO_COCHES)
    out DDRB_ADDR, r16
    ldi r16, (1 << PIN_VERDE_PEATONES) | (1 << PIN_ROJO_PEATONES)
    out DDRD_ADDR, r16

loop:
    ; Fase 1: Coches en verde, peatones en rojo
    CLEAR_BIT PORTB_ADDR, PIN_AMARILLO_COCHES
    CLEAR_BIT PORTB_ADDR, PIN_ROJO_COCHES
    SET_BIT PORTB_ADDR, PIN_VERDE_COCHES
    CLEAR_BIT PORTD_ADDR, PIN_VERDE_PEATONES
    SET_BIT PORTD_ADDR, PIN_ROJO_PEATONES
    call delay_5_seconds

    ; Fase 2: Coches en amarillo, peatones en rojo
    CLEAR_BIT PORTB_ADDR, PIN_VERDE_COCHES
    SET_BIT PORTB_ADDR, PIN_AMARILLO_COCHES
    call delay_2_seconds

    ; Fase 3: Coches en rojo, peatones en verde
    CLEAR_BIT PORTB_ADDR, PIN_AMARILLO_COCHES
    SET_BIT PORTB_ADDR, PIN_ROJO_COCHES
    CLEAR_BIT PORTD_ADDR, PIN_ROJO_PEATONES
    SET_BIT PORTD_ADDR, PIN_VERDE_PEATONES
    call delay_5_seconds

    ; Fase 4: Coches en rojo, peatones en rojo
    CLEAR_BIT PORTD_ADDR, PIN_VERDE_PEATONES
    call delay_5_seconds

    rjmp loop

delay_5_seconds:
    ldi r16, DELAY_5_SECONDS
    call delay_loop
    ret

delay_2_seconds:
    ldi r16, DELAY_2_SECONDS
    call delay_loop
    ret

delay_loop:
    ldi r17, 100
inner_loop:
    nop
    dec r17
    brne inner_loop
    dec r16
    brne delay_loop
    ret
