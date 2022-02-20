import 'package:flutter/material.dart';
import 'package:school_project/data_page.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {

  Widget formChip(int formNumber, String formLatter){
    return ActionChip(
      //elevation: 8.0,
      padding: const EdgeInsets.all(2.0),
      /*avatar: const CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.mode_comment,color:
        Colors.white,size: 20,),
      ),*/
      label: Text(formLatter),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return DataPage(
            formLatter: formLatter,
            formNumber: formNumber,
          );
        }));
      },
      backgroundColor: Colors.grey[200],
      shape: const StadiumBorder(
          side: BorderSide(
            width: 1,
            color: Colors.redAccent,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Выберите класс'),
      ),
      body: ListView.builder(itemBuilder: (_, form){
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
          child: ExpansionTile(
            title: Text('${form+1} класс'),
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  formChip(form+1, 'а'),
                  formChip(form+1, 'б'),
                  formChip(form+1, 'в'),
                ],
              ),
            ),
          ],),
        );
      }),
    );
  }
}
