import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("CRIAR CONTA",
            style: TextStyle(fontSize: 15),
            ),
            textColor: Colors.white,
            onPressed: (){},
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "E-mail",
              ),
              validator: (text) {
                if(text.isEmpty || !text.contains("@")){
                  return "E-mail inválido!";
                }
              },
            ),
            SizedBox(height: 16,),
            TextFormField(
             obscureText: true,
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              validator: (text){
               if(text.isEmpty || text.length < 6) {
                 return "Semha inválida";
               }
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){},
                child: Text("Esqueci minha senha",
                textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16,),
            RaisedButton(
              child: Text("Entrar",
              style: TextStyle(fontSize: 18.0),
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: (){
                if(_formKey.currentState.validate()){

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
