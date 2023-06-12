# useful-articles-app
The Useful Articles mobile app. Good sample Flutter app which demonstrates the best practices


## Setup

Create the generated sources
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Generate your platform specific folders with java/swift

```bash
flutter create -i swift -a java .
```

Since this project uses 1 locale add this to your info.plist

```plist
<key>CFBundleLocalizations</key>
<array>
    <string>en</string>
</array>
```

Generate the launcher icon (optional)

```bash
flutter pub get 
flutter pub run flutter_launcher_icons:main
```
