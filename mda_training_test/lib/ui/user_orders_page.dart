import "package:flutter/material.dart";
import "package:mda_training_test/models/user_order.dart";
import "package:mda_training_test/ui/user_order_card.dart";

class UserOrdersPage extends StatefulWidget {

  @override
  _UserOrdersPageState createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage>
    with SingleTickerProviderStateMixin<UserOrdersPage> {

  late TabController tabController;

  userOrderAction(
    BuildContext context,
    UserOrder userOrder,
    UserOrderStatus nextStatus,
  ) {
    setState(() {
      userOrder.orderStatus = nextStatus;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les commandes clients"),
        actions: [
          CircleAvatar(child: Icon(Icons.shopping_bag_outlined)),
          SizedBox(width: 10.0),
        ],
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              icon: const Icon(Icons.new_releases_outlined),
              child: Text(UserOrderStatus.initial.description),
            ),
            Tab(
              icon: const Icon(Icons.workspaces_outline),
              child: Text(UserOrderStatus.inProcess.description),
            ),
            Tab(
              icon: const Icon(Icons.check),
              child: Text(UserOrderStatus.ready.description),
            ),
            Tab(
              icon: const Icon(Icons.delivery_dining),
              child: Text(UserOrderStatus.inDelivery.description),
            ),
            Tab(
              icon: const Icon(Icons.thumb_up),
              child: Text(UserOrderStatus.delivered.description),
            ),
          ],
        ),
      ),
      body: buildTabContents(context),
    );
  }

  Widget buildTabContents(BuildContext context) {

    return TabBarView(
      controller: tabController,
      children: [
        buildOrderList(
          context,
          UserOrderStatus.initial,
          UserOrderStatus.inProcess.description,
          nextStatus: UserOrderStatus.inProcess,
        ),
        buildOrderList(
          context,
          UserOrderStatus.inProcess,
          UserOrderStatus.ready.description,
          nextStatus: UserOrderStatus.ready,
        ),
        buildOrderList(
          context,
          UserOrderStatus.ready,
          UserOrderStatus.inDelivery.description,
          nextStatus: UserOrderStatus.inDelivery,
        ),
        buildOrderList(
          context,
          UserOrderStatus.inDelivery,
          UserOrderStatus.delivered.description,
          nextStatus: UserOrderStatus.delivered,
        ),
        buildOrderList(context, UserOrderStatus.delivered, ""),
      ],
    );
  }

  Widget buildOrderList(
    BuildContext context,
    UserOrderStatus status,
    String actionLabel, {
    UserOrderStatus? nextStatus,
  }) {
    final _orders = orders
        .where(
          (order) => order.orderStatus == status,
        )
        .toList();

    return ListView.separated(
      itemCount: _orders.length,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      itemBuilder: (context, index) {
        final userOrder = _orders[index];
        return UserOrderCard(
          userOrder: userOrder,
          actionLabel: actionLabel,
          onAction: nextStatus == null
              ? null
              : () => userOrderAction(
                    context,
                    userOrder,
                    nextStatus,
                  ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 20.0),
    );
  }
}
