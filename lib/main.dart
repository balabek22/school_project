import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/data_page.dart';
import 'package:school_project/forms_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Flutter Demo',
      theme: const NeumorphicThemeData(
        baseColor: Colors.blue,
        lightSource: LightSource.bottomRight,
        depth: 4
      ),
      home: const FormsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}