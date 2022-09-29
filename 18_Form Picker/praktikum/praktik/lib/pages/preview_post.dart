import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PreviewPost extends StatelessWidget {
  final FilePickerResult pickedResult;
  final File selectedFile;
  final Color pickerColor;
  final String selectedDate;
  final String caption;

  const PreviewPost({
    Key? key,
    required this.pickedResult,
    required this.selectedFile,
    required this.pickerColor,
    required this.selectedDate,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preview Post',
        ),
        backgroundColor: pickerColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: pickedResult.files.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10,5,10,0),
                          child: Container(
                            height: 260,
                            width: MediaQuery.of(context).size.width * .9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(3,4),
                                  color: Colors.black.withOpacity(.6),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedFile,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,8,10,5),
              child: Row(
                children: [
                  Text(selectedDate),
                  const Spacer(),
                  const Text('Color : '),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: pickerColor,
                      // borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(caption, textAlign: TextAlign.justify,),
            ),
          ],
        ),
      ),
    );
  }
}
