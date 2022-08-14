import 'package:carmel_bakeryy/models/widgets/AnimatedAvailableProduct.dart';
import 'package:flutter/material.dart';

import 'AnimatedUnavailableProduct.dart';

class OfferWidgetModel extends StatelessWidget {
  const OfferWidgetModel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 167, 81, 11),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/carmel-bakery-customerapp.appspot.com/o/image1.jpeg?alt=media&token=89d74a9d-b38a-4b20-b606-61f8d5182c56'),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text('nazwa'),
          Spacer(),
          Text('cena'),
          //AnimatedAvailableProduct(),
          AnimatedUnavailableProduct()
        ],
      ),
    );
  }
}
