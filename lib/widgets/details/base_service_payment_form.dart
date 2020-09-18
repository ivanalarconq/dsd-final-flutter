import 'package:flutter/material.dart';
import 'package:pago_servicios/models/company.dart';
import 'package:pago_servicios/models/service.dart';

class BaseServicePaymentWidget extends StatefulWidget {
  final Company company;

  const BaseServicePaymentWidget({Key key, this.company}) : super(key: key);

  @override
  _BaseServicePaymentWidgetState createState() =>
      _BaseServicePaymentWidgetState(company);
}

class _BaseServicePaymentWidgetState extends State<BaseServicePaymentWidget> {
  final Company company;
  _BaseServicePaymentWidgetState(this.company);

  //List<Service> services;
  Service servicioSeleccionado;
  int count = 0;
  String currentIdentifier = "DNI";

  @override
  Widget build(BuildContext context) {
    /*if (services == null) {
      services = List<Service>();
      getServices();
    }*/

    //return productsListItems();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de la cuenta"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
          Text(
            "Institución o empresa",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            autofocus: false,
            initialValue: company.name,
            enabled: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
          Text(
            "Servicio",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          DropdownButton<Service>(
            hint: new Text("Seleccione un servicio"),
            value: servicioSeleccionado,
            items: company.services.map((Service service) {
              return DropdownMenuItem<Service>(
                value: service,
                child: Text(service.name),
              );
            }).toList(),
            onChanged: (value) {
              onChangeService(value);
            },
          ),
          Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
          Text(
            currentIdentifier,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: currentIdentifier,
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
              counterText: "",
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0)),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                padding: EdgeInsets.all(12),
                child: Text("Pagar"),
                color: Colors.green,
                onPressed: () {},
              ),
            ),
          )
        ],
      )),
    );
  }

  void getServices() {
    /*final pacientesFuture = pacienteRepository.getList();
    pacientesFuture.then((pacienteList) {
      setState(() {
        pacientes = pacienteList;
      });
    });*/
    //services =
  }

  void onChangeService(Service service) {
    //hospitalizacion.idPaciente = paciente.id;
    setState(() {
      currentIdentifier = service.identifierDescription;
      servicioSeleccionado = service;
    });
  }
}
