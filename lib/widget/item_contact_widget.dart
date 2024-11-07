import 'package:flutter/material.dart';
import 'package:learn_getx/models/contact_model.dart';
import 'package:learn_getx/untils/constant.dart';


class ItemContactWidget extends StatelessWidget {
  const ItemContactWidget({super.key, required this.contactModel});
  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        contactModel.name!.isNotEmpty && contactModel.name != null
            ?
        Text(contactModel.name.toString() ?? '', style: kContentStyle,)
            :
        Text(contactModel.numberPhone, style: kContentStyle,)

      ],
    );
  }
}
