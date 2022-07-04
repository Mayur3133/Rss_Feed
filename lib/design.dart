import 'package:feed/conroller/list%20controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api.dart';

class resp extends StatefulWidget {
  const resp({Key? key}) : super(key: key);

  @override
  State<resp> createState() => _respState();
}

class _respState extends State<resp> {
  final cntrl = Get.put(typecontroller());
  final apiresponse = Get.put(api());

  @override
  void initState() {
    apiresponse.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Result")),
      body: Container(
        child: Obx(
          () => cntrl.responsedata.length != 0
              ? GridView.builder(
                  // primary: false,
                  padding: const EdgeInsets.all(7),
                  // crossAxisSpacing: 10,
                  // mainAxisSpacing: 10,
                  // childAspectRatio: 3 / 3.5,
                  // maxCrossAxisExtent: 180.0,

                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10/12,
                      crossAxisSpacing: 10),
                  itemCount: cntrl.responsedata.length,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                      cntrl.responsedata[index].artworkUrl100),
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 2),
                            child: Text(
                              cntrl.responsedata[index].name,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 3),
                            child: Text(
                              cntrl.responsedata[index].artistName,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
