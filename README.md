# Semaforo_1_Sencillo

## Descripción
Este programa implementa un semáforo sencillo para peatones y vehículos utilizando un microcontrolador ATmega328P. El semáforo consta de tres fases para vehículos y peatones: Rojo para vehículos y Verde para peatones, Amarillo para vehículos y Verde para peatones parpadeando, y Verde para vehículos y Rojo para peatones.

## Detalles del Hardware
- LED para vehículos conectado al puerto B, bit 0.
- LEDs para peatones conectados al puerto D, bits 2 y 3.
- Un botón para reiniciar el semáforo conectado al pin 6 del puerto D.

## Funcionamiento
El semáforo sigue un ciclo continuo a través de las tres fases, con un tiempo específico para cada fase. Además, el botón conectado al pin 6 del puerto D puede ser usado para reiniciar el semáforo, volviendo al inicio del ciclo en la fase 1.

## Uso en Wokwi.com
Para utilizar este código en Wokwi.com, puedes copiar y pegar el código en un nuevo sketch en el editor de código de Wokwi. Asegúrate de seleccionar el microcontrolador ATmega328P y de conectar los LEDs y el botón según las especificaciones del hardware.

## Uso en Arduino Uno con IDE de Arduino
Para usar este código en Arduino Uno con el IDE de Arduino, sigue estos pasos:

1. Abre el IDE de Arduino.
2. Crea un nuevo sketch.
3. Copia y pega el código en el sketch.
4. Guarda el sketch con un nombre descriptivo, por ejemplo, "Semaforo_Sencillo.ino".
5. Conecta tu Arduino Uno a tu computadora.
6. Selecciona el tipo de placa "Arduino Uno" en el menú Herramientas > Placa.
7. Selecciona el puerto adecuado en el menú Herramientas > Puerto.
8. Verifica el código haciendo clic en el botón "Verificar" (✓).
9. Sube el código a tu Arduino haciendo clic en el botón "Subir" (➡).
10. Observa el funcionamiento del semáforo utilizando los LEDs y el botón conectados a tu Arduino Uno.

## Licencia
Este código está protegido por una licencia de uso personal. No se permite su reproducción o distribución sin el permiso del autor. Puedes usarlo para fines personales o educativos, pero debes reconocer al autor original.

