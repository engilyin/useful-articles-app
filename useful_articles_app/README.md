# useful_articles_app

## Setup

### Generate files

Generate the platform folders
```shell
flutter create --org com.engilyin -a java .
```

Classes:
```shell
dart run build_runner build --delete-conflicting-outputs
```

The splash images:
```shell
dart run flutter_native_splash:create
```

the icons:
```shell
dart run flutter_launcher_icons:main
```

### Env

Create the `.env` file at the root folder

```
DEFAULT_API_URL=http://192.168.1.2:8080
```
### Android

Update android/gradle/wrapper/gradle-wrapper.properties version to the latest

Fix `namespace` and `applicationId` in the `android/app/build.gradle`
Add
```
android {
    compileSdk = 35
    ndkVersion = "28.0.12674087"

    defaultConfig {
        minSdk = 27
        targetSdk = 35
```

move `MainActivity` to right package and extend it from `FlutterFragmentActivity` (required by stripe and subject to change)

Change in all `styles.xml`

```
-<style name="NormalTheme" parent="@android:style/Theme.Black.NoTitleBar">
+<style name="NormalTheme" parent="Theme.MaterialComponents">
```

Add into `gradle.properties`:

```
android.defaults.buildfeatures.buildconfig=true
android.nonTransitiveRClass=false
android.nonFinalResIds=false
```

To build it you need to create `android/app/proguard-rules.pro` and add rules for other libs where is is applicable:

```
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivity$g
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Args
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Error
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider
```

### iOS

You need to add into your Podfile:

```
platform :ios, '13.0'
pod 'SomeLib'
```

if you're using iOS and want to open HTTP URLs (not HTTPS), you might need to add some configuration to your Info.plist file to allow arbitrary loads.

For example, adding the following lines inside <dict> in your Info.plist file:

```
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```
and for using Internet in Google Address if you need location services:
```
<key>NSLocationWhenInUseUsageDescription</key>
<string>Permission to get your location</string>
```

Sometimes you need to delete `Podfile.lock` and rerun:

```
pod install --repo-update
```
