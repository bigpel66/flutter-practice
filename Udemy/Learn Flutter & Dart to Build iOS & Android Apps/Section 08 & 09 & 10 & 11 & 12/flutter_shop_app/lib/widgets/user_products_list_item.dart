import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';

class UserProductsListItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductsListItem({
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                },
                color: Theme.of(context).primaryColor),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
                color: Theme.of(context).errorColor),
          ],
        ),
      ),
    );
  }
}
