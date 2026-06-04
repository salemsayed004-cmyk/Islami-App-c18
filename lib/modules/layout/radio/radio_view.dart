// ===========================================================================
// radio_view.dart
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/modules/layout/radio/radio_cubit.dart';
import 'package:islami/modules/layout/radio/radio_di.dart';
import 'package:islami/modules/layout/radio/radio_state.dart';
import 'package:islami/modules/layout/radio/radio_status_widgets.dart';
import 'package:islami/modules/layout/radio/radio_tab_bar.dart';
import '../../../core/gen/assets.gen.dart';
import 'audio_card.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  static const String routeName = '/radio';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => buildRadioCubit()..init(),
      child: const _RadioScreen(),
    );
  }
}

class _RadioScreen extends StatefulWidget {
  const _RadioScreen();

  @override
  State<_RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<_RadioScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        // إعداد صورة الخلفية الأساسية للشاشة
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/RadioBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent, // مهم جداً عشان الخلفية تظهر
          body: BlocBuilder<RadioCubit, RadioState>(
            builder: (context, state) {
              return Column(
                children: [
                  const _IslamiHeader(),
                  Expanded(
                    child: switch (state) {
                      RadioInitial() || RadioLoading() => _buildLoading(state),
                      RadioError()  => _buildError(context, state),
                      RadioLoaded() => _buildLoaded(context, state),
                      _             => _buildLoading(state),
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading(RadioState state) {
    return Column(
      children: [
        RadioTabBar(activeTab: RadioTab.radio, onTabChanged: (_) {}),
        const Expanded(child: RadioLoadingWidget()),
      ],
    );
  }

  Widget _buildError(BuildContext context, RadioError state) {
    return RadioErrorWidget(
      message: state.message,
      onRetry: () => context.read<RadioCubit>().refresh(),
    );
  }

  Widget _buildLoaded(BuildContext context, RadioLoaded state) {
    final cubit = context.read<RadioCubit>();
    return Column(
      children: [
        RadioTabBar(activeTab: state.activeTab, onTabChanged: cubit.switchTab),
        Expanded(
          child: RefreshIndicator(
            color: const Color(0xFFE2BE7F),
            backgroundColor: const Color(0xFF1A1209),
            onRefresh: cubit.refresh,
            child: state.activeTab == RadioTab.radio
                ? _RadioList(state: state, cubit: cubit)
                : _ReciterList(state: state, cubit: cubit),
          ),
        ),
      ],
    );
  }
}

// الـ Header الجديد الشفاف بناءً على الـ Figma
class _IslamiHeader extends StatelessWidget {
  const _IslamiHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Assets.images.imgHeader.image(width: 291,height: 171),
    );
  }
}

// _RadioList, _ReciterList, و _EmptyState تفضل زي ما هي بالظبط بدون تعديل.
// (انسخهم من الكود القديم الخاص بيك هنا)
class _RadioList extends StatelessWidget {
  const _RadioList({required this.state, required this.cubit});
  final RadioLoaded state;
  final RadioCubit cubit;

  @override
  Widget build(BuildContext context) {
    final stations = state.stations;
    if (stations.isEmpty) return const SizedBox.shrink(); // أو الـ EmptyState

    return ListView.builder(
      padding: const EdgeInsets.only(top: 4, bottom: 24),
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: stations.length,
      itemBuilder: (_, i) {
        final s = stations[i];
        final playing = state.isPlayingStation(s);
        return AudioCard(
          key: ValueKey('radio_${s.id}'),
          index: i,
          data: AudioCardData(id: 'radio_${s.id}', title: s.name),
          isPlaying: playing,
          isBuffering: playing && state.isBuffering,
          isMuted: state.isMuted,
          onPlayTap: () => cubit.toggleRadioStation(s),
          onMuteTap: cubit.toggleMute,
        );
      },
    );
  }
}

class _ReciterList extends StatelessWidget {
  const _ReciterList({required this.state, required this.cubit});
  final RadioLoaded state;
  final RadioCubit cubit;

  @override
  Widget build(BuildContext context) {
    final reciters = state.reciters;
    if (reciters.isEmpty) return const SizedBox.shrink();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 4, bottom: 24),
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: reciters.length,
      itemBuilder: (_, i) {
        final r = reciters[i];
        final playing = state.isPlayingReciter(r);
        return AudioCard(
          key: ValueKey('reciter_${r.id}'),
          index: i,
          data: AudioCardData(id: 'reciter_${r.id}', title: r.name),
          isPlaying: playing,
          isBuffering: playing && state.isBuffering,
          isMuted: state.isMuted,
          onPlayTap: () => cubit.toggleReciter(r),
          onMuteTap: cubit.toggleMute,
        );
      },
    );
  }
}