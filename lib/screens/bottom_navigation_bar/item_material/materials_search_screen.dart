import 'dart:io';

import 'package:ama/screens/screens.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MaterialSearchScreen extends SearchDelegate {
  MaterialsChanger? material;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    material = Provider.of<MaterialsChanger?>(context);

    return ListView.builder(
      itemCount: material!.materials.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
        child: Container(
          
          child: ListTile(
            leading: GestureDetector(
              child: ClipOval(
                child: kIsWeb
                    ? Image.network(material!.materials[index]!.imageUrl,
                        height: 50, width: 50, fit: BoxFit.cover)
                    : Image.file(
                        File(material!.materials[index]!.imageUrl),
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
                            ? Image.network(material!.materials[index]!.imageUrl)
                            : Image.file(
                                File(material!.materials[index]!.imageUrl),
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
              material!.materials[index]!.title,
            ),
            subtitle: Row(
              children: [
                Text(
                  DateFormat.yMMMd('en_IN')
                      .format(material!.materials[index]!.date),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Qty: " + material!.materials[index]!.size.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Rate: \u{20B9} " + material!.materials[index]!.price.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
