# Flutter Google Sign In using Firebase 
![codemagic](https://api.codemagic.io/apps/5d636daaf5035821fb723bc3/5d636daaf5035821fb723bc2/status_badge.svg)

<p align="center">
  <img src="https://github.com/sbis04/sign_in_flutter/raw/master/Screenshot/login_cover.png">
</p>

### **Checkout my Medium article ["Flutter: Implementing Google Sign In"](https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed).**

In this app, I have implemented **Google Sign In** using **Firebase** for both Android and iOS, fixing all the issues with the latest Flutter updates. To understand how to fix all the **Firebase** issues in **Flutter** make sure you check out my **Medium article**.

> NOTE: The project is tested on **Flutter 1.20 (stable)** and using all the latest versions of the plugins.

## Project versions

There are three versions of this project available:

* Simple Google Sign In ([master](https://github.com/sbis04/sign_in_flutter/tree/master))
* Combined with Auto Login ([auto_login](https://github.com/sbis04/sign_in_flutter/tree/auto_login))
* Combined with Local Authentication using Biometric ([local_auth](https://github.com/sbis04/sign_in_flutter/tree/local_auth))

# Using this app
If you want to clone and use this app, then you have to complete the following steps:

### Step 1: Generate the SHA-1

Use the following command to generate **SHA-1**:

```bash
keytool -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore
```

### Step 2: Complete the Firebase setup

First of all, complete the whole Firebase setup for both **Android** and **iOS**. You will get two files while doing the setup, one for each platform. You have to place the **google-services.json** & **GoogleService-Info.plist** files in the respective directory of each platform. For more info, check out my Medium article.

> NOTE: USE THE SHA-1 GENERATED FROM YOUR SYSTEM

### Step 3: Completing the iOS integration

For the iOS part, you have to do one more step. You will find a **TODO** in **Info.plist** file, just complete that.

### Step 4: Run the app

Now, you can run the app on your device using the command:

```bash
flutter run
```

# Screenshots

<p align="left">
  <img src="https://github.com/sbis04/sign_in_flutter/raw/master/Screenshot/login_screens.png">
</p>

# Plugins

The plugins used in this project are: 

1. [firebase_core](https://pub.dev/packages/firebase_core)
2. [firebase_auth](https://pub.dev/packages/firebase_auth).
3. [google_sign_in](https://pub.dev/packages/google_sign_in).

Add this to your package's pubspec.yaml file to use **Firebase** & **Google Sign In**:

```yaml
dependencies:
  firebase_core: ^0.5.0
  firebase_auth: ^0.18.0+1
  google_sign_in: ^4.5.3
```
Import using:

```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
```

# Methods

Following are two useful methods for authentication using **Firebase** and **Google Sign In**. You can use these as the basic template for your starting project.

**NOTE: These does not check for all edge cases and you should add other security restrictions as per your requirement in your production app**

For signing in using a Google account:

```dart
Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}
```

For signing out of a Google account:

```dart
Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}
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
