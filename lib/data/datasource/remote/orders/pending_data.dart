import '../../../../all_export.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }
approveOrders(String deliveryid,String userid,String orderid) async {
    var response = await crud.postData(AppLink.approveOrders, {"deliveryid" :deliveryid,"userid":userid,"ordersid":orderid});
    return response.fold((l) => l, (r) => r);
  }
}
