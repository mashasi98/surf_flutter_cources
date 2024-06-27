import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:surf_flutter_cources/generated/assets.dart';
import 'package:surf_flutter_cources/task-2_1-colors/bloc/color_bloc/color_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/bloc/detailed_color_bloc/detailed_color_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/color_entity.dart';
import 'package:surf_flutter_cources/task-2_1-colors/presentation/detailed_color_screen.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/constant/app_string.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/extensions/string_x.dart';
import 'package:surf_flutter_cources/task-2_1-colors/utils/snak_info.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  void _loadColors() {
    context.read<ColorBloc>().add(LoadColorEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: BlocBuilder<ColorBloc, ColorState>(
        builder: (context, state) {
          if (state is ColorLoadingState) {
            return const _LoadingWidget();
          }
          if (state is ColorLoadedState) {
            return _ContentWidget(
              data: state.colors,
              copiedColor: state.copiedColorValue,
            );
          }
          if (state is ColorErrorState) {
            return const _ErrorWidget();
          }
          if (state is ColorEmptyState) {
            return const _EmptyWidget();
          }
          return const Center(child: Text('Unexpected state'));
        },
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;
  final String? copiedColor;

  const _ContentWidget({
    required this.data,
    required this.copiedColor,
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
          colorData: data[i],
          isHexCopied: data[i].value == copiedColor,
        );
      },
    );
  }
}

class _ColorWidget extends StatelessWidget {
  final ColorEntity colorData;
  final bool isHexCopied;

  const _ColorWidget({
    required this.colorData,
    required this.isHexCopied,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => _moveToDetailedScreen(context, colorData),
      onLongPress: () => _onColorCopy(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Container(
                color: colorData.value.hexToColor(),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            colorData.name,
            style: theme.bodySmall,
          ),
          Row(
            children: [
              Text(
                colorData.value,
                style: theme.bodySmall,
              ),
              if (isHexCopied)
                SvgPicture.asset(
                  Assets.task21CopyColor,
                  height: 12,
                  width: 12,
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _onColorCopy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: colorData.value));
    SnackInfo.showSnack(context);
    context.read<ColorBloc>().add(ColorCopyEvent(colorData.value));
    context
        .read<DetailedColorBloc>()
        .add(DetailedColorCopyEvent(colorValue: colorData.value));
  }

  void _moveToDetailedScreen(BuildContext context, ColorEntity selectedColor) {
    final copiedColor = context.read<ColorBloc>().state is ColorLoadedState
        ? (context.read<ColorBloc>().state as ColorLoadedState).copiedColorValue
        : null;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => DetailedColorBloc(),
          child: DetailedColorScreen(color: selectedColor, copiedColor: copiedColor),
        ),
      ),
    );
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
