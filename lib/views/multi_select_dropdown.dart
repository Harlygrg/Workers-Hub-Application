import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_hub/constants/constants.dart';

//from stack overflow
class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key? key, required this.items, required this.initialSelectedValues}) : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);

      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    if(_selectedValues.length<4){
      Navigator.pop(context, _selectedValues);
    }else{
      showDialog(
          context: context,
          builder: (context){
            return const AlertDialog(
              title:  Text(
                "Please choose less than 4 categories",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primeColor,fontSize: 13),),
            );
          }
      );
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Work Categories'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        ElevatedButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked!),
    );
  }
}


List<MultiSelectDialogItem<int>> multiItem =[];

final valuesToPopulate={
  1:"Plumber",
  2:"Mason",
  3:"Electrician",
  4: "Carpenter"
};

void populateMultiselect(){
  for(int v in valuesToPopulate.keys){
    multiItem.add(MultiSelectDialogItem(v, valuesToPopulate[v]!));
  }
}






void showMultiSelect(BuildContext context) async {
  multiItem=[];
  populateMultiselect();
  final items =multiItem;
  // final items = <MultiSelectDialogItem<int>>[
  //   MultiSelectDialogItem(1, 'Plumber'),
  //   MultiSelectDialogItem(2, 'Mason'),
  //   MultiSelectDialogItem(3, 'Electrician'),
  //   MultiSelectDialogItem(4, 'Carpenter'),
  // ];

  final selectedValues = await showDialog<Set<int>>(
    context: context,
    builder: (BuildContext context) {
      return MultiSelectDialog(
        items: items,
        initialSelectedValues: [1].toSet(),
      );
    },
  );
// SharedPreferences pref = await SharedPreferences.getInstance();
// pref.setStringList("skillList", selectedValues);
  print(selectedValues);
  getValuesFromKey(selectedValues!);

}
List<String> selectedSkills=[];
void getValuesFromKey(Set selection)async{
  print(valuesToPopulate);
  if(selection!=null){
    for(int v in selection.toList()){
      selectedSkills.add(valuesToPopulate[v].toString());
      //print(valuesToPopulate[v]);
    }
   // print(selectedValues);
  }

}