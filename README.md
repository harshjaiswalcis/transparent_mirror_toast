# Transparent Mirror Toast

A customizable Flutter toast widget with a sleek transparent and mirror-glass effect. Display toast messages with beautiful blur and fade animations anywhere in your app.

## Features

- 🎨 Transparent glass-like mirror effect
- ✨ Fade in/out animation
- 📱 Overlay-based toast display
- 🚀 Easy to use with a single function
- ⚙️ Supports custom duration and position
- 🎯 Multiple position options (top, center, bottom)

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  transparent_mirror_toast: ^1.0.0
```

## Usage

```dart
import 'package:transparent_mirror_toast/transparent_mirror_toast.dart';

// Show a toast at the bottom (default position)
TransparentMirrorToast.show(context, 'Hello World!');

// Show a toast at the center
TransparentMirrorToast.show(
  context,
  'Hello World!',
  position: ToastPosition.center,
);

// Show a toast with custom duration
TransparentMirrorToast.show(
  context,
  'Hello World!',
  duration: Duration(seconds: 3),
);

// Show a toast with custom background color and opacity
TransparentMirrorToast.show(
  context,
  'Hello World!',
  backgroundColor: Colors.blue,
  backgroundOpacity: 0.7,
);
```

## Parameters

| Parameter         | Type          | Default      | Description                                   |
| ----------------- | ------------- | ------------ | --------------------------------------------- |
| context           | BuildContext  | required     | The build context                             |
| message           | String        | required     | The message to display                        |
| duration          | Duration      | 2 seconds    | How long the toast should be visible          |
| position          | ToastPosition | bottom       | Where to show the toast (top, center, bottom) |
| backgroundColor   | Color         | Colors.black | The background color of the toast             |
| backgroundOpacity | double        | 0.5          | The opacity of the background (0.0 to 1.0)    |

## Example

Check out the [example](example) directory for a complete example app.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
