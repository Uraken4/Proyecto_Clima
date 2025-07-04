# Proyecto Clima (Flutter)

Aplicación multiplataforma para consultar el pronóstico del clima.

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio (para emuladores Android)
- Un editor de código (VSCode, Android Studio, etc.)

## Instalación

```sh
flutter pub get
```

## Ejecución

- Para correr en Android:
  ```sh
  flutter run -d android
  ```
- Para correr en Linux:
  ```sh
  flutter run -d linux
  ```
- Para correr en Web:
  ```sh
  flutter run -d chrome
  ```

## Comandos para probar la aplicación

- Ejecutar todos los tests:
  ```sh
  flutter test
  ```

- Ejecutar un test específico:
  ```sh
  flutter test test/widget_test.dart
  ```

- Analizar el código:
  ```sh
  flutter analyze
  ```

- Ejecutar la aplicación en modo desarrollo (elige el dispositivo adecuado):
  ```sh
  flutter run -d linux      # Para Linux
  flutter run -d chrome     # Para Web
  flutter run -d android    # Para Android (requiere emulador/dispositivo)
  ```

- Compilar APK para Android:
  ```sh
  flutter build apk --debug
  ```

## Variables de entorno

Crea un archivo `.env` en la raíz del proyecto con tus claves necesarias.

## CI/CD

El proyecto incluye un `Jenkinsfile` para integración continua usando Flutter.

## Contribuciones

¡Pull requests y sugerencias son bienvenidas!