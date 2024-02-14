# instafun

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Launcher icon
Add this dependency
`flutter_launcher_icons`

Add this to pubspec.yaml (root level)

```yaml
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/cat_icon.png"
  min_sdk_version: 16
```

```bash
flutter pub run flutter_launcher_icons
```