import 'package:flutter/material.dart';
import 'user.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key key, this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${user.name}'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Center(
              child: Container(
                //ramme rundt om billede
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 5,
                      color: Colors.amberAccent,
                    )),
                child: Image.network('${user.picture}'),
              ),
            ),
            Card(
              // lysere blå farve
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              // mere skygge under card
              elevation: 10,
              child: ListTile(
                  title: Text('Location'),
                  subtitle:
                      Text('Country:\t ${user.country}\nCity:\t ${user.city}')),
            ),
            Card(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: ListTile(
                  title: Text('Contact information'),
                  subtitle:
                      Text('Email:\t ${user.email}\nPhone:\t ${user.phone}')),
            ),
          ],
        ));
  }
}
