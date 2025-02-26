import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../core/di/di.dart';
import '../../../core/navigation_cubit/navigation_cubit.dart';

import '../../explore_subjects/domain/use_cases/get_subjects_usecase.dart';
import '../../explore_subjects/presentation/cubits/explore_cubit.dart';
import '../../explore_subjects/presentation/explore_view.dart';
import '../../result/presentation/result_view.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final NavigationCubit cubit = NavigationCubit.get(context);
        final List<Widget> screens = [
          BlocProvider(
            create:
                (context) =>
                    ExploreCubit(getIt<GetSubjectsUseCase>())
                      ..doIntent(LoadSubjectsIntent()),
            child: ExploreView(),
          ),
          ResultView(),
        ];
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,

            currentIndex: state.index,
            onTap: (value) => cubit.selectTab(value),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_sharp),
                label: "Result",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
          body: screens[state.index],
        );
      },
    );
  }
}
