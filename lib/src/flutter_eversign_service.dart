import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter_eversign/src/models/flutter_eversign_handler.dart';

class FlutterEversign {
  static Widget getEversignWidget(
    String url, {
    FlutterEversignHandler? listener,
    double width = 500,
    double height = 500,
  }) {
    final html.IFrameElement _iframeElement = html.IFrameElement();

    _iframeElement.height = height.toString();
    _iframeElement.width = width.toString();
    _iframeElement.src = url;
    _iframeElement.style.border = 'none';

    html.window.addEventListener('message', (m) => _handleMessage(m, listener), false);

    final randomString = UniqueKey().hashCode;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      '_frame_$randomString',
      (_) => _iframeElement,
    );

    return HtmlElementView(
      key: UniqueKey(),
      viewType: '_frame_$randomString',
      onPlatformViewCreated: (_) {},
    );
  }

  static void _handleMessage(dynamic message, FlutterEversignHandler? handler) {
    if (handler == null) return;

    message = message as html.MessageEvent;
    late bool _isAMap;
    late Map? _map;
    late String? _event;

    try {
      _map = Map.castFrom(message.data);
      _isAMap = true;
    } catch (e) {
      _event = message.data;
      _isAMap = false;
    }

    if (_isAMap) {
      handler.onError?.call(_map![_map.keys.first]);
    } else {
      switch (_event!.split('_').last) {
        case 'loaded':
          handler.onLoaded?.call();
          break;
        case 'signed':
          handler.onSigned?.call();
          break;
        case 'declined':
          handler.onDeclined?.call();
          break;
        case 'error':
          handler.onError?.call(_event);
          break;
      }
    }
  }
}
