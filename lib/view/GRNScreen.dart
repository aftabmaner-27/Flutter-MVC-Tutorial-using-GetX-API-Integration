import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/GRNListController.dart';


class GRNScreen extends StatefulWidget {
  @override
  State<GRNScreen> createState() => _GRNScreenState();
}


class _GRNScreenState extends State<GRNScreen> {
  final GRNListController controller = Get.put(GRNListController());


  @override
  void initState() {
    super.initState();
    controller.fetchGRNListDetails(wrid: 1, userid: 1, custid: 1, skey: '-');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('GRN List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Obx(() {
        if (controller.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
            itemCount: controller.grnList.length,
            itemBuilder: (context, index) {
              var grnItem = controller.grnList[index];
              return
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(

                          children: [
                            Text(
                              'Order No.:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              grnItem.propertyName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(

                          children: [
                            Text(
                              'Object:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              grnItem.propertyValue,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );



              //   ListTile(
              //   title: Text(grnItem.propertyName),
              //   subtitle: Text(grnItem.propertyValue),
              // );
            },
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call API to fetch data
          controller.fetchGRNListDetails(wrid: 1, userid: 1, custid: 1, skey: '-');
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
