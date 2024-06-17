import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_cources/constant/app_string.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/color_entity.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/rgb_type.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/extensions/string_x.dart';

import '../utils/snak_info.dart';

class DetailedColorScreen extends StatefulWidget {
  final ColorEntity colorData;

  const DetailedColorScreen({
    super.key,
    required this.colorData,
  });

  @override
  State<DetailedColorScreen> createState() => _DetailedColorScreenState();
}

class _DetailedColorScreenState extends State<DetailedColorScreen> {
  bool _isHexCopied = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorBoxHeight = height / 2;
    final preferredSizeHeight = colorBoxHeight - kToolbarHeight;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppString.arrowBackIcon,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: kToolbarHeight,
        flexibleSpace: SizedBox(
          height: colorBoxHeight,
          width: double.infinity,
          child: ColoredBox(
            color: widget.colorData.value.hexToColor(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSizeHeight),
          child: const SizedBox.shrink(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.colorData.name,
              style: theme.displayLarge,
            ),
            const SizedBox(height: 20),
            _RoundShadowBoxWidget(
              label: AppString.hex,
              value: widget.colorData.value.hexToColorName(),
              longPressAction: _onLongPress,
              isHexCopied: _isHexCopied,
            ),
            const SizedBox(height: 20),
            _RgbWidget(
              color: widget.colorData.value.hexToColor(),
              longPressAction: _onLongPress,
            ),
          ],
        ),
      ),
    );
  }

  void _onLongPress() {
    Clipboard.setData(ClipboardData(text: widget.colorData.value));
    setState(() {
      _isHexCopied = true;
    });
    SnackInfo.showSnack(context);
  }
}

class _RgbWidget extends StatelessWidget {
  final Color color;
  final VoidCallback longPressAction;

  const _RgbWidget({required this.color, required this.longPressAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: RgbType.values
          .expandIndexed(
            (i, currentType) => [
              Expanded(
                child: _RoundShadowBoxWidget(
                  label: currentType.name,
                  value: switch (currentType) {
                    RgbType.red => color.red.toString(),
                    RgbType.blue => color.blue.toString(),
                    RgbType.green => color.green.toString(),
                  },
                  longPressAction: longPressAction,
                  isHexCopied: false,
                ),
              ),
              if (i != RgbType.values.length - 1) const SizedBox(width: 20),
            ],
          )
          .toList(),
    );
  }
}

class _RoundShadowBoxWidget extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback longPressAction;
  final bool isHexCopied;

  const _RoundShadowBoxWidget({
    required this.label,
    required this.value,
    required this.longPressAction,
    required this.isHexCopied,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 7),
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onLongPress: longPressAction,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    label,
                    style: theme.bodyMedium,
                  ),
                ),
                Text(
                  value,
                  style: theme.bodyMedium,
                ),
                if (isHexCopied)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      AppString.copyIcon,
                      height: 12,
                      width: 12,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
