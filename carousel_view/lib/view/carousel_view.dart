import 'dart:developer';

import 'package:carousel_view/view/uncontained_layout_card.dart';
import 'package:flutter/material.dart';
import 'card_info.dart';
import 'hero_layout_card.dart';
import 'image_info.dart' as imi;

class CarouselExampleApp extends StatelessWidget {
  const CarouselExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.cast),
        ),
        title: const Text('Flutter TV'),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.0),
            child: CircleAvatar(child: Icon(Icons.account_circle)),
          ),
        ],
      ),
      body: const CarouselExample(),
    );
  }
}

class CarouselExample extends StatefulWidget {
  const CarouselExample({super.key});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final List<imi.ImageInfo> heroLayoutCars = imi.ImageInfo.values;

    return ListView(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height / 2),
          child: CarouselView.weighted(
            onTap: (index) {
              log("CarouselView $index");
            },
            controller: controller,
            itemSnapping: true,
            flexWeights: const <int>[1, 7, 1],
            children:
                heroLayoutCars.map((image) {
                  return HeroLayoutCard(imageInfo: image);
                }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsetsDirectional.only(top: 8.0, start: 8.0),
          child: Text('Multi-browse layout'),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 50),
          child: CarouselView.weighted(
            flexWeights: const <int>[1, 2, 3, 2, 1],
            consumeMaxWeight: false,
            //consumeMaxWeight : 양 끝 항목들이 최대 크기로 커질수 있는지 양 끝에 있는
            //false 로 설정하면 항목들이 중앙에 올 수 없다.
            children: List<Widget>.generate(20, (int index) {
              return ColoredBox(
                color: Colors.primaries[index % Colors.primaries.length]
                    .withValues(alpha: 0.8),
                child: const SizedBox.expand(),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: CarouselView.weighted(
            flexWeights: const <int>[3, 3, 3, 2, 1],
            consumeMaxWeight: false,
            children:
                CardInfo.values.map((CardInfo info) {
                  return ColoredBox(
                    color: info.backgroundColor,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(info.icon, color: info.color, size: 32.0),
                          Text(
                            info.label,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.clip,
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsetsDirectional.only(top: 8.0, start: 8.0),
          child: Text('Uncontained layout'),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: CarouselView(
            itemExtent: 330,
            shrinkExtent: 200,
            //축소 될 수 있는 최소 픽셀
            children: List<Widget>.generate(20, (int index) {
              return UncontainedLayoutCard(index: index, label: 'Show $index');
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
