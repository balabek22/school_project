import 'package:flutter/material.dart';
import 'package:school_project/data_controller.dart';
import 'package:school_project/data_model.dart';

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

  @override
  void initState() {
    super.initState();

    DataController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
        //this.feedbackItems.removeWhere((element) => element.form != '2а');
        this.feedbackItems.removeWhere((element) => element.form != '${widget.formNumber}${widget.formLatter}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Расписание ${widget.formNumber}${widget.formLatter}'),
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                const Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${feedbackItems[index].form}"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                const Icon(Icons.message),
                Expanded(
                  child: Text(feedbackItems[index].monday.toString()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}