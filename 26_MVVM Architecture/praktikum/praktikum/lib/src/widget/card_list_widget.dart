import 'package:flutter/material.dart';
import 'package:praktikum/src/model/contact_model.dart';
import 'package:praktikum/src/utils/dialog.dart';

class ItemCardWidget extends StatelessWidget {
  final ContactModel contact;
  final Function() onPressed;

  const ItemCardWidget({
    Key? key,
    required this.contact,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _deleteContact(context);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.account_circle,
              size: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  contact.number,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _deleteContact(context) async {
    return deleteContact(
      context,
        '${contact.name} ?',
        onPressed : onPressed,
    );
  }
}
