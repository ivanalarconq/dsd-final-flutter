import 'package:flutter/material.dart';

class EntryDialog extends StatefulWidget {
  @override
  _EntryDialogState createState() => _EntryDialogState();
}

class _EntryDialogState extends State<EntryDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: const Text('Aviso'),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: new Column(
            children: <Widget>[
              Image.asset(
                'assets/plin.png',
                width: 200,
                height: 135,
              ),
              Text(
                '¡Flutter Bank te presenta a Flin!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'La nueva funcionalidad de Flutter Bank para enviar dinero con número de celular de forma inmediata y gratis.',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 350,
                child: FlatButton(
                  onPressed: () {
                    print('holi');
                  },
                  child: Text('Enlazarme a Flint',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 350,
                child: FlatButton(
                  onPressed: () {
                    print('holi');
                  },
                  child: Text('Conocer más sobre Flint',
                      style: TextStyle(
                        color: Colors.green,
                      )),
                  color: Colors.white,
                ),
              ),
              Image.asset('assets/transfer.png'),
            ],
          ),
        ),
      ),
    );
  }
}
