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

- Ejecutar la aplicación (elige el dispositivo adecuado):
  ```sh
  flutter run -d linux      # Linux
  flutter run -d chrome     # Web
  flutter run -d android    # Android (requiere emulador/dispositivo)
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

## Nota importante

Para ejecutar cualquier comando de Flutter (como `flutter run`, `flutter test`, etc.), asegúrate de estar ubicado en el directorio raíz del proyecto Flutter, donde se encuentra el archivo `pubspec.yaml`.  
En este caso, navega a la carpeta `test_app` antes de ejecutar los comandos:

```sh
cd test_app
```

Luego puedes ejecutar los comandos como:

```sh
flutter pub get
flutter run -d linux
flutter test
```

## ¿Qué hace `flutter pub get`?

El comando `flutter pub get` descarga e instala todas las dependencias listadas en el archivo `pubspec.yaml` del proyecto.  
Esto asegura que todas las librerías necesarias estén disponibles para compilar y ejecutar la aplicación Flutter.