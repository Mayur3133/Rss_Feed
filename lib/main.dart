import 'package:feed/design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api.dart';
import 'conroller/list controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Demo",
      home: feed(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class feed extends StatefulWidget {
  const feed({Key? key}) : super(key: key);

  @override
  State<feed> createState() => _feedState();
}

class _feedState extends State<feed> {
  // typecontroller TypeController = typecontroller();
  typecontroller rss = Get.put(typecontroller());
  final apiresponse = Get.put(api());
  //
  // countrycontroller CountryController = countrycontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Demo")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("• MediaType",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Obx(
                () => Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: rss.selectedMediaType.value,
                      items: rss.mediaTypes
                          .map((e) => DropdownMenuItem(
                                child: Text(e['name']),
                                value: e['name'],
                              ))
                          .toList(),
                      onChanged: (v) {
                        rss.selectedMediaType.value = v.toString();
                        rss.selectNewMedia(v.toString());

                        print(rss.typeList);
                        setState(() {});
                        // apiresponse.getData();
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("• Type",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Obx(
                () => Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: rss.selectedType.value,
                      items: rss.typeList.value
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (v) {
                        rss.selectedType.value = v.toString();
                        setState(() {});
                        // apiresponse.getData();
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("• Country",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Obx(
                () => Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: rss.selectedcntry.value,
                      items: rss.cntry.keys
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (v) {
                        rss.selectedcntry.value = v.toString();
                        setState(() {});
                        // apiresponse.getData();
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("• Feed",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Obx(
                () => Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: rss.selectedfeed.value,
                      items: rss.feedList.value.keys
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (v) {
                        rss.selectedfeed.value = v.toString();
                        setState(() {});
                        // apiresponse.getData();
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("• Limit",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Obx(
                () => Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: rss.selectedItemCount.value,
                      items: rss.showItemsonpageList
                          .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                          .toList(),
                      onChanged: (v) {
                        rss.selectedItemCount.value = v.toString();
                        setState(() {});
                        // apiresponse.getData();
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(resp());
                    // apiresponse.getData();
                  },
                  child: Text("Apply"))
            ],
          ),
        ),
      ),
    );
  }
}
