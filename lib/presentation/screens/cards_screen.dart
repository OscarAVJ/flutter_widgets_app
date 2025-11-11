import 'package:flutter/material.dart';

const cardsMap = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevacion 0', 'icon': Icons.ad_units},
  {'elevation': 1.0, 'label': 'Elevacion 1', 'icons': Icons.settings},
  {'elevations': 1.0, 'labels': 'Elevacion 1', 'icos': Icons.settings},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards screen")),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ...cardsMap.map(
              (card) => _CardType1(
                elevation: card['elevation'] ?? 0.0,
                name: card['label'] ?? 'No hay un nombre asignado',
                icon: card['icon'] ?? Icons.question_mark_outlined,
              ),
            ),
            ...cardsMap.map(
              (card) => _CardTypeBordered(
                label: card['label'] ?? 'No hay un nombre asignado',
                icon: card['icon'] ?? Icons.question_mark_outlined,
                elevation: card['elevation'] ?? 0.0,
              ),
            ),
            ...cardsMap.map(
              (card) => _CardTypeFilled(
                label: card['label'] ?? 'No hay un nombre asignado',
                icon: card['icon'] ?? Icons.question_mark_outlined,
                elevation: card['elevation'] ?? 0.0,
              ),
            ),
            ...cardsMap.map(
              (card) => _CardWithImage(
                label: card['label'] ?? 'No hay un nombre asignado',
                icon: card['icon'] ?? Icons.question_mark_outlined,
                elevation: card['elevation'] ?? 0.0,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elevation;
  final String name;
  final IconData icon;
  const _CardType1({
    required this.elevation,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: IconButton(onPressed: () {}, icon: Icon(icon)),
            ),
            Align(alignment: AlignmentGeometry.bottomLeft, child: Text(name)),
          ],
        ),
      ),
    );
  }
}

///Jugar con el shape de la tarjeta
class _CardTypeBordered extends StatelessWidget {
  final String label;
  final IconData icon;
  final double elevation;

  const _CardTypeBordered({
    required this.label,
    required this.icon,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline, style: BorderStyle.solid),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Row(
          children: [
            Align(alignment: AlignmentGeometry.topLeft, child: Text(label)),
            Spacer(),
            Align(alignment: AlignmentGeometry.centerRight, child: Icon(icon)),
          ],
        ),
      ),
    );
  }
}

///Card type filled

class _CardTypeFilled extends StatelessWidget {
  final String label;
  final IconData icon;
  final double elevation;

  const _CardTypeFilled({
    required this.label,
    required this.icon,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surface,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.outline, style: BorderStyle.solid),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Row(
          children: [
            Align(alignment: AlignmentGeometry.topLeft, child: Text(label)),
            Spacer(),
            Align(alignment: AlignmentGeometry.centerRight, child: Icon(icon)),
          ],
        ),
      ),
    );
  }
}

///Card type image/stack/button

class _CardWithImage extends StatelessWidget {
  final String label;
  final IconData icon;
  final double elevation;
  const _CardWithImage({
    required this.label,
    required this.icon,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            fit: BoxFit.cover,
            height: 350,
            semanticLabel: label,
          ),
          Align(
            alignment: AlignmentGeometry.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(onPressed: () {}, icon: Icon(icon)),
            ),
          ),
        ],
      ),
    );
  }
}
