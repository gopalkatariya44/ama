import 'package:ama/modal/sareeschanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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
                      child: Image.asset(
                        //Replace with user Image
                        sareeProvider.sarees[index]!.imageUrl,
                        // 'assets/images/as.png',
                        fit: BoxFit.cover,
                        cacheHeight: 60,
                        cacheWidth: 60,
                      ),
                      onTap: () {
                        AwesomeDialog(
                          width: 500,
                          dialogType: DialogType.NO_HEADER,
                          headerAnimationLoop: false,
                          context: context,
                          body: Container(
                            child: Image.asset(
                              //Replace with user Image
                              // sareeProvider.sarees[index]!.imageUrl,
                              'assets/images/as.png',
                              fit: BoxFit.cover,
                              cacheHeight: 60,
                              cacheWidth: 60,
                            ),
                          ),
                        )..show();
                      },
                    ),
                    title: Text(
                      sareeProvider.sarees[index]!.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        Text(sareeProvider.sarees[index]!.description),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          sareeProvider.sarees[index]!.size.toString(),
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "\u{20B9} " +
                              sareeProvider.sarees[index]!.price.toString(),
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    onTap: () {},
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
