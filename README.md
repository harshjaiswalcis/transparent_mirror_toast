# Transparent Toast Mirror

A Flutter package for displaying beautiful glass-morphism toast notifications with blur effect and smooth animations.

## Features

- 🎨 Beautiful glass-morphism effect
- 🌟 Blur effect for modern look
- ⚡ Smooth fade animations
- 📱 Multiple position options (top, center, bottom)
- 🎯 Customizable appearance
- 🚀 Lightweight and easy to use

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  transparent_toast_mirror: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:transparent_toast_mirror/transparent_toast_mirror.dart';

// Show a simple toast
TransparentToastMirror.show(
  context,
  'Hello, World!',
);

// Show a toast with custom options
TransparentToastMirror.show(
  context,
  'Custom Toast',
  position: GlassToastPosition.center,
  duration: Duration(seconds: 3),
  backgroundColor: Colors.blue,
  backgroundOpacity: 0.7,
);
```

## Parameters

| Parameter         | Type               | Default      | Description                            |
| ----------------- | ------------------ | ------------ | -------------------------------------- |
| context           | BuildContext       | required     | The BuildContext of the current widget |
| message           | String             | required     | The text to display in the toast       |
| duration          | Duration           | 2 seconds    | How long the toast should be visible   |
| position          | GlassToastPosition | bottom       | Where the toast should appear          |
| backgroundColor   | Color              | Colors.black | The color of the toast background      |
| backgroundOpacity | double             | 0.5          | The opacity of the background          |

## GlassToastPosition

- `top`: Shows the toast at the top of the screen
- `center`: Shows the toast in the center of the screen
- `bottom`: Shows the toast at the bottom of the screen

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
