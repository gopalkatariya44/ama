import 'dart:io';

import 'package:ama/modal/sarees.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDetails extends StatefulWidget {
  Sarees? saree;

  ItemDetails({required this.saree});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.saree!.title),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: kIsWeb
                    ? Image.network(widget.saree!.imageUrl)
                    : Image.file(
                        File(widget.saree!.imageUrl),
                      ),
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Quantity",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.saree!.size.toString()),
                            ],
                          ),
                        ),
                        SizedBox(width: 100),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Prices",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                  "\u{20B9} " + widget.saree!.price.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Prices",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          GestureDetector(
                            child: Text("\u{20B9} " +
                                (widget.saree!.size * widget.saree!.price)
                                    .toString() +
                                " (Quantity x Prices)"),
                            onTap: () {
                              Tooltip(
                                  message: widget.saree!.size.toString() +
                                      " x " +
                                      widget.saree!.price.toString());
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.saree!.description.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
