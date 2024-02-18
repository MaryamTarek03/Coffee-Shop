import 'package:coffee_shop/Screens/Order/Components/order_item.dart';
import 'package:flutter/material.dart';

import 'Components/list_of_orders.dart';
import 'grid_item_placeholder.dart';
import 'order_home.dart';

class TestingWidget extends StatelessWidget {
  const TestingWidget({super.key, required this.onPressed});

  final void Function(List<Widget>) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //TODO: ADD THIS FUNCTION AND ITS PARAMETER TO GRID ITEM
      onPressed: () {
        // orderedItemsList.add(OrderItem());
        onPressed(cart);
      },
      child: const Text('add Widget'),
    );
  }
}

class TestNavigation extends StatelessWidget {
  const TestNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GridPlaceholder(
              onPressed: (List) {},
            ),
            GridPlaceholder(
              onPressed: (List) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderHome(
                      updateIndex: (int) {},
                    ),
                  ),
                );
              },
              child: const Text('GO TO'),
            ),
          ],
        ),
      ),
    );
  }
}
