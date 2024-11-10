import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/enum/gender_type.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/perfume.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/repository/perfume_repository.dart';
import 'package:surf_flutter_cources/fragnence_app/presentation/empty_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<Perfume>>? _data;

  Future<void> _load() async {
    _data = PerfumeRepository().getPerfumes();
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Perfume>>(
      future: _data,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return _ErrorWidget();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          return data != null
              ? MainWidget(perfumes: data)
              : const EmptyScreen();
        }
        return _LoadingWidget();
      },
    );
  }
}

class MainWidget extends StatefulWidget {
  final List<Perfume> perfumes;

  const MainWidget({super.key, required this.perfumes});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    final int perfumeCount = widget.perfumes.length;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('FRAGNIFICA'),
              ),
            ),
            const SliverToBoxAdapter(
              child: SearchWidget(),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            const SliverToBoxAdapter(
              child: NewsWidget(),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            const SliverToBoxAdapter(
              child: CategoryWidget(),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 20)),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CategoryTextButton(
                          onPressed: null, type: GenderType.unisex),
                      SizedBox(width: 5),
                      CategoryTextButton(
                          onPressed: null, type: GenderType.male),
                      SizedBox(width: 5),
                      CategoryTextButton(
                          onPressed: null, type: GenderType.female),
                    ],
                  ),
                ],
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return ItemImageContainer(
                  image: widget.perfumes[index].image,
                  title: widget.perfumes[index].title,
                  price: widget.perfumes[index].price.toString(),
                  onPressed: () {},
                );
              },
              itemCount: perfumeCount,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Main notes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: null,
                  child: Row(
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MainNotesContainer(
                  image: 'assets/images/frag/parfume_note/GreenApple.jpg',
                  text: 'Fruity'),
              MainNotesContainer(
                  image: 'assets/images/frag/parfume_note/Rose.jpg',
                  text: 'Floral'),
              MainNotesContainer(
                  image: 'assets/images/frag/parfume_note/Vanilla.jpg',
                  text: 'Gurman'),
              MainNotesContainer(
                  image: 'assets/images/frag/parfume_note/Cedarwood.jpg',
                  text: 'Wooden'),
            ],
          )
        ],
      ),
    );
  }
}

class MainNotesContainer extends StatelessWidget {
  final String image;
  final String text;

  const MainNotesContainer({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipOval(
          child: Image.asset(
            image,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        Text(text)
      ],
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey,
        image: const DecorationImage(
            image: AssetImage(
              'assets/images/frag/Fragrance.jpeg',
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.colorDodge,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              )),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(
                color: Colors.black,
                width: 1,
              )),
          child: const IconButton(
            onPressed: null,
            icon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

class ItemImageContainer extends StatelessWidget {
  final String? image;
  final String title;
  final String price;
  final VoidCallback? onPressed;

  const ItemImageContainer({
    required this.image,
    required this.onPressed,
    required this.title,
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  image ?? 'assets/images/frag/parfume_note/GreenApple.jpg',
                  height: 500,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xFF0A0808),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '$price \$',
            style: const TextStyle(
              color: Color(0xFF0A0808),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final GenderType type;

  const CategoryTextButton({
    required this.onPressed,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.grey),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Text(
        type.title,
        style: const TextStyle(color: Colors.black, fontSize: 10),
      ),
    );
  }
}
