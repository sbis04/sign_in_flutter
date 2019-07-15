# Flutter Google Sign In using Firebase

<p align="center">
  <img src="https://github.com/sbis04/sign_in_flutter/blob/master/Screenshot/login_cover.png">
</p>

### **Checkout my Medium article ["Flutter: Implementing Google Sign In"](https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed).**

In this app, I have implemented **Google Sign In** using **Firebase** for both Android and iOS, fixing all the issues with the latest Flutter updates. To understand how to fix all the **Firebase** issues in **Flutter** make sure you check out my **Medium aticle**.

## Flutter 1.7 updates

With the introduction of Flutter 1.7, the most frustrating thing fixing **AndriodX incompatibilities** has been taken care of. Now, you can just create a new project using the `--androidx` flag to ensure the generated project targets the new support library.

## Firebase changes

Now, you need to fill the **OAuth consent form** in order to use **Firebase** in your app, otherwise your app will just crash. So, make sure you checkout my **Medium article**.

# Using this app
If you want to clone and use this app, then you have to complete the following steps:

### Step 1: Complete the Firebase setup

First of all, complete the whole Firebase setup for both **Android** and **iOS**. You will get two files while doing the setup, one for each platform. You have to place the **google-services.json** & **GoogleService-Info.plist** files in the respective directory of each platform. For more info, check out my Medium article.

### Step 2: Completing the iOS integrtion

For the iOS part, you have to do one more step. You find a **TODO** in **Info.plist** file, just complete that.

### Step 3: Run the app

Now, you can run the app on your device using the command:

```bash
flutter run
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
