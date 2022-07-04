import 'dart:convert';

import 'package:feed/conroller/list%20controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'midal.dart';

class api extends GetxController {
  final typecontroller apiControl = Get.put(typecontroller());

  List<model> feedFromJson(String str) =>
      List<model>.from(json.decode(str).map((x) => model.fromJson(x)));

  String feedToJson(List<model> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

  Future<model?> getData() async {
    // print(response.statusCode);
    apiControl.responsedata.clear();
    apiControl.responsedata.refresh();

    final country = apiControl.cntry[apiControl.selectedcntry.value];
    final feed = apiControl.feedList[apiControl.selectedfeed.value];

    print(
        "https://rss.applemarketingtools.com/api/v2/${country}/${apiControl.selectedMediaType.value.toLowerCase().replaceAll(" ", "-")}/${feed}/${apiControl.selectedItemCount.value}/${apiControl.selectedType.value.toLowerCase().replaceAll(" ", "-")}.json");

    try {
      var response = await http.get(
        Uri.parse(
            "https://rss.applemarketingtools.com/api/v2/${country}/${apiControl.selectedMediaType.value.toLowerCase().replaceAll(" ", "-")}/${feed}/${apiControl.selectedItemCount.value}/${apiControl.selectedType.value.toLowerCase().replaceAll(" ", "-")}.json"),
      );

      // print(response.statusCode);
      // feed = json.decode(response.body);
      // print(feed);
      // print( json.decode(response.body)["feed"]['results']);

      if (response.statusCode == 200) {
        print(apiControl.responsedata);
        final _a = List.from(json.decode(response.body)["feed"]['results']);
        _a.forEach((element) {
          apiControl.responsedata.add(Results.fromJson(element));
          apiControl.responsedata.refresh();
        });

        print(apiControl.responsedata);

        model abc = model.fromJson(jsonDecode(response.body));
        return abc;
      }
    } catch (e) {
      model data = model();
      return data;

      print(e);
    }
  }
}
