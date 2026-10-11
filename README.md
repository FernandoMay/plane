# plane — ejercicio Flutter: animación implícita ("¡Toma vuelo!")

**Historia**: ejercicio de agosto de 2019, commit *"Toma vuelo!"*, README original `# animated`. El ejercicio canónico de animación implícita en Flutter: un `AnimatedContainer` con el avión en `bottomCenter` que, al tocar el FAB "Take Flight", vuela al centro en 2 segundos. Sin curvas, sin controllers — la animación la hace el framework.

## Estado del revival (2026-10)

- **Migrada a null safety**: `const MyApp({super.key})`, `const FlightExample({super.key})`, `createState() => FlightExampleState()` (adiós `new`)
- **Widget test REAL**: reemplaza el boilerplate del counter (que fallaba: esta app no tiene counter). Verifica:
  - el avión arranca en `bottomCenter` con duración de 2s
  - el FAB muestra "Take Flight"
  - al tocar el FAB, la animación corre y el avión termina en `Alignment.center`
- `flutter analyze`: **0 issues** · `flutter test`: **2/2**

## Estructura

```
lib/main.dart   # FlightExample: AnimatedContainer + FAB extendido
test/widget_test.dart
```

## Correr

```bash
flutter pub get
flutter analyze
flutter test
```

## Siguiente paso natural

- **Animación explícita**: reemplazar `AnimatedContainer` por `AnimationController` + `CurvedAnimation` para controlar ida Y vuelta (el avión podría volver a bajar)
- O convertirla en un **Hero**: que el avión vuele entre pantallas

## Licencia

Sin declarar (el template de Flutter no incluía).

## Autor

[FernandoMay](https://github.com/FernandoMay)
