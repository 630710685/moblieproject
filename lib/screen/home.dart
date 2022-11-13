import 'package:flutter/material.dart';

import 'package:moblieproject/screen/register.dart';
class Homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: Text("เข้าวัด ฟังธรรม ทำบุญ"),

    ),body:Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/—Pngtree—hand-painted style monk meditation umbrella_4194016.png"),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(icon: Icon(Icons.add),
                  label: Text("สร้างบัญชีผู้ใช้สำหรับสายบุญ" ,style: TextStyle(fontSize: 15)),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                  return RegisterScreen();
                })
                );

                },

                ),
              ),


          ],


        ),
      ),
    )
    );
  }
}
