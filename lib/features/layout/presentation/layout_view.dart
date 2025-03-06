import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/profile/presentation/view/Screens/profile_screen.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../core/di/di.dart';
import '../../../core/navigation_cubit/navigation_cubit.dart';

import '../../explore_subjects/domain/use_cases/get_subjects_usecase.dart';
import '../../explore_subjects/presentation/cubits/explore_cubit.dart';
import '../../explore_subjects/presentation/views/explore_view.dart';
import '../../profile/domain/repository/profile_repository.dart';
import '../../profile/presentation/view_model/profile_cubit.dart';
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
          BlocProvider(
            create: (context) => ProfileCubit(getIt<ProfileRepository>()),
            child: ProfileScreen(),
          )
        ];
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,

            currentIndex: state.index,
            onTap: (value) => cubit.selectTab(value),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Icon(Icons.home, color: Colors.blue),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit_note, color: Colors.grey),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Icon(Icons.edit_note, color: Colors.blue),
                ),
                label: 'Result',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.grey),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.grey.shade100,
            type: BottomNavigationBarType.fixed,

          ),
          body: screens[state.index],
        );
      },
    );
  }
}
