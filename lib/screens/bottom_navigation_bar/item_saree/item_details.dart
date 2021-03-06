import 'dart:io';
import 'package:ama/modal/sarees/sarees.dart';
import 'package:ama/screens/bottom_navigation_bar/item_saree/sarees_distribution/sarees_distribution.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDetails extends StatefulWidget {
  Sarees? saree;

  ItemDetails({required this.saree});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          // unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.green,
          tabs: [
            Tab(text: 'Details'),
            Tab(
              text: 'Distributes',
            )
          ],
        ),
        title: Text(widget.saree!.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Quantity",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(widget.saree!.size.toString(),
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Prices",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      "\u{20B9} " +
                                          widget.saree!.price.toString(),
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Prices",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              GestureDetector(
                                child: Text(
                                    "\u{20B9} " +
                                        (widget.saree!.size *
                                                widget.saree!.price)
                                            .toString() +
                                        "  ( Quantity x Prices )",
                                    style: TextStyle(color: Colors.green)),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Description",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                widget.saree!.description!.isEmpty
                                    ? Text("No Description")
                                    : Text(
                                        widget.saree!.description.toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SareesDistribution(
                size: widget.saree!.size,
                prise: widget.saree!.price,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
