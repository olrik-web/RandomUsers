import 'dart:convert';
import 'package:flutter/material.dart';
import './user.dart';
import 'package:http/http.dart' as http;
import 'UserDetail.dart';

class UserListPage extends StatefulWidget {
  UserListPage({Key key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

Future<List<User>> fetchUsers() async {
  final response = await http.get('https://randomuser.me/api/?results=100');
  // der hentes 100 json objekter (users)
  List<User> users = [];
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    List<dynamic> jsonUsers = jsonData['results'];
    for (int i = 0; i < jsonUsers.length; i++) {
      var newUser = jsonUsers[i];
      users.add(User.fromJson(newUser));
    }
  }
  return users;
}

class _UserListPageState extends State<UserListPage> {
  Future<List<User>> futureUserList;

  @override
  void initState() {
    super.initState();
    futureUserList = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Random Users List'),
      ),
      body: FutureBuilder(
          future: futureUserList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      title: Text('${user.name}'),
                      subtitle: Text('${user.email}'),
                      leading: ClipRRect(
                        // runde hjørner på billeder
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network('${user.picture}'),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UserDetail(user: user);
                        }));
                      },
                    ),
                  );
                },
              );
            }
            //centrerer loading ikonet, når listen af users hentes
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          // nok ikke en super god måde at refresh på, men det virker :)
          Navigator.pop(context);
          Navigator.pushNamed(context, "/userList");
        },
        tooltip: 'Refresh list',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
