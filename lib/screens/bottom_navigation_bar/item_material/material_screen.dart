import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'addmaterials.dart';
import 'package:ama/modal/materials/materialschanger.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:io';

class MaterialScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    var materialProvider = Provider.of<MaterialsChanger?>(context);
    if (materialProvider!.materials.isEmpty)
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No materials please add some"),
            GestureDetector(
              child: Icon(
                Icons.add,
                size: 50,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddMaterialScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    return Column(
      children: [
        if (materialProvider == null) CircularProgressIndicator(),
        if (materialProvider.materials.isNotEmpty)
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        // gradient: LinearGradient(
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight,
                        //     colors: [Color(0xFF241E30), Color(0xFF4D1F7C)]),
                            ),
                    child: ListTile(
                      leading: GestureDetector(
                        child: ClipOval(
                          child: kIsWeb
                              ? Image.network(
                                  materialProvider.materials[index]!.imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover)
                              : Image.file(
                                  File(materialProvider
                                      .materials[index]!.imageUrl),
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        onTap: () {
                          AwesomeDialog(
                              dialogType: DialogType.NO_HEADER,
                              headerAnimationLoop: false,
                              context: context,
                              body: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 12),
                                child: Container(
                                  child: kIsWeb
                                      ? Image.network(materialProvider
                                          .materials[index]!.imageUrl)
                                      : Image.file(
                                          File(materialProvider
                                              .materials[index]!.imageUrl),
                                          // cacheHeight: 350,
                                          cacheWidth: 300,
                                          cacheHeight: 300,
                                        ),
                                ),
                              ),
                              width: 500)
                            ..show();
                          Tooltip(message: "tap to show images Preview");
                        },
                      ),
                      title: Text(
                        materialProvider.materials[index]!.title,
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            DateFormat.yMMMd('en_IN').format(materialProvider.materials[index]!.date),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Qty: " +
                                materialProvider.materials[index]!.size
                                    .toString(),
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Rate: \u{20B9} " +
                                materialProvider.materials[index]!.price
                                    .toString(),
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
              itemCount: materialProvider.materials.length,
            ),
          ),
      ],
    );
  }
}
