import 'dart:io';

import 'package:ama/modal/sarees/sarees.dart';
import 'package:ama/modal/sarees/sareeschanger.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_bar/item_saree/item_details.dart';

class SearchBar extends SearchDelegate {
  SareesChanger? saree;
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
    saree = Provider.of<SareesChanger?>(context);
    return ListView.builder(
      itemCount: saree!.sarees.length,
      itemBuilder: (ctx, index) => Padding(
        
        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF241E30), Color(0xFF4D1F7C)])),
          child: ListTile(
            leading: GestureDetector(
              child: ClipOval(
                child: kIsWeb
                    ? Image.network(saree!.sarees[index]!.imageUrl,
                        height: 50, width: 50, fit: BoxFit.cover)
                    : Image.file(
                        File(saree!.sarees[index]!.imageUrl),
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
                          ? Image.network(saree!.sarees[index]!.imageUrl)
                          : Image.file(
                              File(saree!.sarees[index]!.imageUrl),
                              // cacheHeight: 350,
                              cacheWidth: 300,
                              cacheHeight: 300,
                            ),
                    ),
                  ),
                  width: 600,
                )..show();
                Tooltip(message: "tap to show images Preview");
              },
            ),
            title: Text(saree!.sarees[index]!.title),
            subtitle: Text(
              "${DateFormat.yMMMd('en_IN').format(saree!.sarees[index]!.date)}",
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Qty: " + saree!.sarees[index]!.size.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Rs: \u{20B9} " + saree!.sarees[index]!.price.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDetails(saree: saree!.sarees[index]),
                ),
              );
              Tooltip(message: 'tap to Detail');
            },
          ),
        ),
      ),
    );
  }
}
