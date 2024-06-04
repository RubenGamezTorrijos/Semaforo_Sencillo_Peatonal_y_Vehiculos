# Semaforo_1_Sencillo

## Descripción
Este programa implementa un semáforo sencillo para peatones y vehículos utilizando un microcontrolador ATmega328P. El semáforo consta de tres fases para vehículos y peatones: Rojo para vehículos y Verde para peatones, Amarillo para vehículos y Verde para peatones parpadeando, y Verde para vehículos y Rojo para peatones.

## Detalles del Hardware
- LED para vehículos conectado al puerto B, bit 0.
- LEDs para peatones conectados al puerto D, bits 2 y 3.
- Un botón para reiniciar el semáforo conectado al pin 6 del puerto D.

## Funcionamiento
El semáforo sigue un ciclo continuo a través de las tres fases, con un tiempo específico para cada fase. Además, el botón conectado al pin 6 del puerto D puede ser usado para reiniciar el semáforo, volviendo al inicio del ciclo en la fase 1.

## Detalles del Código
El código está escrito en lenguaje ensamblador para el microcontrolador ATmega328P. Se organizan las fases del semáforo en subrutinas y se utiliza un bucle principal para ejecutarlas en secuencia. Se implementan retardos para controlar la duración de cada fase.

### Subrutinas
- `delay_5s`: Retardo de 5 segundos.
- `delay_1s`: Retardo de 1 segundo.
- `delay_05s`: Retardo de 0.5 segundos.

### Fases del Semáforo
1. Fase 1: Rojo para vehículos y Verde para peatones.
2. Fase 2: Rojo para vehículos y Verde para peatones parpadeando.
3. Fase 3: Amarillo para vehículos y Verde para peatones parpadeando.
4. Fase 4: Verde para vehículos y Rojo para peatones.
5. Fase 5: Amarillo para vehículos y Rojo para peatones.

## Uso en Wokwi.com
Para utilizar este código en Wokwi.com, puedes copiar y pegar el código en un nuevo sketch en el editor de código de Wokwi. Asegúrate de seleccionar el microcontrolador ATmega328P y de conectar los LEDs y el botón según las especificaciones del hardware.

## Licencia
Este código está protegido por una licencia de uso personal. No se permite su reproducción o distribución sin el permiso del autor. Puedes usarlo para fines personales o educativos, pero debes reconocer al autor original.
