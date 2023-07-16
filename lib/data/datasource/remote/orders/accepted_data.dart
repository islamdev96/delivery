import '../../../../all_export.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {"id": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
   doneDelivery(String ordersid, String userid) async {
    var response = await crud.postData(AppLink.doneOrders, {"ordersid": ordersid,"userid":userid});
    return response.fold((l) => l, (r) => r);
  }


}
