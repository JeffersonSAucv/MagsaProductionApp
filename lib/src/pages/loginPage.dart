import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//LIBRERIAS
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repartos_magsa/src/models/modelo_usuario.dart';
import 'package:repartos_magsa/src/services/login_services.dart';

//WIDGETS
import 'package:repartos_magsa/src/widgets/appbar_welcome_custom.dart';
import 'package:repartos_magsa/src/widgets/background_widget.dart';

//UTILS
import 'package:repartos_magsa/src/utils/responsive.dart';
import 'package:repartos_magsa/src/widgets/camposFieldCustom_widgets.dart';
import 'package:repartos_magsa/src/widgets/logomagsa.dart';

class LoginPage extends StatelessWidget {
  final List<DatosUsuario> usuario;

  const LoginPage({Key key, this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(), //FONDO APLICACION
          AppBarWelcome(
            // APP BAR CUSTOM
            texto: 'INGRESA TUS DATOS',
            ontap: () => Navigator.of(context).pop(),
          ),
          Positioned(
              bottom: responsive.inchp(4),
              left: responsive.inchp(2),
              child:
                  ZoomIn(duration: Duration(seconds: 1), child: LogoMagsa())),
          SafeArea(
            child: ListView(
              reverse: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Container(
                  height: responsive.heigthp(30),
                ),
                Align(
                    alignment: Alignment.center,
                    child: FadeInUpBig(
                        delay: Duration(seconds: 1),
                        child: ContainerTextsFields(
                          usuario: usuario,
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContainerTextsFields extends StatefulWidget {
  final List<DatosUsuario> usuario;
  const ContainerTextsFields({Key key, @required this.usuario})
      : super(key: key);

  @override
  _ContainerTextsFieldsState createState() => _ContainerTextsFieldsState();
}

class _ContainerTextsFieldsState extends State<ContainerTextsFields> {
  var _correo = '';
  var _password = '';
  var _isFetching = false;

  final formKey = GlobalKey<FormState>();
  final _authApi = AuthApi();

  void _submit() async {
    if (_isFetching) return;

    final isValid = formKey.currentState.validate();
    if (isValid) {
      setState(() {
        _isFetching = true;
      });
      await _authApi.login(_correo, _password, context);

      setState(() {
        _isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
        height: responsive.heigthp(45),
        width: responsive.widthp(90),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              //SizedBox(height:responsive.heigthp(5) ,),
              Spacer(),
              CampoFieldCustom(
                icon: FontAwesomeIcons.solidUserCircle,
                textformfield: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Correo',
                    border: InputBorder.none,
                  ),
                  //VALIDACION  CAMPO CORREO
                  validator: (value) {
                    if (value.contains("@")) {
                      _correo = value;
                      return null;
                    }
                    return "Correo Invalido";
                  },
                ),
              ),
              SizedBox(height: responsive.heigthp(2)),
              CampoFieldCustom(
                icon: FontAwesomeIcons.lock,
                textformfield: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: InputBorder.none,
                  ),
                  //VALIDACION  CAMPO CONTRASEÑA
                  validator: (value) {
                    if (value.isNotEmpty && value.length > 5) {
                      _password = value;
                      return null;
                    }
                    return "Contraseña muy corta";
                  },
                ),
              ),
              Spacer(),
              BotonLogin(
                // EL BOTON DEVUELVE UN WIDGET Y LLAMAMOS A UN LOADER MIENTRAS TRAE LA DATA  Y LUEGO CAMBIA AL BOTON
                widget: _isFetching
                    ? Container(
                        child: CupertinoActivityIndicator(
                        radius: 10,
                      ))
                    : Text("INGRESAR",
                        style: TextStyle(
                            fontSize: responsive.inchp(3),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans-Regular')),

                onTap: () {
                  _submit();
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

//BOTTOM LOGIN

class BotonLogin extends StatelessWidget {
  final Function onTap;
  final Widget widget;

  const BotonLogin({Key key, this.onTap, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Material(
            child: RaisedButton(
          splashColor: Colors.yellow.withOpacity(0.6),
          onPressed: onTap,
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffFFD200), Color(0xffFFBF00)],
              ),
            ),
            child: Container(
                alignment: Alignment.center,
                width: responsive.widthp(40),
                height: responsive.heigthp(8),
                child: widget),
          ),
        )));
  }
}
