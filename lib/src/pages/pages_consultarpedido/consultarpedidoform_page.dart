import 'package:flutter/material.dart';
import 'package:repartos_magsa/src/utils/responsive.dart';
import 'package:repartos_magsa/src/widgets/appbar_welcome_custom.dart';
import 'package:repartos_magsa/src/widgets/background_widget.dart';

String departamenteSeleccionado;
String numeropedido;

class ConsultarPedidoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context); //* FUNCION RESONSIVE PARA LA APP

    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          AppBarWelcome(
            texto: 'INGRESA Nº DE PEDIDO',
            ontap: () => Navigator.pop(context),
          ),
          SafeArea(
            child: ListView(
              reverse: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(height: responsive.heigthp(20))),
                Align(alignment: Alignment.center, child: FormularioPedido())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FormularioPedido extends StatefulWidget {
  @override
  _FormularioPedidoState createState() => _FormularioPedidoState();
}

class _FormularioPedidoState extends State<FormularioPedido> {
  List<String> _departamento = ['LA LIBERTAD', 'LAMBAYEQUE', 'PIURA'];
  final formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context); //* FUNCION RESONSIVE PARA LA APP
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Container(
                height: responsive.heigthp(10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      decoration: InputDecoration(
                        hintText: 'INGRES AQUI EL CODIGO DEL PEDIDO',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        numeropedido = value;
                        print("VALOR DEL CAMPO CODIGO PEDIDO $value");
                      },
                      validator: (value) => (value.length <= 7)
                          ? 'Ingrese un numero de pedido Valido'
                          : null),
                ),
              ),
            ),
            SizedBox(height: responsive.heigthp(2)),
            Container(
              width: responsive.widthp(70),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: DropdownButton(
                    hint: Text('ELIJA SU DEPARTAMENTO'),
                    items: getOpcionesDropdow(),
                    value: departamenteSeleccionado,
                    onChanged: (opt) {
                      print(opt);
                      setState(() {
                        departamenteSeleccionado = opt;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: responsive.heigthp(2),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  print("paginaconsultarpedidodetalle");
                  final form = formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    Navigator.pushNamed(context, '/mostrarpedidodetalle');
                  }
                },
                child: Text(
                  "BUSCAR MI PEDIDO",
                  style: TextStyle(
                      fontSize: responsive.inchp(3),
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdow() {
    List<DropdownMenuItem<String>> lista = List();
    _departamento.forEach((departamento) {
      lista.add(
        DropdownMenuItem(
          child: Text(departamento),
          value: departamento,
        ),
      );
    });
    return lista;
  }
}
