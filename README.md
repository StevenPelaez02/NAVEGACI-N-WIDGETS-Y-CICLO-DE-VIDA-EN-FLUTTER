# hola_mundo

Hola Mundo y plantilla base para una aplicacion en Flutter.

## Empecemos
Este proyecto es el punto de partida para una aplicación Flutter


## Requisitos Previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- **Flutter SDK**: Asegúrate de tener Flutter instalado en tu máquina. Puedes descargarlo desde [aquí](https://flutter.dev/docs/get-started/install).
- **Dart SDK**: Viene incluido con Flutter, pero asegúrate de que esté actualizado.
- **Android Studio** o **Xcode**: Dependiendo de la plataforma en la que desees compilar la aplicación.
- **Git**: Para clonar el repositorio.

## Clonar el Repositorio
- navega hasta la ruta del proyecto.
ejecuta:
- flutter pub get
- Compilar App.

## Otros recursos
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


Para obtener ayuda para comenzar con el desarrollo de Flutter, consulte la
[documentacíon Online](https://docs.flutter.dev/), que ofrece tutoriales, ejemplos, orientación sobre desarrollo móvil y una referencia completa de API.

# Flutter - Taller de Navegación, Widgets y Ciclo de Vida

## Descripción
Este proyecto es una aplicación en Flutter que implementa:
- Navegación entre pantallas con `go_router`.
- Paso de parámetros entre pantallas.
- Widgets personalizados, incluyendo `GridView`, `TabBar` y `FloatingActionButton`.
- Evidencia del ciclo de vida de un `StatefulWidget` con `print()` en consola.

## Funcionalidades
- Navegación y paso de parámetros usando `go_router`.
- Pantalla con `GridView` y `TabBar` para mostrar contenido organizado.
- Manejo del ciclo de vida de un `StatefulWidget` con eventos clave.
- Uso de `BaseView` para estandarizar diseño y drawer lateral en todas las pantallas.

## Instalación
1. Clona el repositorio desde GitHub:
   ```sh
   git clone <URL_DEL_REPOSITORIO>
   cd hola_mundo
   ```
2. Instala las dependencias:
   ```sh
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```sh
   flutter run
   ```

## Ciclo de vida del `StatefulWidget`
Se implementó la pantalla `CicloVidaScreen` que imprime en consola los siguientes eventos:
- `initState()`: Se ejecuta cuando la pantalla se inicializa.
- `didChangeDependencies()`: Se ejecuta cuando cambian las dependencias.
- `build()`: Se ejecuta cada vez que el widget se redibuja.
- `setState()`: Se llama cuando el estado cambia.
- `dispose()`: Se ejecuta cuando la pantalla se destruye.

## Estructura del Proyecto

```
lib/
├── main.dart
├── routes/
│   ├── app_router.dart
├── themes/
│   ├── app_theme.dart
├── views/
│   ├── base_view.dart
│   ├── home_view.dart
│   ├── ciclo_vida/
│   │   ├── ciclo_vida_screen.dart
│   ├── paso_parametros/
│   │   ├── paso_parametros_screen.dart
│   │   ├── detalle_screen.dart
│   ├── profile_view.dart
│   ├── settings_view.dart
│   ├── widgets/
│   │   ├── widgets_screen.dart
```