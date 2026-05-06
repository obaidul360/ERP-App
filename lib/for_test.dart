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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  InfoReceivedScreen(
                                                    name: emailController.text,
                                                    email:
                                                        passwordController.text,
                                                  ),
                                            ),
                                          );
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
            Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// PROFILE IMAGE
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=3",
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// NAME
                    const Text(
                      "Md Obaidul Islam",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 5),

                    /// EMAIL
                    const Text(
                      "obaidul@email.com",
                      style: TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 15),

                    /// BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("View Profile"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.red)),
                Expanded(flex: 2, child: Container(color: Colors.blue)),
                Text("Top"),
                Text("Middle"),
                Text("Bottom"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email"),
                SizedBox(height: 5),
                TextField(),
                SizedBox(height: 15),

                Text("Password"),
                SizedBox(height: 5),
                TextField(),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text("Login")),
              ],
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text("User $index"),
                    subtitle: Text("user$index@email.com"),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            color: Colors.grey[300],
                          ),
                          child: Center(child: Icon(Icons.image, size: 50)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Product $index"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("\$100"),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              subtitle: Text("Edit profile"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                Image.network("https://via.placeholder.com/300"),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text("Product", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
