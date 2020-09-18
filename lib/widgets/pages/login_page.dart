import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pago_servicios/masked_text_input_formatter.dart';
import 'package:pago_servicios/models/login.dart';
import 'package:pago_servicios/state/client_state.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClientState>(
      create: (_) => ClientState(),
      child: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clientState = Provider.of<ClientState>(context);
    TextEditingController dniController = TextEditingController();
    TextEditingController creditCardController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final account = TextFormField(
      inputFormatters: [
        MaskedTextInputFormatter(
          mask: 'xxxx-xxxx-xxxx-xxxx',
          separator: '-',
        ),
      ],
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: creditCardController,
      decoration: InputDecoration(
        hintText: 'N° de tarjeta',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
        prefixIcon: Icon(FontAwesomeIcons.creditCard),
      ),
    );

    final dni = TextFormField(
      maxLength: 7,
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: dniController,
      decoration: InputDecoration(
        hintText: 'DNI',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
        prefixIcon: Icon(FontAwesomeIcons.user),
        counterText: "",
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Clave web',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
        prefixIcon: Icon(FontAwesomeIcons.lock),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        color: Colors.lightGreen,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          clientState.login(
              Login(
                  int.parse(dniController.text),
                  int.parse(creditCardController.text
                      .replaceAll(new RegExp(r'-'), '')),
                  passwordController.text),
              context);
        },
        padding: EdgeInsets.all(12),
        child: Text('Ingresar'),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 100.0),
            account,
            SizedBox(height: 8.0),
            dni,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.cyan,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          print("value " + value.toString());
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Registro'),
            icon: Icon(FontAwesomeIcons.userPlus),
          ),
          BottomNavigationBarItem(
            title: Text('Contacto'),
            icon: Icon(FontAwesomeIcons.headphones),
          ),
          BottomNavigationBarItem(
            title: Text('Ubicanos'),
            icon: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
