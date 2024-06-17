import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/extensions/string_x.dart';

import '../../constant/app_string.dart';
import '../domain/entity/color_entity.dart';
import '../main.dart';
import '../utils/snak_info.dart';
import 'detailed_color_screen.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenSate();
}

class _ColorsScreenSate extends State<ColorsScreen> {
  Future<List<ColorEntity>>? _data;
  String? _copiedColor;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = colorRepository.getColors();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppString.appBarTitleColorScreen,
              style: theme.displayLarge,
              maxLines: 2,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<ColorEntity>>(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const _ErrorWidget();
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return data != null
                  ? _ContentWidget(
                      data: data,
                      copiedColor: _copiedColor,
                      onColorCopied: _onColorCopied,
                    )
                  : const _EmptyWidget();
            }
          }
          return const _LoadingWidget();
        },
      ),
    );
  }

  void _onColorCopied(String color) {
    setState(() {
      _copiedColor = color;
    });
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    const List<Color> kDefaultRainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];
    return const Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: LoadingIndicator(
          colors: kDefaultRainbowColors,
          strokeWidth: 1.0,
          pathBackgroundColor: Colors.black45,
          indicatorType: Indicator.ballGridPulse,
        ),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppString.emptyStateColorsScreen),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppString.errorStateColorsScreen),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;
  final String? copiedColor;
  final ValueChanged<String> onColorCopied;

  const _ContentWidget({
    required this.data,
    required this.copiedColor,
    required this.onColorCopied,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 35,
        crossAxisSpacing: 22,
        childAspectRatio: 0.75,
        crossAxisCount: 3,
      ),
      itemCount: data.length,
      itemBuilder: (_, i) {
        return _ColorWidget(
          key: ValueKey(data[i].value),
          colorData: data[i],
          isHexCopied: data[i].value == copiedColor,
          onColorCopied: onColorCopied,
        );
      },
    );
  }
}

class _ColorWidget extends StatefulWidget {
  final ColorEntity colorData;
  final bool isHexCopied;
  final ValueChanged<String> onColorCopied;

  const _ColorWidget({
    required Key key,
    required this.colorData,
    required this.isHexCopied,
    required this.onColorCopied,
  }) : super(key: key);

  @override
  State<_ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<_ColorWidget> {
  bool _isHexCopied = false;

  @override
  void didUpdateWidget(covariant _ColorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isHexCopied != oldWidget.isHexCopied) {
      setState(() {
        _isHexCopied = widget.isHexCopied;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: GestureDetector(
        onTap: () => _onColorTap(context),
        onLongPress: _copyColorHex,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Container(
                  color: widget.colorData.value.hexToColor(),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.colorData.name,
              style: theme.bodySmall,
            ),
            Row(
              children: [
                Text(
                  widget.colorData.value,
                  style: theme.bodySmall,
                ),
                if (_isHexCopied)
                  SvgPicture.asset(
                    AppString.copyIcon,
                    height: 12,
                    width: 12,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onColorTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailedColorScreen(colorData: widget.colorData),
      ),
    );
  }

  void _copyColorHex() {
    Clipboard.setData(ClipboardData(text: widget.colorData.value));
    widget.onColorCopied(widget.colorData.value);
    SnackInfo.showSnack(context);
  }
}
