import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/explore_cubit.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ExploreCubit.get(context);
    return BlocBuilder<ExploreCubit, ExploreState>(

        builder: (context, state)
    {
      switch (state.status) {
        case States.loading:
          return const Center(child: CircularProgressIndicator());
        case States.success:
          return ListView.builder(
            itemCount: state.subjects!.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () =>
                      cubit.doIntent(
                        SubjectClickedIntent(

                          subject: state.subjects![index],
                          args: state.subjects![index], context: context,
                        ),
                      ),
                  child: Container());
            },
          );
          case States.failure:
          return Center(child: Text(state.exception!.toString()));
      }
    });
      }
    }
