import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI"), actions: [Icon(Icons.search)]),
      body: _UiConrolsView(),
    );
  }
}

class _UiConrolsView extends StatefulWidget {
  const _UiConrolsView();

  @override
  State<_UiConrolsView> createState() => _UiConrolsViewState();
}

///Con los enums podemos definir una clase con ciertas propiedades ya definidas, como los values de un select
enum Transportation { car, plane, boat, submarine }

class _UiConrolsViewState extends State<_UiConrolsView> {
  final Set<String> selectedList = {};
  bool isDeveloper = true;
  Transportation? selectedTransport;
  bool wantsBreakfas = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        ///Switch
        SwitchListTile(
          title: Text('Developer mode'),
          subtitle: Text('Controles adicionales'),

          ///Variable a la cual le hara caso con el valor
          value: isDeveloper,

          ///Se ejecuta al hacer tap
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Selected $selectedTransport'),
        ),
        RadioGroup(
          onChanged: (Transportation? value) {
            setState(() {
              selectedTransport = value;
            });
          },
          groupValue: selectedTransport,
          child: ExpansionTile(
            title: Text('Vehiculos'),
            subtitle: Text('$selectedTransport'),
            children: [_RadioList()],
          ),
        ),
        CheckboxListTile(
          title: Text('Desayuno?'),
          subtitle: Text('Seleccionar en caso desee un desayuno'),
          value: wantsBreakfas,
          onChanged: (value) => setState(() {
            wantsBreakfas = !wantsBreakfas;
            selectedList.add('Breakfast');
            if (!wantsBreakfas) {
              selectedList.removeWhere(
                (element) => element.startsWith('Breakfast'),
              );
            }
          }),
        ),
        CheckboxListTile(
          title: Text('Cena?'),
          subtitle: Text('Seleccionar en caso desee cena'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
            selectedList.add('Dinner');
            if (!wantsDinner) {
              selectedList.removeWhere(
                (element) => element.startsWith('Dinner'),
              );
            }
          }),
        ),
        CheckboxListTile(
          title: Text('Almuerzo?'),
          subtitle: Text('Seleccionar en caso desee un almuerzo'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
            selectedList.add('Lunch');
            if (!wantsLunch) {
              selectedList.removeWhere(
                (element) => element.startsWith('Lunch'),
              );
            }
          }),
        ),
        Row(
          children: [
            ...selectedList.map((chip) {
              return Chips(title: chip);
            }),
          ],
        ),
      ],
    );
  }
}

class _RadioList extends StatelessWidget {
  const _RadioList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Carro'),
          leading: Radio(value: Transportation.car),
        ),
        ListTile(
          title: Text('Avion'),
          leading: Radio(value: Transportation.plane),
        ),
        ListTile(
          title: Text('Bote'),
          leading: Radio(value: Transportation.boat),
        ),
        ListTile(
          title: Text('Submarino'),
          leading: Radio(value: Transportation.submarine),
        ),
      ],
    );
  }
}

class Chips extends StatelessWidget {
  String title;
  Chips({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: const Text('AB'),
      ),
      label: Text(title),
    );
  }
}
