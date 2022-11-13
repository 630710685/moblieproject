import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:moblieproject/model/profile.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("สร้างบัญชีผู้ใช้"),),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ชื่อผู้ใช้", style: TextStyle(fontSize: 14)),
                  TextFormField(
                    validator:RequiredValidator(errorText: "กรุณากรอกข้อมูล") ,
                    onSaved: (var name){
                      profile.name = name;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("วัน/เดือน/ปีเกิด(xx/xx/xxxx)", style: TextStyle(fontSize: 15)),
                  TextFormField(

                    validator:RequiredValidator(errorText: "กรุณากรอกข้อมูล") ,
                    onSaved: (var born){
                      profile.born = born;
                    },
                  ),
                  SizedBox(
                  height: 15,
                  ),
                  Text("E-mail", style: TextStyle(fontSize: 15)),
                  TextFormField(
                    validator:MultiValidator([
                      RequiredValidator(errorText: "กรุณากรอกข้อมูล"),
                      EmailValidator(errorText: "รูปแบบ e-mail ไม่ถูกต้อง")
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (var email){
                      profile.email = email;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Password", style: TextStyle(fontSize: 15)),
                  TextFormField(
                    validator:RequiredValidator(errorText: "กรุณากรอกข้อมูล") ,
                    obscureText: true,
                    onSaved: (var password){
                      profile.password = password;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text("ลงทะเบียน",style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print("name = ${profile.name} born = ${profile
                              .born} email = ${profile
                              .email} password = ${profile.password}");
                          formKey.currentState!.reset();
                        }
                      },
                    ),

                  )

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
