import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../response_model/car_response_model.dart';

class CarViewModel extends ChangeNotifier {
  List<Car> cars = [];

  Future<void> carData() async {
    final url =
        Uri.parse('http://182.76.32.122/connectus-dummy/api/v1/GetAllDetails');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'type': 'CAR'});

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final List<dynamic> carData = responseData['data'];

      cars = carData
          .map((carJson) => Car(
                carId: carJson['car_id'],
                rcNumber: carJson['rc_number'],
                capacity: carJson['capacity'],
                model: carJson['model'],
                remark: carJson['remark'],
                isActive: carJson['is_active'],
                createdBy: carJson['created_by'],
                attachments: (carJson['attachments'] as List<dynamic>)
                    .map<Attachment>((attachmentJson) {
                  final List<String> attachmentUrls =
                      (attachmentJson['attachment_url'] as List<dynamic>)
                          .map<String>((urlJson) => urlJson['url'].toString())
                          .toList();
                  return Attachment(
                    attachmentType: attachmentJson['attachment_type'],
                    attachmentUrls: attachmentUrls,
                  );
                }).toList(),
              ))
          .toList();

      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
