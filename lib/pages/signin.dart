import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mcommerce/pages/catalogo.dart';

class SigninPage extends StatelessWidget {
  String _email;
  String _password;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(8, 8, 0, 30),
                  child: Icon(Icons.arrow_back_ios),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(14, 0, 14, 73),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 34,
                    color: Color(0xFF222222),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 126),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 8,
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 14,
                                height: 1.42),
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 11,
                            ),
                            border: InputBorder.none,
                          ),
                          onSaved: (value) => _email = value,
                          validator: (value) {
                            if (value.isEmpty)
                              return "Campo e-mail obrigatório";
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 8,
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 14,
                                height: 1.42),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 11,
                            ),
                            border: InputBorder.none,
                          ),
                          onSaved: (value) => _password = value,
                          validator: (value) {
                            if (value.isEmpty || value.length < 6)
                              return "Campo password deve conter 6 caracteres";
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () { 
                          Navigator.of(context).pushNamed('/forgotpassword');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 16, bottom: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot your password?"),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: Color(0xFFDB3022),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 28,),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            var response = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _email, password: _password);

                            Navigator.of(context).pushReplacementNamed('/catalogo');
                          }
                        },
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFDB3022),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 8,
                                color: Color.fromRGBO(211, 38, 38, 0.25),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFFFFFFF),
                                  height: 1.42),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}
