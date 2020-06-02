import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatelessWidget {

  String _name;
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
              Container(
                margin: EdgeInsets.fromLTRB(14, 62, 14, 73),
                child: Text(
                  "Sign up",
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
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 14,
                                height: 1.42),
                            labelText: "Name",
                            labelStyle: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 11,
                            ),
                            border: InputBorder.none,
                          ),
                          onSaved: (value) => _name = value,
                          validator: (value) {
                            if(value.isEmpty)
                              return "Campo nome obrigatório"; 
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
                            if(value.isEmpty)
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
                            if(value.isEmpty || value.length < 6)
                              return "Campo password deve conter 6 caracteres"; 
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16, bottom: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Already have an account?"),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Color(0xFFDB3022),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () { 
                          if(_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            FirebaseAuth.instance
                              .createUserWithEmailAndPassword(email: _email, password: _password);
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
                              "SIGN UP",
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
