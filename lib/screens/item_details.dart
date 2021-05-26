import 'package:ama/modal/sareeschanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sareeProvider = Provider.of<SareesChanger?>(context);
    return Scaffold(
      body: Column(
        children: [
          if (sareeProvider == null) CircularProgressIndicator(),
          if (sareeProvider!.sarees.isEmpty)
            if (sareeProvider.sarees.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Text(
                            sareeProvider.sarees[index]!.title,
                            style: TextStyle(color:Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: sareeProvider.sarees.length,
                ),
              ),
        ],
      ),
      appBar: AppBar(
        title: Text(sareeProvider.sarees[0]!.title,),
      ),
    );
  }
}
