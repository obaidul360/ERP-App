import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart';

import 'info_received.dart';

class ForTestScreen extends StatefulWidget {
  const ForTestScreen({super.key});

  @override
  State<ForTestScreen> createState() => _ForTestScreenState();
}

class _ForTestScreenState extends State<ForTestScreen> {
  Future softInfo() async {
    String name;
    String subName;
    var id;
  }

  Future sumFun() async {
    var a;
    var b;
    var c;
    var sumationIs;
  }

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "For test",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: Border.all(style: BorderStyle.solid),
        onPressed: () {},
        child: Icon(Icons.add, size: 25, color: Colors.deepPurple),
      ),
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        reverse: true,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Text("Text"),
            Text("Body"),

            SizedBox(height: 140, child: Column(children: [Text("Size Box")])),
            SizedBox(
              height: 200,
              child: Column(children: [Text("2nd Size Box")]),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: Column(
                children: [
                  Text(
                    "Width ",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text(
                    "Test Size Box",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.yellow, width: 4),
                image: DecorationImage(image: AssetImage("assetName")),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Text("This is row", key: ValueKey("This is row")),
                  ),
                  Expanded(
                    child: Text(
                      "This is Expended Row",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Obaidul"));
                    },
                  ),
                  SizedBox(height: 12),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Toslim"));
                    },
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Korim"));
                    },
                  ),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Toslim"));
                    },
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text("Korim"));
                    },
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Welcome Back 👋",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  /// EMAIL FIELD
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      prefixIcon: const Icon(Icons.email),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter email";
                                      }
                                      if (!value.contains('@')) {
                                        return "Invalid email";
                                      }
                                      return null;
                                    },
                                  ),

                                  const SizedBox(height: 15),

                                  /// PASSWORD FIELD
                                  TextFormField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    obscureText: isObscure,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      prefixIcon: const Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.length < 6) {
                                        return "Password must be 6+ chars";
                                      }
                                      return null;
                                    },
                                  ),

                                  const SizedBox(height: 25),

                                  /// BUTTON
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {

                                        if (_formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text("Form Submitted"),
                                            ),
                                          );
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoReceivedScreen(name: '', email: '',)));
                                        }
                                      },
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
