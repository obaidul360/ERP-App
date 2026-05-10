import 'package:flutter/material.dart';

class SearchBarExample extends StatefulWidget {
  const SearchBarExample({super.key});

  @override
  State<SearchBarExample> createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  List<String> allItems = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Grapes",
    "Watermelon",
    "Pizza",
    "Cheese",
    "burger",
    "Tacos/Quesadillas",
    "Chicken",
    "Nuggets",
    "Soup(Tomato, Clam Chowder)Caesar Salad",
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void searchItem(String value) {
    setState(() {
      filteredItems = allItems.where((item) {
        return item.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Bar")),

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: searchItem,

              decoration: InputDecoration(
                hintText: "Search here...",
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          // List
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,

              itemBuilder: (context, index) {
                return Card(child: ListTile(title: Text(filteredItems[index])));
              },
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Test for git update",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.limeAccent,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Text("Hello Flutter"),
          ),
          SizedBox(height: 20),
          Column(children: [Text("First"), Text("Second"), Text("Third")]),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Form(
                key: _formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock, size: 80, color: Colors.blue),

                    const SizedBox(height: 20),

                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// EMAIL
                    TextFormField(
                      controller: emailController,

                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: const Icon(Icons.email),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    /// PASSWORD
                    TextFormField(
                      controller: passwordController,
                      obscureText: isPasswordHidden,

                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        prefixIcon: const Icon(Icons.lock),

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    /// LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String email = emailController.text;
                            String password = passwordController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Success\n$email")),
                            );
                          }
                        },

                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),

                        TextButton(
                          onPressed: () {},
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController resetController =
                      TextEditingController();

                  return AlertDialog(
                    title: const Text("Forgot Password"),

                    content: TextField(
                      controller: resetController,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                      ),
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          String email = resetController.text;

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Password reset link sent to $email",
                              ),
                            ),
                          );
                        },
                        child: const Text("Send"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Forgot Password?"),
          ),
          SizedBox(height: 20),
          const SizedBox(height: 10),

          /// FORGOT PASSWORD
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    TextEditingController resetController =
                        TextEditingController();

                    return AlertDialog(
                      title: const Text("Forgot Password"),

                      content: TextField(
                        controller: resetController,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                        ),
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            String email = resetController.text;

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Password reset link sent to $email",
                                ),
                              ),
                            );
                          },
                          child: const Text("Send"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Forgot Password?"),
            ),
          ),
        ],
      ),
    );
  }
}
