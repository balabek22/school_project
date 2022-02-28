import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';
import 'package:school_project/data_page.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {

  final UserForm=Hive.box("UserForm");
  
  
  Widget formChip(int formNumber, String formLatter){
    return NeumorphicRadio(
      //elevation: 8.0,
      padding: const EdgeInsets.all(8.0),
      /*avatar: const CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.mode_comment,color:
        Colors.white,size: 20,),
      ),*/
      style: NeumorphicRadioStyle(
        border: NeumorphicBorder(width: 1.0, color: Colors.blue),
          selectedColor: Colors.blue,
        disableDepth: false, shape: NeumorphicShape.concave,
        unselectedDepth: 2,
        selectedDepth: 2,
        intensity: 0.5
      ),
      child: Text(formLatter),
      onChanged: (changed) {
        UserForm.put("UserFormLatter", formLatter);
        UserForm.put("UserFormNumber", formNumber);
        print("${UserForm.get("UserFormNumber")} ${UserForm.get("UserFormLatter")}");
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return DataPage(
            formLatter: formLatter,
            formNumber: formNumber,
          );
        }));
      },
      //backgroundColor: Colors.grey[200],
      /*shape: const StadiumBorder(
          side: BorderSide(
            width: 1,
            color: Colors.redAccent,
          )),*/
    );
  }

  Widget formItem(int formNumber){
    if(formNumber==10 || formNumber==11){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Neumorphic(
          style: NeumorphicStyle(lightSource: LightSource.bottomRight),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
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
        ),
      );
    } else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Neumorphic(
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
          style: NeumorphicStyle(
            lightSource: LightSource.bottomRight
          ),
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
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (UserForm.isNotEmpty) {
      Future.delayed(Duration(seconds: 30));
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return DataPage(
          formLatter: UserForm.get("UserFormLatter"),
          formNumber: UserForm.get("UserFormNumber"),
        );
      }));
    }  
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NeumorphicAppBar(
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
