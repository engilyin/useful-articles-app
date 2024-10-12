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

Generate the launcher icon and splashes

```bash
flutter pub get 
flutter pub run flutter_launcher_icons:main
flutter pub run flutter_native_splash:create
```

## Useful commands

```bash
#show the dependencies tree
flutter pub deps -s tree

#check the packages we can update
flutter pub outdated  

#upgrade flutter to the latest
flutter upgrade 
```
