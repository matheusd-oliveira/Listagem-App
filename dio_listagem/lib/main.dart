import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Contact List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();

    contatos.add(Contato(
        nome: 'Teste', telefone: '8328-2323', tipo: ContatoType.CELULAR));
    contatos.add(
        Contato(nome: 'Teste', telefone: '3692-5814', tipo: ContatoType.CASA));
    contatos.add(
        Contato(nome: 'Teste', telefone: '8452-9865', tipo: ContatoType.CASA));
    contatos.add(Contato(
        nome: 'Teste', telefone: '8945-3266', tipo: ContatoType.TRABALHO));
    contatos.add(Contato(
        nome: 'Teste', telefone: '8167-1771', tipo: ContatoType.CELULAR));
    contatos.add(Contato(
        nome: 'Teste', telefone: '8175-7545', tipo: ContatoType.CELULAR));
    contatos.add(Contato(
        nome: 'Teste', telefone: '8144-8471', tipo: ContatoType.CELULAR));
    contatos.add(Contato(
        nome: 'Teste', telefone: '8152-9277', tipo: ContatoType.CELULAR));
    contatos.add(Contato(
        nome: 'Teste', telefone: '8169-3245', tipo: ContatoType.FAVORITO));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contatos.length));
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[600]);
    }
  }
}
