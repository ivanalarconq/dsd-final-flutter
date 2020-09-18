import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pago_servicios/widgets/cards/operation_card.dart';
import 'package:pago_servicios/widgets/lists/companies_list_widget.dart';
import '../../models/operation.dart';

class OperationsListWidget extends StatefulWidget {
  @override
  _OperationsListWidgetState createState() => _OperationsListWidgetState();
}

class _OperationsListWidgetState extends State<OperationsListWidget> {
  List<Operation> operations;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (operations == null) {
      operations = List<Operation>();
      getData();
    }
    return operationsListItems();
  }

  void getData() {
    operations.add(Operation("Pago de servicios", FontAwesomeIcons.lightbulb,
        CompaniesListWidget()));
    operations.add(Operation("Pago a institución o empresa",
        FontAwesomeIcons.building, CompaniesListWidget()));
    operations.add(Operation("Pago SUNAT NPS", FontAwesomeIcons.cashRegister,
        CompaniesListWidget()));
    operations.add(Operation("Pago de tarjetas de crédito",
        FontAwesomeIcons.creditCard, CompaniesListWidget()));
    operations.add(Operation("Recarga de celular", FontAwesomeIcons.mobileAlt,
        CompaniesListWidget()));
    operations.add(Operation("Recarga de Billetera Móvil",
        FontAwesomeIcons.calculator, CompaniesListWidget()));

    count = operations.length;
  }

  ListView operationsListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return OperationCard(
          operation: this.operations[position],
        );
      },
    );
  }
}
