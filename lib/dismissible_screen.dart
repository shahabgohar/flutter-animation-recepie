import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({Key? key}) : super(key: key);

  @override
  _DismissibleScreenState createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen>
    with SingleTickerProviderStateMixin {
  final List<String> sweets = [
    'Petit four',
    'Cupcake',
    'Donut',
    'Eclair',
    'Froyo',
    'Gingerbread',
    'Honeycomb',
    'Icecream Sandwich',
    'JellyBean',
    'Kit Kat'
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dismissible Example'),
        ),
        body: ListView.builder(
            itemCount: sweets.length,
            itemBuilder: (BuildContext context, int index) {
              return OpenContainer(
                  transitionDuration: Duration(seconds: 2),
                  transitionType: ContainerTransitionType.fade,
                  openBuilder: (BuildContext context, closeContainer) {
                    return Scaffold(
                        appBar: AppBar(
                          title: Text(sweets[index]),
                        ),
                        body: Center(
                          child: Column(
                            children: [
                              Container(
                                  width: 200,
                                  height: 200,
                                  child: Icon(Icons.cake,
                                      size: 200, color: Colors.orange)),
                              Text(sweets[index])
                            ],
                          ),
                        ));
                  },
                  closedBuilder: (BuildContext context, openContainer) {
                    return Dismissible(
                      key: Key(sweets[index]),
                      child: ListTile(
                        title: Text(sweets[index]),
                        onTap: () {
                          openContainer();
                        },
                      ),
                      onDismissed: (direction) {
                        print(direction);
                        sweets.removeAt(index);
                      },
                    );
                  });
            }));
  }
}
