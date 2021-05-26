import 'package:ama/modal/sareeschanger.dart';
import 'package:ama/screens/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sareeProvider = Provider.of<SareesChanger?>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (sareeProvider == null) CircularProgressIndicator(),
          if (sareeProvider!.sarees.isEmpty)
            Container(
              child: Center(child: Text("No Sarees please add some")),
            ),
          if (sareeProvider.sarees.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: GestureDetector(
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.file(
                            File(sareeProvider.sarees[index]!.imageUrl),
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
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
                              child: Image.file(
                                File(sareeProvider.sarees[index]!.imageUrl),
                                // cacheHeight: 350,
                                cacheWidth: 300,
                              ),
                            ),
                          ),
                        )..show();
                      },
                    ),
                    title: Text(
                      sareeProvider.sarees[index]!.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          sareeProvider.sarees[index]!.description,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Qty: " +
                              sareeProvider.sarees[index]!.size.toString(),
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Rate: \u{20B9} " +
                              sareeProvider.sarees[index]!.price.toString(),
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(),
                        ),
                      );
                    },
                  );
                },
                itemCount: sareeProvider.sarees.length,
              ),
            ),
        ],
      ),
    );
  }
}
