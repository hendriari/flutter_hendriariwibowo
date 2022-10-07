import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:praktik/model/contact_model.dart';
import 'package:praktik/model/list_contact.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final ContactModel contact = contacts[index];
              return Card(
                margin: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: contact.image!,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Center(
                        child: Text(
                          'Can\'t load image',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      contact.name!,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}
