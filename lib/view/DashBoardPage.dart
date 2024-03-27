import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashBordPage extends StatefulWidget {
  const DashBordPage({Key? key}) : super(key: key);

  @override
  State<DashBordPage> createState() => _DashBordPageState();
}

class _DashBordPageState extends State<DashBordPage> {

  final List<String> gridNames = ['GRN', 'QC', 'PutAway', 'Picking', 'OutQc', 'Pack', 'Dispatch','Transfer'];
  final List<IconData> gridIcons = [Icons.grain, Icons.qr_code, Icons.move_to_inbox, Icons.shopping_cart, Icons.assignment_turned_in, Icons.shopping_bag, Icons.local_shipping,Icons.transfer_within_a_station_rounded];


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Center(child: Text('DashBoard',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))),
        backgroundColor: Colors.lightBlue,
      ),

    body: GridView.count(
    crossAxisCount: 3,
    children: [
    GridItem('GRN', Icons.assignment, '/grn'),
    GridItem('QC', Icons.check, '/qc'),
    GridItem('Put Away', Icons.move_to_inbox, '/put_away'),
    GridItem('Picking', Icons.shopping_cart, '/picking'),
    GridItem('Out QC', Icons.assignment_turned_in, '/out_qc'),
    GridItem('Pack', Icons.shopping_bag, '/pack'),
    GridItem('Dispatch', Icons.local_shipping, '/dispatch'),
    ],
    )
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  GridItem(this.title, this.icon, this.route);

  @override
  Widget build(BuildContext context) {
    return
       Container(
         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
         child: InkWell(
          onTap: () {
            Get.toNamed(route);
          },
          child: Card(
            elevation: 10.0,
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30,color: Colors.white,),
                SizedBox(height: 10),
                Text(title, style: TextStyle(fontSize: 20,color: Colors.white)),
              ],
            ),
          ),
      ),
       );

  }
}
