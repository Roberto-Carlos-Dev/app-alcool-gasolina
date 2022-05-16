import 'package:app_gasolina_alcool/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gasolina = TextEditingController();
  TextEditingController alcool = TextEditingController();

  var va = 'Vale a pena usar o Álcool';
  var na = 'Não vale a pena usar ao Álcool';
  String? resultado = '';

  calc() {
    double res;
    double gas;
    double alc;
    double valor = 0.71;

    setState(() {
      gas = double.parse(gasolina.text);
      alc = double.parse(alcool.text);
      res = (alc / gas);

      resultado = res < valor ? va : na;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: appBarHome(), preferredSize: const Size.fromHeight(60)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
            image: NetworkImage(
                'https://play-lh.googleusercontent.com/OQs_WahUwaJ2kNJbHF9hEAc_aBnOi6y-31SPQ7Rhqej2wQmzlBS3glG3D-ocyeQ_gw'),
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: TextField(
              controller: alcool,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Preço Álcool',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: TextField(
              controller: gasolina,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Preço Gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calc,
            child: const Text('Calcular'),
          ),
          Text(
            '$resultado',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
