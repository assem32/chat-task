import 'package:flutter/material.dart';

class TextFormFiledDefault extends StatelessWidget {
  TextFormFiledDefault({super.key,required this.controller,required this.validateMessage,required this.label,required this.type,required this.show});
  var controller = TextEditingController();
  final String label;
  final String validateMessage;
  final TextInputType type;
  final bool show;

  


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: show,
      style: TextStyle(color: Colors.white),
      validator: (value) {
                      if (value!.isEmpty) {
                        return  validateMessage;
                      }
                      return null;
                    },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        label: Text('$label'),
        labelStyle: TextStyle(color: Colors.white)
      ),
    );
  }
}