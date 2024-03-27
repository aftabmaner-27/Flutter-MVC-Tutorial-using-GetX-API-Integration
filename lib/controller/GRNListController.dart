import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/GRNListDetails.dart';

class GRNListController extends GetxController {
  var grnList = [].obs;
  var isLoading = true.obs;

  void fetchGRNListDetails({required int wrid, required int userid, required int custid, required String skey}) async {
    try {
      isLoading(true);
      var response = await http.post(
        Uri.parse('http://49.50.83.120/WMSMobile2.2/api/staging/v1/MobileApi/GetGRNListDetails'),
        body: jsonEncode({'wrid': wrid, 'userid': userid, 'custid': custid, 'skey': skey}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        try {
          String mstatus = jsonResponse['Status'];
          String mstatuscode = jsonResponse['StatusCode'];
          Map<String, dynamic> responsemsg = jsonResponse['Result'];

          if (mstatus == "200") {
            final List<dynamic> jsonData = responsemsg['Table'];

            grnList.value = jsonData
                .map((data) => GRNListDetails.fromJson(data))
                .toList();

            /*  for (int i = 0; i < jsonData.length; i++) {
              Map<String, dynamic> jsonobject = responsemsg['Table'][i];
              String getID = jsonobject["ID"].toString();
              String getmOrderRefNo = jsonobject["OrderRefNo"];
              String getmClientName = jsonobject["ClientName"];
              String getmAddress = jsonobject["Address"];
              String getmOrderDate = jsonobject["OrderDate"];
              String getmexpOrderDate = jsonobject["expOrderDate"];
              String getmStatusID = jsonobject["StatusID"].toString();
              String getmStatusName = jsonobject["StatusName"];
              String getmShippingAddress = jsonobject["ShippingAddress"];
            }*/
          }
        }catch(e){
         print(e);

    }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } finally {
      isLoading(false);
    }
  }
}
