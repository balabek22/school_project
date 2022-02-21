import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:school_project/DataModel.dart';
import 'package:school_project/data_page.dart';

class DataController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbx_-h-wrINft1p5rnj4peBnz-Ut6-nhRwFndnaZnQ/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      DataModel dataModel, void Function(String) callback) async {
    try {
      await http.post(Uri.parse(URL), body: dataModel.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url.toString())).then((response) {
            callback(jsonDecode(response.body)['status']);
          });
        } else {
          callback(jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  /// Async function which loads feedback from endpoint URL and returns List.
  Future<List<DataModel>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => DataModel.fromJson(json)).toList();
    });
  }
}