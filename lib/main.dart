import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:school_project/data_page.dart';
import 'package:school_project/forms_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("UserForm");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      title: 'Flutter Demo',
      theme: NeumorphicThemeData(
        baseColor: Colors.blue,
        lightSource: LightSource.bottomRight,
        depth: 4
      ),
      home: FormsPage(),
    );
  }
}