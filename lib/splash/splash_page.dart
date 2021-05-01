import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlwflutter/core/app_gradients.dart';
import 'package:nlwflutter/core/app_images.dart';
import 'package:nlwflutter/core/app_text_styles.dart';
import 'package:nlwflutter/home/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final TextEditingController nomeController = TextEditingController();
  final String nome = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/*
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
    */
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Otniel Quiz",
                style: AppTextStyles.heading40,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 100.0, right: 100, top: 80),
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: "Digite seu nome",
                            hintStyle: TextStyle(fontSize: 14),
                            icon: Icon(
                              Icons.person,
                            )),
                        controller: nomeController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              nome: nomeController.text,
                                            )));
                              },
                              child: Text("Entrar"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                            ),
                          ),
                        ],
                      ),
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
