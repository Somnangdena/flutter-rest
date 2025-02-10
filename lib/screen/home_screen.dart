import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Rest API Call",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.location.country),
              //   tileColor: color,
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

  // Future<void> fetchUsers() async {
  //   print('fetchUsers called');
  //   const url = 'https://randomuser.me/api/?results=100';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map((e) {
  //     final name = UserName(
  //         title: e['name']['title'],
  //         first: e['name']['first'],
  //         last: e['name']['last']);
  //     return User(
  //         cell: e['cell'],
  //         email: e['email'],
  //         gender: e['gender'],
  //         nat: e['nat'],
  //         phone: e['phone'],
  //         name: name);
  //   }).toList();

  //   setState(() {
  //     users = transformed;
  //   });
  //   print('fetshUsers completed');
  // }
}
