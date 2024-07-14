import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/generated/assets.dart';
import 'package:surf_flutter_cources/task-4_1_galery/domain/entity/photo_entity.dart';
import 'package:surf_flutter_cources/task-4_1_galery/main.dart';
import 'package:surf_flutter_cources/task-4_1_galery/utils/constant/app_strings.dart';
import 'package:union_state/union_state.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<StatefulWidget> {
  final screenSate = UnionStateNotifier<List<PhotoEntity>>.loading();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final data = await photoRepository.getPhotos();
      screenSate.content(data);
    } on Exception catch (ex) {
      screenSate.failure(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Assets.task41Logo),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: UnionStateListenableBuilder<List<PhotoEntity>>(
        unionStateListenable: screenSate,
        loadingBuilder: (_, __) => const _LoadingWidget(),
        builder: (_, state) => state.isNotEmpty
            ? _ContentWidget(data: state)
            : const _EmptyWidget(),
        failureBuilder: (_, __, ___) => const _ErrorWidget(),
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<PhotoEntity> data;

  const _ContentWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 3,
      ),
      itemCount: data.length,
      itemBuilder: (_, i) => _PhotoWidget(
        indexSelectedPhoto: i,
        photoList: data,
      ),
    );
  }
}

class _PhotoWidget extends StatefulWidget {
  final int indexSelectedPhoto;
  final List<PhotoEntity> photoList;

  const _PhotoWidget(
      {required this.indexSelectedPhoto, required this.photoList});

  @override
  State<_PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<_PhotoWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    // TODO: доделать красивый лоадер
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.errorColorScreen),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.emptyStateColorScreen),
    );
  }
}
