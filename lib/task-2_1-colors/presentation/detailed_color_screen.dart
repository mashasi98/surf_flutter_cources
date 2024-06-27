import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_cources/generated/assets.dart';
import 'package:surf_flutter_cources/task-2_1-colors/bloc/color_bloc/color_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/bloc/detailed_color_bloc/detailed_color_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/color_entity.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/rgb_type.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/constant/app_string.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/extensions/string_x.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/snak_info.dart';

class DetailedColorScreen extends StatefulWidget {
  final ColorEntity color;
  final String? copiedColor;

  const DetailedColorScreen({super.key, required this.color, this.copiedColor});

  @override
  State<DetailedColorScreen> createState() => _DetailedColorScreenState();
}

class _DetailedColorScreenState extends State<DetailedColorScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorBoxHeight = height / 2;
    final preferredSizeHeight = colorBoxHeight - kToolbarHeight;
    final theme = Theme.of(context).textTheme;

    return BlocBuilder<DetailedColorBloc, DetailedColorState>(
      builder: (context, state) {
        final isHexCopied = widget.copiedColor == widget.color.value;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: SvgPicture.asset(
                Assets.task21ArrowBack,
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
              child: ColoredBox(color: widget.color.value.hexToColor()),
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
                  widget.color.name,
                  style: theme.displayLarge,
                ),
                const SizedBox(height: 20),
                _RoundShadowBoxWidget(
                  label: AppString.hex,
                  value: widget.color.value,
                  longPressAction: () {
                    BlocProvider.of<ColorBloc>(context)
                        .add(ColorCopyEvent(widget.color.value));
                    BlocProvider.of<DetailedColorBloc>(context).add(
                      DetailedColorCopyEvent(
                          colorValue: widget.color.value),
                    );
                    SnackInfo.showSnack(context);
                    Clipboard.setData(ClipboardData(text: widget.color.value));
                  },
                  isCopied: isHexCopied || (state is DetailedColorCopyState && state.colorValue == widget.color.value),
                ),
                const SizedBox(height: 20),
                _RgbWidget(
                  color: widget.color.value.hexToColor(),
                  copiedColor: state is DetailedColorCopyState ? state.colorValue : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RgbWidget extends StatelessWidget {
  final Color color;
  final String? copiedColor;

  const _RgbWidget({required this.color, required this.copiedColor});

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
              longPressAction: () {
                final colorValue = color.value.toRadixString(16).padLeft(6, '0');
                BlocProvider.of<DetailedColorBloc>(context).add(
                  DetailedColorCopyEvent(colorValue: colorValue),
                );
              },
              isCopied: copiedColor == color.value.toRadixString(16).padLeft(6, '0'),
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
  final bool isCopied;

  const _RoundShadowBoxWidget({
    required this.label,
    required this.value,
    required this.longPressAction,
    required this.isCopied,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onLongPress: longPressAction,
      child: SizedBox(
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
                if (isCopied)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(
                      Assets.task21CopyColor,
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
