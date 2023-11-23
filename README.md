# Aplicación de Flutter: Manejo de formularios y notificaciones con Material 3 y BLoC

Creación de formularios y manejo de notificaciones locales y externas (Rest API). Se utilizará el gestor de estado Flutter BLoC.

## Contenido de la aplicación

- Aprender a manejar otro gestor de estado, **Flutter BLoC** (en este punto se conocen los Stateful Widgets, Provider y Riverpod). Flutter Bloc es robusto y aunque a la vez puede verse como con mucho archivo adicional, a la larga lo hace fácil de probar, revertir y mantener.

  - BLoC
  - Flutter Bloc
  - Cubits
  - Equatable
  - Eventos
  - Estado

- **Formularios**:

  - Tres aproximaciones:

    - Tradicionales Stateful (Forms, TextFormField + Keys)
    - Con gestor de estado
    - Con gestor de estado + Data Input fields personalizados

  - Validaciones, obtención de datos y manejo del estado de los formularios.

- Manejo de **Notificaciones Push y Local Notifications**:

  - Tipos de estado de notificaciones
  - Métodos para su manejo
  - Entidades
  - BLoC
  - Leer las notificaciones push
  - Interacciones
  - Navegación a diferentes rutas basados en la PUSH
  - **Firebase**
  - Configuraciones de FCM
  - Configuración de proyecto de Firebase

- Enviar notificaciones desde una **Rest API**: Crear un backend rápido para obtener el Bearer token de Firebase, y con eso, poder probar el Restful API de la forma recomendada de Firebase.

- Ampliación de las **Local Notifications**: aprender a utilizar el paquete de Local Notifications, el cual es muy completo y aquí se aplicará:

  - Mezclar Push + Local Notifications
  - Reaccionar cuando se tocan las local notifications
  - Sonidos e iconos personalizados
  - Aprender a evitar las dependencias ocultas.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
