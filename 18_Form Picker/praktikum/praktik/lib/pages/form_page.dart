import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:praktik/pages/preview_post.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _captionController =
      TextEditingController(text: '');
  DateTime _datePublished = DateTime.now();
  Color _pickerColor = Colors.indigo;
  Color _pickedColor = Colors.white;
  FilePickerResult? _result;
  PlatformFile? _pickedFile;
  File? _selectedFile;

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
    _captionController.dispose();
  }

  void _onSubmited() {
    if (_result != null && _selectedFile != null) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) => PreviewPost(
              pickedResult: _result!,
              selectedFile: _selectedFile!,
              pickerColor: _pickerColor,
              selectedDate: _dateController.text,
              caption: _captionController.text),
          transitionDuration: const Duration(milliseconds: 1200),
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linearToEaseOut;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Field tidak boleh kosong !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Picker'),
        backgroundColor: _pickerColor,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// cover
              _buildCover(),

              /// date
              _buildDate(),

              /// color
              _buildColor(),

              /// caption
              _buildCaption(),

              ///button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pickerColor,
                ),
                onPressed: () {
                  _onSubmited();
                },
                child: const Text('Submit'),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///split cover
  Widget _buildCover() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cover',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: _pickerColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () async {
            _result = await FilePicker.platform.pickFiles(allowMultiple: true);

            if (_result == null) {
              statusPickFile('Load file dibatalkan');
            } else {
              statusPickFile('Load file berhasil');
              setState(() {});
              _pickedFile = _result!.files.first;
              _selectedFile = File(_pickedFile!.path.toString());
            }
          },
          child: Container(
            height: 57,
            width: double.infinity,
            decoration: BoxDecoration(
              color:
                  _selectedFile == null ? Colors.grey.shade400 : _pickerColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'Pilih file',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: _pickerColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: _selectedFile == null
              ? const Text(
                'Tidak ada file',
              )
              : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _result?.files.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(3, 4),
                              color: Colors.black.withOpacity(.6),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _selectedFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  /// message load file
  statusPickFile(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  /// split date
  Widget _buildDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Publish At',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _pickerColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
          controller: _dateController,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            label: const Text('Date'),
            labelStyle: TextStyle(
              fontSize: 16,
              color: _pickerColor,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(
              Icons.calendar_month_outlined,
              color: _pickerColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: _pickerColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: _pickerColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  /// date picker
  _selectDate(BuildContext context) async {
    var datePicked = await showDatePicker(
        context: context,
        initialDate: _datePublished,
        firstDate: DateTime(1999),
        lastDate: DateTime(2050),
        builder: (context, child) {
          return Theme(
            data: ThemeData(
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: _pickerColor,
                onPrimary: Colors.white,
                secondary: _pickerColor,
                onSecondary: _pickerColor,
                error: Colors.red,
                onError: Colors.redAccent,
                background: _pickedColor,
                onBackground: _pickerColor,
                surface: Colors.white,
                onSurface: _pickerColor,
              ),
            ),
            child: child!,
          );
        });

    if (datePicked != null) {
      setState(() {
        _datePublished = datePicked;
        _dateController.text = DateFormat('EEEE, d MMMM y').format(datePicked);
      });
    }
  }

  /// split color
  Widget _buildColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Theme',
          style: TextStyle(
            fontSize: 16,
            color: _pickerColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () {
            _selectColor(context);
          },
          child: Container(
            height: 57,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _pickerColor,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 18.5,
                  left: MediaQuery.of(context).size.width / 2 - 48,
                  child: Text(
                    'Select Color',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: _pickerColor,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 6.7,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _pickerColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  /// void select color
  void changeColor(Color color) {
    setState(() => _pickerColor = color);
  }

  /// select color
  _selectColor(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Select Color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() => _pickedColor = _pickerColor);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pickerColor,
                ),
                child: const Text('Got it'),
              ),
            ],
          );
        });
  }

  /// split caption
  Widget _buildCaption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Caption',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _pickerColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          maxLines: 7,
          minLines: 1,
          cursorColor: _pickerColor,
          controller: _captionController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: _pickerColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: _pickerColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
