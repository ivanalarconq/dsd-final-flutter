import 'package:flutter/material.dart';
import 'package:pago_servicios/models/company.dart';
import 'package:pago_servicios/models/service.dart';
import 'package:pago_servicios/widgets/cards/company_card.dart';

class CompaniesListWidget extends StatefulWidget {
  @override
  _CompaniesListWidgetState createState() => _CompaniesListWidgetState();
}

class _CompaniesListWidgetState extends State<CompaniesListWidget> {
  List<Company> companies;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (companies == null) {
      companies = List<Company>();
      getData();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Pago de servicios"),
      ),
      body: servicesListItems(),
    );
  }

  void getData() {
    //services.add(Company("BITEL"));
    //services.add(Company("CLARO"));
    //services.add(Company("DIRECTV"));
    //services.add(Company("ENEL"));
    //services.add(Company("Entel Peru"));
    //services.add(Company("Luz del Sur"));
    companies.add(Company("Movistar", <Service>[
      Service("Internet", "Número de teléfono fijo"),
      Service("Móviles", "Celular"),
      Service("Telefonía Fija", "Número de teléfono fijo"),
    ]));
    companies.add(Company("BITEL", <Service>[
      Service("Internet", "Número de teléfono fijo"),
      Service("Móviles", "Celular"),
      Service("Telefonía Fija", "Número de teléfono fijo"),
    ]));
    companies.add(Company("CLARO", <Service>[
      Service("Internet", "Número de teléfono fijo"),
      Service("Móviles", "Celular"),
      Service("Telefonía Fija", "Número de teléfono fijo"),
    ]));
    companies.add(Company("Entel Peru", <Service>[
      Service("Internet", "Número de teléfono fijo"),
      Service("Móviles", "Celular"),
      Service("Telefonía Fija", "Número de teléfono fijo"),
    ]));
    //services.add(Company("SEDAPAL"));
    count = companies.length;
  }

  ListView servicesListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return ServiceCard(
          company: this.companies[position],
        );
      },
    );
  }
}
