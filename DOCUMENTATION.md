# 📱 Yes No App - Documentación Técnica

## 📋 Tabla de Contenidos
- [Descripción del Proyecto](#descripción-del-proyecto)
- [Arquitectura](#arquitectura)
- [Widgets y Componentes](#widgets-y-componentes)
- [Configuración y Temas](#configuración-y-temas)
- [Propiedades y Callbacks](#propiedades-y-callbacks)
- [Referencias y Recursos](#referencias-y-recursos)

---

## 🎯 Descripción del Proyecto

**Yes No App** es una aplicación de chat interactiva desarrollada en Flutter que simula una conversación con respuestas automáticas de tipo "Sí/No" con imágenes GIF.

### Características Principales
- ✅ Interfaz de chat moderna con Material Design 3
- ✅ Mensajes diferenciados (enviados/recibidos)
- ✅ Integración con API de imágenes GIF
- ✅ Tema personalizable con modo oscuro
- ✅ Animaciones y transiciones fluidas

---

## 🏗️ Arquitectura

El proyecto sigue una arquitectura limpia con separación de responsabilidades:

```
lib/
├── main.dart                          # Punto de entrada
├── config/
│   └── theme/
│       └── app_theme.dart            # Configuración de temas
└── presentation/
    ├── screens/
    │   └── chat/
    │       └── chat_scrren.dart      # Pantalla principal
    └── widgets/
        ├── chat/
        │   ├── my_message_buble.dart     # Burbuja mensaje enviado
        │   └── her_message_bubble.dart   # Burbuja mensaje recibido
        └── shared/
            └── message_field_box.dart    # Campo de texto
```

---

## 🧩 Widgets y Componentes

### 1. **MaterialApp** (`main.dart`)

Widget raíz de la aplicación que configura el tema y la navegación.

#### Propiedades Utilizadas:
- **`debugShowCheckedModeBanner`**: `bool` - Oculta el banner de debug
- **`theme`**: `ThemeData` - Define el tema visual de la app
- **`title`**: `String` - Título de la aplicación
- **`home`**: `Widget` - Widget de la pantalla inicial

#### Uso Profesional:
```dart
MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: AppTheme(selectedColor: 1).theme(),
  title: 'Yes no app',
  home: const ChatScrren()
)
```

#### Referencias:
- [MaterialApp - Flutter Docs](https://api.flutter.dev/flutter/material/MaterialApp-class.html)
- [Material Design 3](https://m3.material.io/)

---

### 2. **Scaffold** (`chat_scrren.dart`)

Estructura básica de la pantalla con AppBar y Body.

#### Propiedades Utilizadas:
- **`appBar`**: `AppBar?` - Barra superior de la aplicación
- **`body`**: `Widget` - Contenido principal de la pantalla

#### Componentes Comunes:
- **AppBar**: Barra de navegación superior
- **SafeArea**: Área segura que respeta los límites del dispositivo
- **Column**: Layout vertical de widgets

#### Referencias:
- [Scaffold - Flutter Docs](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- [AppBar - Flutter Docs](https://api.flutter.dev/flutter/material/AppBar-class.html)

---

### 3. **ListView.builder** (`chat_scrren.dart`)

Lista eficiente que construye items bajo demanda.

#### Propiedades Utilizadas:
- **`itemCount`**: `int?` - Número total de elementos
- **`itemBuilder`**: `Widget Function(BuildContext, int)` - Constructor de items

#### Callback Principal:
```dart
itemBuilder: (context, index) {
  return (index % 2 == 0) 
    ? const HerMessageBuble() 
    : const MyMessageBuble();
}
```

#### Uso Profesional:
- Ideal para listas grandes (lazy loading)
- Optimiza memoria construyendo solo elementos visibles
- Soporta scroll infinito

#### Referencias:
- [ListView.builder - Flutter Docs](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
- [Lists & Grids - Flutter Cookbook](https://docs.flutter.dev/cookbook/lists/long-lists)

---

### 4. **TextFormField** (`message_field_box.dart`)

Campo de texto con validación y decoración personalizada.

#### Propiedades Utilizadas:
- **`controller`**: `TextEditingController` - Controla el texto del input
- **`focusNode`**: `FocusNode` - Maneja el foco del teclado
- **`decoration`**: `InputDecoration` - Estilo visual del campo
- **`onFieldSubmitted`**: `void Function(String)` - Callback al enviar
- **`onTapOutside`**: `void Function(PointerDownEvent)` - Callback al tocar fuera

#### Callbacks Más Usados:
```dart
// Al enviar (presionar Enter)
onFieldSubmitted: (value) {
  print('Mensaje enviado: $value');
  textController.clear();
  focusNode.requestFocus();
}

// Al tocar fuera del campo
onTapOutside: (event) {
  focusNode.unfocus();
}
```

#### InputDecoration - Propiedades:
- **`hintText`**: `String` - Texto de ayuda
- **`enabledBorder`**: `InputBorder` - Borde cuando está deshabilitado
- **`focusedBorder`**: `InputBorder` - Borde cuando tiene foco
- **`filled`**: `bool` - Si tiene relleno de fondo
- **`suffixIcon`**: `Widget?` - Icono al final del campo

#### Referencias:
- [TextFormField - Flutter Docs](https://api.flutter.dev/flutter/material/TextFormField-class.html)
- [Input & Forms - Flutter Cookbook](https://docs.flutter.dev/cookbook/forms/text-input)
- [FocusNode - Flutter Docs](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

---

### 5. **Container** (Burbujas de mensaje)

Widget de caja que permite decoración, padding y dimensiones.

#### Propiedades Utilizadas:
- **`decoration`**: `BoxDecoration?` - Decoración visual
- **`child`**: `Widget?` - Widget hijo
- **`width`**: `double?` - Ancho del contenedor
- **`height`**: `double?` - Alto del contenedor
- **`padding`**: `EdgeInsetsGeometry?` - Espaciado interno

#### BoxDecoration - Propiedades:
- **`color`**: `Color?` - Color de fondo
- **`borderRadius`**: `BorderRadiusGeometry?` - Bordes redondeados
- **`border`**: `Border?` - Borde del contenedor
- **`gradient`**: `Gradient?` - Degradado de colores
- **`boxShadow`**: `List<BoxShadow>?` - Sombras
- **`image`**: `DecorationImage?` - Imagen de fondo

#### Ejemplo Profesional:
```dart
Container(
  decoration: BoxDecoration(
    color: colors.primary,
    borderRadius: BorderRadius.circular(20)
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Text('Mensaje'),
  ),
)
```

#### Referencias:
- [Container - Flutter Docs](https://api.flutter.dev/flutter/widgets/Container-class.html)
- [BoxDecoration - Flutter Docs](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html)

---

### 6. **Image.network** (`her_message_bubble.dart`)

Widget para cargar imágenes desde URLs.

#### Propiedades Utilizadas:
- **`width`**: `double?` - Ancho de la imagen
- **`height`**: `double?` - Alto de la imagen
- **`fit`**: `BoxFit` - Cómo ajustar la imagen al espacio
- **`loadingBuilder`**: `Widget Function(...)` - Widget mientras carga

#### LoadingBuilder Callback:
```dart
loadingBuilder: (context, child, loadingProgress) {
  if (loadingProgress == null) return child;
  
  return Container(
    width: size.width * 0.7,
    height: 150,
    child: const Text('Cargando...'),
  );
}
```

#### BoxFit - Valores Comunes:
- **`BoxFit.cover`**: Cubre todo el espacio (recorta si es necesario)
- **`BoxFit.contain`**: Contiene la imagen completa
- **`BoxFit.fill`**: Estira para llenar el espacio
- **`BoxFit.fitWidth`**: Ajusta al ancho
- **`BoxFit.fitHeight`**: Ajusta al alto

#### Referencias:
- [Image.network - Flutter Docs](https://api.flutter.dev/flutter/widgets/Image/Image.network.html)
- [BoxFit - Flutter Docs](https://api.flutter.dev/flutter/painting/BoxFit.html)

---

### 7. **ClipRRect** (`her_message_bubble.dart`)

Recorta su widget hijo con bordes redondeados.

#### Propiedades Utilizadas:
- **`borderRadius`**: `BorderRadiusGeometry` - Radio de los bordes
- **`child`**: `Widget` - Widget a recortar

#### Uso Común:
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Image.network('url')
)
```

#### Referencias:
- [ClipRRect - Flutter Docs](https://api.flutter.dev/flutter/widgets/ClipRRect-class.html)

---

### 8. **Column** (Layout Vertical)

Organiza widgets verticalmente.

#### Propiedades Utilizadas:
- **`children`**: `List<Widget>` - Lista de widgets hijos
- **`crossAxisAlignment`**: `CrossAxisAlignment` - Alineación horizontal
- **`mainAxisAlignment`**: `MainAxisAlignment` - Alineación vertical
- **`mainAxisSize`**: `MainAxisSize` - Tamaño del eje principal

#### CrossAxisAlignment Valores:
- **`CrossAxisAlignment.start`**: Alinea al inicio (izquierda)
- **`CrossAxisAlignment.end`**: Alinea al final (derecha)
- **`CrossAxisAlignment.center`**: Alinea al centro
- **`CrossAxisAlignment.stretch`**: Estira al ancho completo

#### Referencias:
- [Column - Flutter Docs](https://api.flutter.dev/flutter/widgets/Column-class.html)
- [Layouts - Flutter Tutorial](https://docs.flutter.dev/ui/layout)

---

### 9. **CircleAvatar** (`chat_scrren.dart`)

Widget circular para mostrar imágenes de perfil.

#### Propiedades Utilizadas:
- **`backgroundImage`**: `ImageProvider?` - Imagen de fondo
- **`radius`**: `double?` - Radio del círculo
- **`backgroundColor`**: `Color?` - Color de fondo

#### Uso con NetworkImage:
```dart
CircleAvatar(
  backgroundImage: NetworkImage('https://...'),
)
```

#### Referencias:
- [CircleAvatar - Flutter Docs](https://api.flutter.dev/flutter/material/CircleAvatar-class.html)
- [NetworkImage - Flutter Docs](https://api.flutter.dev/flutter/painting/NetworkImage-class.html)

---

### 10. **MediaQuery** (`her_message_bubble.dart`)

Obtiene información sobre el tamaño y orientación de la pantalla.

#### Propiedades Utilizadas:
- **`size`**: `Size` - Tamaño de la pantalla
- **`orientation`**: `Orientation` - Orientación del dispositivo
- **`padding`**: `EdgeInsets` - Padding de áreas seguras

#### Uso Común:
```dart
final size = MediaQuery.of(context).size;
width: size.width * 0.7  // 70% del ancho de pantalla
```

#### Referencias:
- [MediaQuery - Flutter Docs](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html)
- [Responsive Design - Flutter](https://docs.flutter.dev/ui/adaptive-responsive)

---

## 🎨 Configuración y Temas

### AppTheme (`app_theme.dart`)

Clase personalizada para gestionar temas de la aplicación.

#### Características:
- Múltiples esquemas de color predefinidos
- Validación de índice de color con `assert`
- Soporte para Material Design 3
- Modo oscuro habilitado

#### Propiedades:
```dart
final int selectedColor;  // Índice del color seleccionado
```

#### ThemeData - Propiedades Principales:
- **`useMaterial3`**: `bool` - Activa Material Design 3
- **`colorSchemeSeed`**: `Color` - Color base para el esquema
- **`brightness`**: `Brightness` - Modo claro/oscuro

#### Paleta de Colores:
```dart
const List<Color> _colorThemes = [
  Color(0xFF05058E),  // Azul personalizado
  Colors.black,       // Negro
  Colors.blue,        // Azul
  Colors.yellow,      // Amarillo
  Colors.pink,        // Rosa
];
```

#### Referencias:
- [ThemeData - Flutter Docs](https://api.flutter.dev/flutter/material/ThemeData-class.html)
- [Material Theme Builder](https://m3.material.io/theme-builder)
- [ColorScheme - Flutter Docs](https://api.flutter.dev/flutter/material/ColorScheme-class.html)

---

## 📦 Propiedades y Callbacks Más Usados

### Callbacks de TextField/TextFormField

| Callback | Tipo | Descripción | Cuándo Usar |
|----------|------|-------------|-------------|
| `onChanged` | `void Function(String)` | Se ejecuta cada vez que cambia el texto | Validación en tiempo real |
| `onFieldSubmitted` | `void Function(String)` | Al presionar Enter/Enviar | Enviar mensajes, búsquedas |
| `onTap` | `void Function()` | Al tocar el campo | Analytics, mostrar opciones |
| `onTapOutside` | `void Function(PointerDownEvent)` | Al tocar fuera del campo | Cerrar teclado |
| `onEditingComplete` | `void Function()` | Al completar la edición | Guardar borrador |

### Callbacks de Botones

| Callback | Tipo | Descripción |
|----------|------|-------------|
| `onPressed` | `void Function()?` | Al presionar el botón |
| `onLongPress` | `void Function()?` | Al mantener presionado |
| `onHover` | `void Function(bool)?` | Al pasar el cursor (web/desktop) |

### Callbacks de ListView

| Callback | Tipo | Descripción |
|----------|------|-------------|
| `itemBuilder` | `Widget Function(BuildContext, int)` | Construye cada item |
| `separatorBuilder` | `Widget Function(BuildContext, int)` | Construye separadores |

---

## 🔧 Controladores y Gestión de Estado

### TextEditingController

Controla el texto de un TextField.

#### Métodos Principales:
```dart
textController.text;           // Obtener texto
textController.text = 'Hola';  // Establecer texto
textController.clear();        // Limpiar
textController.dispose();      // Liberar recursos
```

#### Mejores Prácticas:
- ✅ Crear fuera del método `build()`
- ✅ Usar `StatefulWidget` para widgets con estado
- ✅ Llamar `dispose()` para evitar memory leaks
- ❌ No crear en cada reconstrucción del widget

### FocusNode

Gestiona el foco del teclado.

#### Métodos Principales:
```dart
focusNode.requestFocus();  // Abrir teclado
focusNode.unfocus();       // Cerrar teclado
focusNode.hasFocus;        // Verificar si tiene foco
focusNode.dispose();       // Liberar recursos
```

---

## 📚 Referencias y Recursos

### Documentación Oficial

#### Flutter Core
- [Flutter Docs](https://docs.flutter.dev/)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Flutter API Reference](https://api.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

#### Material Design
- [Material Design 3](https://m3.material.io/)
- [Material Components](https://m3.material.io/components)
- [Color System](https://m3.material.io/styles/color/overview)

### Tutoriales y Guías

#### Layouts
- [Building Layouts](https://docs.flutter.dev/ui/layout)
- [Layout Cheat Sheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)

#### Forms & Input
- [Form Validation](https://docs.flutter.dev/cookbook/forms/validation)
- [Text Input](https://docs.flutter.dev/cookbook/forms/text-input)

#### Lists & Scrolling
- [Long Lists](https://docs.flutter.dev/cookbook/lists/long-lists)
- [ListView Guide](https://api.flutter.dev/flutter/widgets/ListView-class.html)

#### Networking
- [Fetch Data from Internet](https://docs.flutter.dev/cookbook/networking/fetch-data)
- [Images from Network](https://docs.flutter.dev/cookbook/images/network-image)

### Packages Útiles

#### UI Components
- [flutter_chat_ui](https://pub.dev/packages/flutter_chat_ui) - UI para chats
- [cached_network_image](https://pub.dev/packages/cached_network_image) - Cacheo de imágenes

#### State Management
- [provider](https://pub.dev/packages/provider) - Gestión de estado
- [riverpod](https://pub.dev/packages/riverpod) - Estado reactivo
- [bloc](https://pub.dev/packages/bloc) - BLoC pattern

#### HTTP & APIs
- [http](https://pub.dev/packages/http) - Cliente HTTP
- [dio](https://pub.dev/packages/dio) - Cliente HTTP avanzado

### APIs Utilizadas

- **Yes No API**: [yesno.wtf](https://yesno.wtf/) - API para respuestas Sí/No con GIF

### Comunidad y Recursos

- [Flutter Community Medium](https://medium.com/flutter-community)
- [Flutter Reddit](https://www.reddit.com/r/FlutterDev/)
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)
- [Flutter Examples](https://github.com/flutter/samples)

### Videos y Cursos

- [Flutter Widget of the Week](https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG)
- [Flutter Course - freeCodeCamp](https://www.youtube.com/watch?v=VPvVD8t02U8)
- [Código Facilito - Flutter](https://codigofacilito.com/cursos/flutter)

---

## 📝 Notas Técnicas

### ¿StatelessWidget o StatefulWidget?

#### StatelessWidget
- ✅ No tiene estado mutable
- ✅ Más eficiente
- ✅ Ideal para UI estática
- ❌ No puede cambiar después de construirse

#### StatefulWidget
- ✅ Tiene estado mutable
- ✅ Puede reconstruirse con `setState()`
- ✅ Ideal para formularios, animaciones
- ❌ Consume más recursos

### Optimizaciones

#### ListView.builder vs ListView
```dart
// ❌ Malo para listas grandes
ListView(children: [...100 items])

// ✅ Mejor rendimiento
ListView.builder(itemCount: 100, itemBuilder: ...)
```

#### Const Constructors
```dart
// ✅ Mejora rendimiento
const Text('Hola')
const SizedBox(height: 10)
```

### Gestión de Memoria

```dart
@override
void dispose() {
  textController.dispose();
  focusNode.dispose();
  super.dispose();
}
```

---

## 🚀 Próximos Pasos

### Mejoras Sugeridas
1. Implementar gestión de estado (Provider/Riverpod)
2. Integrar API real de Yes/No
3. Agregar persistencia de mensajes
4. Implementar notificaciones
5. Añadir tests unitarios y de integración

### Estructura Recomendada para Escalar
```
lib/
├── core/
│   ├── constants/
│   ├── utils/
│   └── errors/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   └── usecases/
└── presentation/
    ├── providers/
    ├── screens/
    └── widgets/
```

---

## 📄 Licencia

Este proyecto es parte de un ejercicio educativo de Flutter.

---

**Última actualización**: Diciembre 2024  
**Versión de Flutter**: 3.10+  
**SDK de Dart**: 3.10.0+


