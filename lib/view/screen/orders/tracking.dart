// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable

import 'package:exfai/controller/orders/traking_controller.dart';

import '../../../all_export.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Tracking'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: GoogleMap(
                        polylines: controller.polylineSet,
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.gnc = controllermap;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      minWidth: 300,
                      color: AppColor.primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        controller.donedelivery();
                      },
                      child: Text("The Order Has been deliverd "),
                    ),
                  )
                ])))),
      ),
    );
  }
}
