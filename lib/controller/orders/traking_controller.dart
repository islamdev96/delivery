// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exfai/all_export.dart';
import 'package:exfai/controller/orders/accepted_controller.dart';

import 'package:exfai/core/functions/getdecodepolyline.dart';

class TrackingController extends GetxController {
  Set<Polyline> polylineSet = {};
  MyServices myServices = Get.find();
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gnc;
  Timer? timer;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  OrdersAcceptedController ordersAcceptedController = Get.find();
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currentlong;

  donedelivery() async {
    statusRequest = StatusRequest.loading;

    update();
    await ordersAcceptedController.doneDelivery(
        ordersModel.ordersId!, ordersModel.ordersUsersid!);
    Get.offAllNamed(AppRoute.homepage);
  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("=========================Current Position");
      if (gnc != null) {
        gnc!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }

      markers.removeWhere((element) => element.markerId.value == "current");

      markers.add(Marker(
          markerId: const MarkerId("current"),
          position: LatLng(position!.latitude, position.longitude)));
      update();
    });
  }

  refreshLocation() async {
    await Future.delayed(const Duration(seconds: 2));
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId)
          .set({
        "lat": currentlat,
        "long": currentlong,
        "deliveryid": myServices.sharedPreferences.getString("id")
      });
    });
  }

  initPolyline() async {
    destlat = double.parse(ordersModel.addressLat!);
    destlong = double.parse(ordersModel.addressLong!);
    await Future.delayed(const Duration(seconds: 1));
    polylineSet = await getPolyLine(currentlat, currentlong, destlat, destlong);
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];

    getCurrentLocation();
    refreshLocation();

    initPolyline();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    gnc!.dispose();
    timer!.cancel();

    super.onClose();
  }
}
