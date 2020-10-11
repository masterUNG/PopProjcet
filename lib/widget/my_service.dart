import 'package:flutter/material.dart';
import 'package:poproject/widget/add_product.dart';
import 'package:poproject/widget/show_dimissable.dart';
import 'package:poproject/widget/show_product.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  Widget showWidget = ShowProduct();
  List<String> titles = ['Show List Firebase', 'Demo Add Product', 'Demo Dimissable'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[index]),
      ),
      body: showWidget,
      drawer: Drawer(
        child: Column(
          children: [
            buildUserAccountsDrawerHeader(),
            buildListTileListProduct(),
            buildListTileAddProduct(),
            buildListTileDimissable(),
          ],
        ),
      ),
    );
  }

  ListTile buildListTileListProduct() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          showWidget = ShowProduct();
          index = 0;
        });
      },
      subtitle: Text('Show All Product From Firebase'),
      title: Text(titles[0]),
      leading: Icon(
        Icons.list,
        size: 36,
      ),
    );
  }

  ListTile buildListTileAddProduct() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          showWidget = AddProduct();
          index = 1;
        });
      },
      subtitle: Text('Add Product To API'),
      title: Text(titles[1]),
      leading: Icon(
        Icons.add_box,
        size: 36,
      ),
    );
  }

   ListTile buildListTileDimissable() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          showWidget = ShowDimissable();
          index = 2;
        });
      },
      subtitle: Text('Show delete ListView by Dimiss'),
      title: Text(titles[2]),
      leading: Icon(
        Icons.delete,
        size: 36,
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/wall1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Color(0x00000000),
        backgroundImage: AssetImage('images/image.png'),
      ),
      accountName: Text('Name'),
      accountEmail: Text('Login'),
    );
  }
}
