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

  Widget formItem(int formNumber){
    if(formNumber==10 || formNumber==11){
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
        child: ListTile(
          title: Text("$formNumber класс"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return DataPage(
              formLatter: "",
              formNumber: formNumber,
            );
          }));
        },
        ),
      );
    } else{
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
        child: ExpansionTile(
          title: Text('${formNumber} класс'),
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  formChip(formNumber, 'а'),
                  formChip(formNumber, 'б'),
                  formChip(formNumber, 'в'),
                ],
              ),
            ),
          ],),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Выберите класс'),
      ),
      body: ListView.builder(
          itemCount: 11,
          itemBuilder: (_, form){
            return formItem(form+1);
      }),
    );
  }
}
