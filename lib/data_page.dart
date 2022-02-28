import 'dart:async';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/data_controller.dart';

import 'DataModel.dart';
import 'forms_page.dart';


class DataPage extends StatefulWidget {
  const DataPage({Key? key, required this.formNumber, required this.formLatter}) : super(key: key);
  final int formNumber;
  final String formLatter;

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<DataModel> feedbackItems = <DataModel>[];

  // Method to Submit Feedback and save it in Google Sheets

  bool isloadining=true;

  Color appbarcolor=Colors.lightGreen;

  @override
  void initState(){
    super.initState();

    DataController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
        //this.feedbackItems.removeWhere((element) => element.form != '2а');
        this.feedbackItems.removeWhere((element) => element.form != '${widget.formNumber}${widget.formLatter}');
      });
    });
    waitforme();
  }
  waitforme() async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isloadining=false;
    });
  }

  Widget timeTableItem(String day, String timetable){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        child: ListTile(
          subtitle: Text(feedbackItems[0].monday.toString()),
          title: Text('Понедельник'),
        ),
      ),
    );
  }

  Widget changesItem(){
    if(feedbackItems[0].changes==""){
      return Neumorphic();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          subtitle: Text(feedbackItems[0].changes.toString()),
          title: Text('Замены'),
          textColor: Colors.blue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: NeumorphicButton(
          child: Icon(Icons.arrow_back,
          color: Colors.blue,),
          onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => FormsPage()))
        ),
        title: Text('Расписание ${widget.formNumber}${widget.formLatter}'),
      ),
      body: isloadining==true?Center(child: NeumorphicProgressIndeterminate()): ListView(
        children: [
          changesItem(),
          timeTableItem("Понедельник", feedbackItems[0].monday.toString()),
          timeTableItem("Вторник", feedbackItems[0].tuesday.toString()),
          timeTableItem("Среда", feedbackItems[0].wednesday.toString()),
          timeTableItem("Четверг", feedbackItems[0].thursday.toString()),
          timeTableItem("Пятница", feedbackItems[0].friday.toString()),
          timeTableItem("Суббота", feedbackItems[0].saturday.toString()),
        ],
      )
    );
  }
}