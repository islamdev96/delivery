import '../../../all_export.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy.parseFromDateTime(
                      listdata.ordersDatetime! as DateTime,
                    ).fromNow(),
                    style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(),
              
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
             
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == "2")
                    MaterialButton(
                      onPressed: () {
                       controller.approveOrders(listdata.ordersUsersid!, listdata.ordersId!) ;
                       // controller.deleteOrder(listdata.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: const Text("Approve"),
                    ),
                     
                ],
              ),
            ],
          )),
    );
  }
}
