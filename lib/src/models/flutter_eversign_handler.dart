class FlutterEversignHandler {
  /// Called when the initial loading is done
  void Function()? onLoaded;

  /// Called when the document has been signed
  /// from the user
  void Function()? onSigned;

  /// Called when the user has declined to sign
  /// the document
  void Function()? onDeclined;

  /// Called each time there is an error
  void Function(String)? onError;

  FlutterEversignHandler({
    this.onLoaded,
    this.onSigned,
    this.onDeclined,
    this.onError,
  });
}
