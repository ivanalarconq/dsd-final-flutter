import 'package:flutter/material.dart';
import 'package:pago_servicios/widgets/cards/product_card.dart';
import '../../models/product.dart';

class ProductsListWidget extends StatefulWidget {
  @override
  _ProductsListWidgetState createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  List<Product> products;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      products = List<Product>();
      getData();
    }
    return productsListItems();
  }

  void getData() {
    products.add(Product(
        "Tarjeta de crédito adicional",
        "Comparte con quien quieras un monto asignado por ti",
        Colors.green,
        'assets/bg1.png'));
    products.add(Product(
        "Adelando te sueldo",
        "¡Te damos hasta un 35% de tu sueldo!",
        Colors.orange,
        'assets/bg2.png'));
    products.add(Product(
        "Cuentas de ahorro",
        "Descubre nuestras cuentas de ahorro y elige la que prefieras para cumplir tus metas.",
        Colors.indigoAccent[100],
        'assets/bg3.png'));
    products.add(Product(
        "Visa Premia",
        "Los mejores beneficios con tu tarjeta.",
        Colors.green,
        'assets/bg1.png'));
    products.add(Product(
        "Depósito a plazo",
        "Descubre la mejor manera de ahorrar ganando intereses.",
        Colors.green,
        'assets/bg1.png'));
    products.add(Product(
        "Pago automático",
        "¡Afiliate gratis y olvídate de las fechas de pago!",
        Colors.green,
        'assets/bg1.png'));
    count = products.length;
  }

  ListView productsListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return ProductCard(
          title: this.products[position].title,
          description: this.products[position].description,
          color: this.products[position].color,
          bg: this.products[position].bg,
        );
      },
    );
  }
}
