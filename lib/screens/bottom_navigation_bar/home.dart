import 'package:ama/modal/sareeschanger.dart';
import 'package:ama/screens/item_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:io';

import '../addsaree.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sareeProvider = Provider.of<SareesChanger?>(context);
    if (sareeProvider!.sarees.isEmpty)
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Sarees please add some"),
            GestureDetector(
              child: Icon(
                Icons.add,
                size: 50,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddSareeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (sareeProvider == null) CircularProgressIndicator(),
          if (sareeProvider.sarees.isNotEmpty)
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      leading: GestureDetector(
                        child: ClipOval(
                          child: kIsWeb
                              ? Image.network(
                                  sareeProvider.sarees[index]!.imageUrl)
                              : Image.file(
                                  File(sareeProvider.sarees[index]!.imageUrl),
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
                                      ? Image.network(
                                          sareeProvider.sarees[index]!.imageUrl)
                                      : Image.file(
                                          File(sareeProvider
                                              .sarees[index]!.imageUrl),
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
                        sareeProvider.sarees[index]!.title,
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            sareeProvider.sarees[index]!.date.toString(),
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
                            builder: (context) => ItemDetails(
                              saree: sareeProvider.sarees[index],
                            ),
                          ),
                        );
                        Tooltip(message: 'tap to Detail');
                      },
                    ),
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
