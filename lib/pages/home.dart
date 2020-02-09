import 'package:flutter/material.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_bloc_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc _homeBloc;
  int taps;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeBloc = HomeBlocProvider.of(context).homeBloc;
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Counter',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        initialData: 0,
        stream: _homeBloc.currentCount,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(snapshot.data.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 48.0
                  ),
                ),
              ],
            ),
          );//Output the number of taps so far here
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _homeBloc.addTap.add(true);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
