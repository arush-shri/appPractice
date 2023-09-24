import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amber,
        child: ListView(
          children: <Widget>[
            listItem(
              label: "Something",
              icon : Icons.ac_unit
            )
          ],
        ),
      ),
    );
  }

  Widget listItem({required String label, required IconData icon})
  {
    const color = Colors.white;
    const hoverColor = Colors.white60;
    return ListTile(
      leading: Icon(icon, color: color,),
      hoverColor: hoverColor,
      title: Text(label),
      onTap: (){},
    );
  }
}

