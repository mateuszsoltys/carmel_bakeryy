import 'package:carmel_bakeryy/models/data/OfferDataModel.dart';
import 'package:flutter/material.dart';
import 'AnimatedAvailableProduct.dart';
import 'AnimatedUnavailableProduct.dart';

class OfferWidgetModel extends StatelessWidget {
  const OfferWidgetModel({Key? key, required this.offerDataModel})
      : super(key: key);

  final OfferDataModel offerDataModel;

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
              backgroundImage: NetworkImage(offerDataModel.Av_URL),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(offerDataModel.Name),
          Spacer(),
          Text(offerDataModel.Price),
          offerDataModel.Availability == true
              ? AnimatedAvailableProduct()
              : AnimatedUnavailableProduct(),
        ],
      ),
    );
  }
}
