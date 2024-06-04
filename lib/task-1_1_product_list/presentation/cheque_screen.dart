import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/presentation/empty_screen.dart';

import '../domain/entity/cheque_entity.dart';
import '../main.dart';

class ChequeScreen extends StatefulWidget {
  final int id;

  const ChequeScreen({super.key, required this.id});

  @override
  _ChequeScreenState createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {
  Future<ChequeEntity>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = shoppingListRepository.getCheque(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChequeEntity>(
      future: _data,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          }else if(snapshot.hasData){
            final data = snapshot.data;
            return data != null ? _ContentWidget(data: data) : const EmptyScreen();
          }
        }
        return const _LoadWidget();
      },
    );
  }
}

class _LoadWidget extends StatelessWidget {
  const _LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Произошла  ошибкка"),
    );
  }
}
