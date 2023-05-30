
This package offer a simple way to prepare, show and interact with a Eversign iframe overlay.
The main purpose is to let user sign or decline a document, using Eversign iframe, in a Flutter Web app.

## Features

* Prepare a widget to show the iframe overlay (can be mounted anywhere in the widget tree)
* Subscribe to load, sign, decline and error events

## Getting started

1. Include this package in the pubspec.yaml file

    ```yaml
    dependencies:
    eversign_overlay: ^0.0.1
    ```

2. Import the package in your app
    
    ```dart
    import 'package:flutter_eversign/flutter_eversign.dart';
    ```

3. Create and show a widget
    ```dart
    final Widget _view = FlutterEversign.getEversignWidget(url);
    // show widget ...
    ```

## Usage

### For simply displaying the iframe 

```dart
final String url = 'MY_URL_HERE';
final Widget _view = FlutterEversign.getEversignWidget(url);

// use the widget in your app
```

### Listen to events

```dart
final String url = 'MY_URL_HERE';

// creating the handler object with onError callback
final FlutterEversignHandler handler = FlutterEversignHandler(
    onError: (error) => print(error),
);

// update handler at runtime
handler.onLoaded = () => print('loaded');

final Widget _view = FlutterEversign.getEversignWidget(url, listener: handler);
```

### Providing custom height and width

```dart
final String url = 'MY_URL_HERE';

final Widget _view = FlutterEversign.getEversignWidget(
    url,
    width: 500,
    height: 500,
);
```



## Additional information

### Supported platforms
For now only Flutter Web is supported, some other platforms may be added in the future.

### Eversign official documentation
Refer to [the official documentation](https://eversign.com/api/documentation/embedded-signing) for more information about Eversign and the frame events.


### Authors
This package is developed by [zwapin](https://github.com/zwapin) developers.

You can contact us at [tech@zwap.in](mailto:tech@zwap.in) and [alessandro@zwap.in](mailto:alessandro@zwap.in)