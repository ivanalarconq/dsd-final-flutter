import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String bg;
  ProductCard({@required this.title, this.description, this.color, this.bg});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(bg == null ? 'assets/bg1.png' : bg,
                fit: BoxFit.cover),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 10, 150, 10),
            title: Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              this.description,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      color: color,
    );
  }
}
