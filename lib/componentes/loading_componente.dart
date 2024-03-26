import 'package:flutter/material.dart';

class Loading{
  static  BuildContext? _context;

  static show(BuildContext context)async{
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        Loading._context=context;
        return  AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                const SizedBox(
                  width: 10,
                ),
                Text('الرجاء الانتظار...'),
              ],
            ));
      },);
  }

  static close(){
    if(Loading._context !=null) {
      Navigator.of(Loading._context!).pop();
    }
  }




  static Widget bottomLoading(bool value){
    return value? Container(
      alignment: Alignment.center,
      child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator()),
    ):SizedBox(height: 5,width: 5,);
  }

}