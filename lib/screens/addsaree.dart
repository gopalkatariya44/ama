import 'dart:io';
import 'package:ama/modal/sarees.dart';
import 'package:ama/modal/sareeschanger.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddSareeScreen extends StatefulWidget {
  @override
  _AddSareeScreenState createState() => _AddSareeScreenState();
}

class _AddSareeScreenState extends State<AddSareeScreen> {
  late SareesChanger? sareesChanger;
  String? title;
  double? price;
  String? imageUrl;
  double? size;
  String? description;

  final key = GlobalKey<FormState>();
  PickedFile? imagePicker;
  bool imagePickedFromFile = false, imagePickedFromWeb = false;
  final picker = ImagePicker();

  void startImagePicker() async {
    imagePicker = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 7,
    );

    setState(() {
      imagePickedFromFile = true;
    });
  }
  

//EXAMPLE
  // _imgFromCamera() async {
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.camera, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  // _imgFromGallery() async {
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }

//EXAMPLE

  void onSave() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();

      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Confirm"),
          content: Text("Are you sure you want to add the product"),
          actions: [
            TextButton(
              onPressed: () async {
                sareesChanger!.addSaree(
                  new Sarees(
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
    sareesChanger = Provider.of<SareesChanger?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Saree"),
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
                    ? Image.file(File(imagePicker!.path))
                    : Center(
                        child: Icon(
                          Icons.camera,
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
                  hintText: "Enter Saree Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name of saree";
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
                  hintText: "Enter Price of Saree",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter price of saree";
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
                  hintText: "Enter Quantity of sarees",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the Number of saree";
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Enter Description here",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the description";
                  }
                  return null;
                },
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
                      "Add Saree",
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
