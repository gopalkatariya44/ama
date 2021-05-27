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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: kIsWeb
                ? Image.network(widget.saree!.imageUrl)
                : Image.file(
                    File(widget.saree!.imageUrl),
                  ),
          ),
          Text(
            "Total Prices : " +
                (widget.saree!.size + widget.saree!.price).toString(),
          ),
        ],
      ),
    );
  }
}
