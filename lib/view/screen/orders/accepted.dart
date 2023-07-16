import 'package:exfai/controller/orders/accepted_controller.dart';
import 'package:exfai/view/widget/orders/orderlistcardaccepted.dart';

import '../../../all_export.dart';


class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrdersAcceptedController>(
              builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersListAccepted(listdata: controller.data[index])),
                  )))),
        );
  }
}
