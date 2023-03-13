import 'package:jwt_decoder/jwt_decoder.dart';

class JwtDecodePayload {
  static JwtDecodePayload? _instance;

  JwtDecodePayload._();

  static JwtDecodePayload get i {
    _instance ??= JwtDecodePayload._();
    return _instance!;
  }

  Map<String, dynamic> decode(String token) {
    return JwtDecoder.decode(token);
  }
}
