import 'package:ama/modal/sareeschanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Center(
                child: Container(
                    height: 40, child: Text("No Sarees please add some"))),
          if (sareeProvider.sarees.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: Image.asset(
                      sareeProvider.sarees[index]!.imageUrl,
                      fit: BoxFit.cover,
                      cacheHeight: 60,
                      cacheWidth: 60,
                    ),
                    title: Text(
                      sareeProvider.sarees[index]!.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(sareeProvider.sarees[index]!.description),
                    trailing: Text("data"),
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
