import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class NotificationApiService {
  static Future<int?> sendNotificationToUser({required  String fcmToken, required String message}) async {
    String key =
        "key=AAAAsaKlfUY:APA91bGfit9sJymJxGrvnDkRx5_TZ1CUJcqSyKAnqJIC019EdY8HTZEbobInNmj3lvl28k3p1_g2CE84L5zlgAm63EX_CGaPTkII4Vlvmu7C1zA0cksZvSFUuZ70zCI1jDFYRGD1hh7W";
    var body = {
      "to": fcmToken,
      "notification": {
        "title": "Diqqat! Notification keldi",
        "body": message
      },
      "data": {
        "name": "Abdulloh",
        "age": 22,
        "job": "Programmer",
        "route": "chat"
      }
    };

    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");

    try {
      Response response = await https.post(
        uri,
        headers: {"Authorization": key, "Content-Type": "application/json"},
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        var t = jsonDecode(response.body);
        print("RESPONSE:$t");
        return jsonDecode(response.body)["success"] as int;
      } else {
        throw Exception();
      }
    } catch (e) {
      // throw Exception(e);
      print("Error $e");
    }
  }

  static Future<String> sendNotificationToAll(String topicName) async {
    String key =
        "key=AAAAsaKlfUY:APA91bGfit9sJymJxGrvnDkRx5_TZ1CUJcqSyKAnqJIC019EdY8HTZEbobInNmj3lvl28k3p1_g2CE84L5zlgAm63EX_CGaPTkII4Vlvmu7C1zA0cksZvSFUuZ70zCI1jDFYRGD1hh7W";

    Map<String, dynamic> body = {
      "to": "/topics/$topicName",
      "notification": {
        "title": "Diqqat! Notification keldi",
        "body": "Bu notofication body"
      },
      "data": {
        "name": "Abdulloh",
        "age": 22,
        "job": "Programmer",
        "route": "chat"
      }
    };

    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
    try {
      Response response = await https.post(
        uri,
        headers: {
          "Authorization": key,
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message_id"].toString();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}