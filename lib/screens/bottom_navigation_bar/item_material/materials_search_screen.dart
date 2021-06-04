import 'package:ama/screens/screens.dart';
import 'package:flutter/material.dart';
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
      itemBuilder: (ctx, index) => ListTile(
        title: Text(material!.materials[index]!.title)
      ),
    );
  }
}
