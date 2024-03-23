import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/list1': (context) => ListScreen1(),
        '/list2': (context) => ListScreen2(),
        '/list3': (context) => ListScreen3(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домашняя страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list1');
              },
              child: Text('Список 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list2');
              },
              child: Text('Список 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list3');
              },
              child: Text('Список 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListScreen1 extends StatefulWidget {
  @override
  _ListScreen1State createState() => _ListScreen1State();
}

class _ListScreen1State extends State<ListScreen1> {
  List<String> items = ['Значение 0', 'Значение 1', 'Значение 2'];
  int ind = 3;

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список 1'),
      ),
      body: Column(
        children: [

          // ElevatedButton(
          //   onPressed: addItem,
          //   child: Text('+'),
          // ),
          Expanded(
            child: Column(
                children: items
                    .asMap()
                    .entries
                    .map(
                      (item) => ListTile(
                    title: Text(item.value),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeItem(item.key),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add('Значение ' + (ind).toString());
            ind++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListScreen2 extends StatefulWidget {
  @override
  _ListScreen2State createState() => _ListScreen2State();
}

class _ListScreen2State extends State<ListScreen2> {
  List<String> _list = ['Значение 0', 'Значение 1', 'Значение 2'];
  int ind = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список 2'),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_list[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _list.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list.add('Значение ' + ind.toString());
            ind++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListScreen3 extends StatefulWidget {
  @override
  _ListScreen3State createState() => _ListScreen3State();
}

class _ListScreen3State extends State<ListScreen3> {
  List<String> _list = ['Значение 0', 'Значение 1', 'Значение 2'];
  int ind = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Список 3'),
    ),
    body: ListView.separated(
    itemCount: _list.length,
    separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_list[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _list.removeAt(index);
              });
            },
          ),
        );
      },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list.add('Значение ' + ind.toString());
            ind++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}