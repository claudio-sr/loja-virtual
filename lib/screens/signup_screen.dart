import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(14.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Nome Completo",
              ),
              validator: (text) {
                if(text.isEmpty || text.length < 3){
                  return "Nome inválido!";
                }
              },
            ),
            SizedBox(height: 14,),
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
            SizedBox(height: 14,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Senha",
              ),
              validator: (text){
                if(text.isEmpty || text.length < 6) {
                  return "Semha inválida";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 14,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Endereço",
              ),
              validator: (text){
                if(text.isEmpty) {
                  return "Endereço inválida";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 14,),
            RaisedButton(
              child: Text("Criar Conta",
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

