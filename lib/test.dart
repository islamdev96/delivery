// ignore_for_file: prefer_typing_uninitialized_variables

import 'all_export.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;

  intialdata() async {
    res = await checkInternet();
  }

  @override
  void initState() {
    intialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: const [],
          )),
    );
  }
}
