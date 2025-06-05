import 'package:flutter/material.dart';
import 'package:hero/hero/detail_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GridView.builder(
        itemCount: 190,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (content, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder:
                      (_, __, ___) => DetailScreen(
                        callback: () {},
                        index: index,
                        child: Container(color: getColorByIndex(index)),
                      ),
                ),
              );
            },
            child: Hero(
              tag: "Hero$index",
              child: Container(color: getColorByIndex(index)),
            ),
          );
        },
      ),
    );
  }

  Color getColorByIndex(int index) {
    final totalPrimaryColors = Colors.primaries.length * primaryShades.length;
    final totalAccentColors = Colors.accents.length * accentShades.length;
    final totalColors = totalPrimaryColors + totalAccentColors;

    final adjustedIndex = index % totalColors;

    if (adjustedIndex < totalPrimaryColors) {
      final materialIndex = adjustedIndex ~/ primaryShades.length;
      final shadeIndex = adjustedIndex % primaryShades.length;
      return Colors.primaries[materialIndex][primaryShades[shadeIndex]]!;
    } else {
      final accentOffset = adjustedIndex - totalPrimaryColors;
      final accentIndex = accentOffset ~/ accentShades.length;
      final shadeIndex = accentOffset % accentShades.length;
      return Colors.accents[accentIndex][accentShades[shadeIndex]]!;
    }
  }

  static const List<int> primaryShades = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
  ];

  static const List<int> accentShades = [100, 200, 400, 700];
}
