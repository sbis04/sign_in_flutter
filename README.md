# Flutter Google Sign In using Firebase

<p align="center">
  <img src="https://github.com/sbis04/sign_in_flutter/blob/master/Screenshot/login_cover.png">
</p>

### **Checkout my Medium article ["Flutter: Implementing Google Sign In"](https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed).**

In this app, I have implemented **Google Sign In** using **Firebase** for both Android and iOS, fixing all the issues with the latest Flutter updates. To understand how to fix all the **Firebase** issues in **Flutter** make sure you check out my **Medium article**.

## Flutter 1.7 updates

With the introduction of Flutter 1.7, the most frustrating thing fixing **AndriodX incompatibilities** has been taken care of. Now, you can just create a new project using the `--androidx` flag to ensure the generated project targets the new support library.

## Firebase changes

Now, you need to fill the **OAuth consent form** in order to use **Firebase** in your app, otherwise your app will just crash. So, make sure you checkout my **Medium article**.

# Using this app
If you want to clone and use this app, then you have to complete the following steps:

### Step 1: Complete the Firebase setup

First of all, complete the whole Firebase setup for both **Android** and **iOS**. You will get two files while doing the setup, one for each platform. You have to place the **google-services.json** & **GoogleService-Info.plist** files in the respective directory of each platform. For more info, check out my Medium article.

### Step 2: Completing the iOS integration

For the iOS part, you have to do one more step. You will find a **TODO** in **Info.plist** file, just complete that.

### Step 3: Run the app

Now, you can run the app on your device using the command:

```bash
flutter run
```

# Screenshots

<p align="left">
  <img src="https://github.com/sbis04/sign_in_flutter/blob/master/Screenshot/login_screens.png">
</p>

# Plugins

The plugins used in this project are: 

1. ["firebase_auth"](https://pub.dev/packages/firebase_auth).
2. ["google_sign_in"](https://pub.dev/packages/google_sign_in).

Add this to your package's pubspec.yaml file to use **Firebase** & **Google Sign In**:
```yaml
dependencies:
  firebase_auth: ^0.11.1+8
  google_sign_in: ^4.0.4
```
Import using:
```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
```

# License

Copyright (c) 2019 Souvik Biswas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
