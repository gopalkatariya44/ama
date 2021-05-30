import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ama/modal/materials.dart';
import 'package:ama/modal/materialschanger.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddMaterialScreen extends StatefulWidget {
  @override
  _AddMaterialScreenState createState() => _AddMaterialScreenState();
}

enum imageInputType {
  camera,
  gallery,
}

class _AddMaterialScreenState extends State<AddMaterialScreen> {
  imageInputType value = imageInputType.camera;
  late MaterialsChanger? materialsChanger;
  String? title;
  double? price;
  String? imageUrl;
  double? size;
  String? description;
  Uint8List? networkFile;
  DateTime? date;

  final format = DateFormat("yyyy-MM-dd");
  final key = GlobalKey<FormState>();

  PickedFile? imagePicker;
  bool imagePickedFromFile = false, imagePickedFromWeb = false;
  final picker = ImagePicker();

  void startImagePicker() async {
    if (!kIsWeb) {
      await showDialog(
          context: context,
          builder: (ctx) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      value = imageInputType.camera;
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(width: 5),
                        Text("Camera".toUpperCase()),
                      ],
                    ),
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () {
                      value = imageInputType.gallery;
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 5),
                        Text("Gallery".toUpperCase()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }
    switch (value) {
      case imageInputType.camera:
        imagePicker = await picker.getImage(
          source: ImageSource.camera,
          imageQuality: 7,
        );
        break;
      case imageInputType.gallery:
        imagePicker = await picker.getImage(
          source: ImageSource.gallery,
          imageQuality: 7,
        );
        break;
      default:
        imagePicker = await picker.getImage(
          source: ImageSource.gallery,
          imageQuality: 7,
        );
    }

    if (imagePicker != null) {
      if (kIsWeb) networkFile = await imagePicker!.readAsBytes();
      setState(() {
        imagePickedFromFile = true;
      });
    }
  }

  void onSave() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();

      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Confirm"),
          content: Text("Are you sure you want to add the Material"),
          actions: [
            TextButton(
              onPressed: () async {
                materialsChanger!.addMaterial(
                  new Materials(
                    date: date!,
                    description: description!,
                    imageUrl: imagePicker!.path,
                    price: price!,
                    size: size!,
                    title: title!,
                  ),
                );
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                "ADD",
              ),
            ),
            TextButton(
              onPressed: () {
                return Navigator.of(context).pop(false);
              },
              child: Text(
                "NO",
              ),
            ),
          ],
        ),
      );
    }
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    materialsChanger = Provider.of<MaterialsChanger?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Material"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: key,
          child: ListView(
            children: [
              Container(
                color: Colors.grey,
                height: 200,
                width: 200,
                child: imagePickedFromFile
                    ? kIsWeb
                        ? Image.memory(networkFile!)
                        : Image.file(File(imagePicker!.path))
                    : Center(
                        child: Icon(
                          Icons.image,
                          size: 150,
                        ),
                      ),
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                  onPressed: startImagePicker,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pick Image",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: UniqueKey(),
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  hintText: "Enter Material Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name of Material";
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: "Price",
                  hintText: "Enter Price of Material",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter price of Material";
                  }
                  return null;
                },
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: "Quantity",
                  hintText: "Enter Quantity of Material",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the Number of Material";
                  }
                  return null;
                },
                onSaved: (value) {
                  size = double.parse(value!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DateTimeField(
                decoration: InputDecoration(
                  labelText: "Date",
                  border: OutlineInputBorder(),
                  hintText: "Enter date",
                ),
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
                onSaved: (value) {
                  date = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Enter Description here",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  description = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                    onPressed: () => onSave(),
                    child: Text(
                      "Add Material",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
