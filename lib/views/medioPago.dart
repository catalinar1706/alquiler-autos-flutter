import 'package:flutter/material.dart';

class Mediopago extends StatefulWidget {
  const Mediopago({super.key});

  @override
  State<Mediopago> createState() => _MediopagoState();
}

class _MediopagoState extends State<Mediopago> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text("Medio de pago", style: TextStyle(color: Colors.purple),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              color: Colors.purple[200],
              child: const ListTile(
                title: Row(
                  children: [
                    Text("Tarjeta de credito o debito", style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
                leading: Icon(Icons.credit_card, color: Colors.purple,),
              ),
            ),
            Card(
              color: Colors.purple[200],
              child: const ListTile(
                title: Row(
                  children: [
                    Text("PayPal", style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
                leading: Icon(Icons.paypal, color: Colors.purple,),
              ),
            ),
            Card(
              color: Colors.purple[200],
              child: const ListTile(
                title: Row(
                  children: [
                    Text("Transferencia bancaria", style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
                leading: Icon(Icons.account_balance, color: Colors.purple,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
