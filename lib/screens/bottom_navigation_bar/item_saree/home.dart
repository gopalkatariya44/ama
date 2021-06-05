import 'package:ama/modal/sarees/sareeschanger.dart';
import 'package:ama/screens/bottom_navigation_bar/item_saree/item_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:io';

import 'addsaree.dart';

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
                itemCount: sareeProvider.sarees.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Items(index: index);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var sarees = Provider.of<SareesChanger?>(context);
    var sareeProvider = sarees!.sarees;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {},
        ),
        // IconSlideAction(
        //   caption: 'Share',
        //   color: Colors.indigo,
        //   icon: Icons.share,
        //   onTap: () {},
        // ),
      ],
      closeOnScroll: true,
      secondaryActions: <Widget>[
        // IconSlideAction(
        //   caption: 'More',
        //   color: Colors.black45,
        //   icon: Icons.more_horiz,
        //   onTap: () {},
        // ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => sarees.removeSaree(index),
        ),
      ],
      key: UniqueKey(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Color(0xFF4D1F7C),Color(0xFF241E30)
          //     ],
          //     ),
        ),
        child: ListTile(
          leading: GestureDetector(
            child: ClipOval(
              child: kIsWeb
                  ? Image.network(sareeProvider[index]!.imageUrl,
                      height: 50, width: 50, fit: BoxFit.cover)
                  : Image.file(
                      File(sareeProvider[index]!.imageUrl),
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
                        ? Image.network(sareeProvider[index]!.imageUrl)
                        : Image.file(
                            File(sareeProvider[index]!.imageUrl),
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
          title: Text(
            sareeProvider[index]!.title,
          ),
          subtitle: Row(
            children: [
              Text(
                "${DateFormat.yMMMd('en_IN').format(sareeProvider[index]!.date)}",
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Qty: " + sareeProvider[index]!.size.toString(),
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
              SizedBox(height: 3),
              Text(
                "Rs: \u{20B9} " + sareeProvider[index]!.price.toString(),
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ItemDetails(
                  saree: sareeProvider[index],
                ),
              ),
            );
            Tooltip(message: 'tap to Detail');
          },
        ),
      ),
    );
  }
}
