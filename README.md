# Minimal Barcode Scanner

A plugin for Flutter apps that adds barcode scanning support on both Android and iOS. Forked from [flutter_barcode_scanner](https://github.com/AmolGangadhare/flutter_barcode_scanner).

<!-- TODO: Add pub dev -->
<!-- [![pub package](https://img.shields.io/pub/v/minimal_barcode_scanner.svg)](https://pub.dartlang.org/packages/minimal_barcode_scanner) -->

![Demo gif](https://github.com/AmolGangadhare/MyProfileRepo/blob/master/flutter_barcode_scanning_demo.gif "Demo")

## Try example

Just clone or download the repository, open the project in `Android Studio/ VS Code`, open `pubspec.yaml` and click on `Packages get`.
Connect device and hit `run`.
To run on iPhone you need to run from Xcode first time and just make `pod install` in `example/ios` then run from Xcode.

## Getting Started

Follow the steps for Android and iOS

PLEASE FOLLOW **iOS** STEPS CAREFULLY

### Android

:zap:  Don't worry, you don't need to do anything.

### iOS - Requires Swift support

Deployment target : 12

#### 1. Fresh start

 1. Create a new flutter project. Please check for **Include swift support for iOS code**.
 2. After creating new flutter project open `/ios` project in Xcode and set minimum **deployment target to 12**
    and set **Swift version to 5**.
 3. After setting up the deployment target and swift version, close the Xcode then run **pod install** in `/ios` in flutter project.

 You have done with basic configuration now proceed to section **How to use**.

#### 2. Adding to existing flutter app

#### If your existing ios code is **Swift** then you just need to do following

  1. Set **minimum deployment target to 12** and set **Swift version to 5**.
  2. Close the Xcode and run **pod install** in `/ios` in flutter project.
  3. Now proceed to section **How to use**.

#### If your existing ios code is **Objective-C** then you need to do following

  1. Create a new flutter project with same name at different location (Don't forget to check **Include swift support for iOS code** while creating)
  2. Just copy newly created `/ios` folder from project and replace with existing `/ios`.
  3. Open ios project in Xcode and set **minimum deployment target to 12** and set **Swift version to 5**.
  4. Run **pod install** in `/ios`

**Note: If you did any changes in ios part before, you might need to make these configuration again**

## How to use ?

To use on iOS, you will need to add the camera usage description.
To do that open the Xcode and add camera usage description in `Info.plist`.

```
<key>NSCameraUsageDescription</key>
<string>Camera permission is required for barcode scanning.</string>
```

After making the changes in Android ans iOS add minimal_barcode_scanner to `pubspec.yaml`
```
dependencies:
  ...
  minimal_barcode_scanner: ^0.0.1
```

### One time scan

1. You need to import the package first.

```
import 'package:minimal_barcode_scanner/minimal_barcode_scanner.dart';
```

2. Then use the `scanBarcode` method to access barcode scanning.

```dart
String _barcodeResult = await MinimalBarcodeScanner.scanBarcode(
  lineColor,
  cancelButtonText,
  isShowFlashIcon,
  scanMode,
);
```

Here in `scanBarcode`,

 `lineColor` is hex-color which is the color of line in barcode overlay you can pass color of your choice,

 `cancelButtonText` is a text of cancel button on screen you can pass text of your choice and language,

 `isShowFlashIcon` is bool value used to show or hide the flash icon,

 `scanMode` is a enum in which user can pass any of `{ QR, BARCODE, DEFAULT }`, if nothing is passed it will consider a default value which will be `QR`.
 It shows the graphics overlay like for barcode and QR.

 NOTE: Currently, `scanMode` is just to show the graphics overlay for barcode and QR. Any of this mode selected will scan both QR and barcode. 

### Continuous scan

* If you need to scan barcodes continuously without closing camera use `MinimalBarcodeScanner.getBarcodeStreamReceiver`
params will be same like `MinimalBarcodeScanner.scanBarcode`
e.g.

```
MinimalBarcodeScanner.getBarcodeStreamReceiver(
  '#ff6666',
  'Cancel',
  true,
  ScanMode.BARCODE,
)?.listen((barcode) => print(barcode));
```

### Contribution

would :heart: to see any contribution, give :star: if this package is useful for you.
