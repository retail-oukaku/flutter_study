import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart';

class DbDemoPage extends StatefulWidget {
  const DbDemoPage({super.key});

  @override
  State<DbDemoPage> createState() => _DbDemoPage();
}

class _DbDemoPage extends State<DbDemoPage> {
  final db = sqlite3.openInMemory();

  @override
  void initState() {
    //   db.execute('''
    //   CREATE TABLE artists (
    //     id INTEGER NOT NULL PRIMARY KEY,
    //     name TEXT NOT NULL
    //   );
    // ''');

    super.initState();
  }

  @override
  void dispose() {
    db.dispose();
    super.dispose();
  }

  void insert() {
    // Prepare a statement to run it multiple times:
    final stmt = db.prepare('INSERT INTO artists (name) VALUES (?)');
    stmt
      ..execute(['The Beatles'])
      ..execute(['Led Zeppelin'])
      ..execute(['The Who'])
      ..execute(['Nirvana'])

      // Dispose a statement when you don't need it anymore to clean up resources.
      ..dispose();
  }

  void select() {
    // You can run select statements with PreparedStatement.select, or directly
    // on the database:
    final resultSet =
        db.select('SELECT * FROM artists WHERE name LIKE ?', ['The %']);

    // You can iterate on the result set in multiple ways to retrieve Row objects
    // one by one.
    for (final row in resultSet) {
      print('Artist[id: ${row['id']}, name: ${row['name']}]');
    }

    // Register a custom function we can invoke from sql:
    // db.createFunction(
    //   functionName: 'dart_version',
    //   argumentCount: const AllowedArgumentCount(0),
    //   function: (args) => Platform.version,
    // );
    // print(db.select('SELECT dart_version()'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    insert();
                  },
                  child: const Text(
                    'add',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    select();
                  },
                  child: const Text(
                    'print',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
