// In cancelevent.dart

class CancelEvent {
  final int success;

  CancelEvent({required this.success});

  factory CancelEvent.fromJson(Map<String, dynamic> json) {
    return CancelEvent(success: json['success']);
  }
}
