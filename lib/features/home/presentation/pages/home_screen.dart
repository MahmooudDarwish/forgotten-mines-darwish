import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtask/core/services/services_locator.dart';
import 'package:webtask/features/home/presentation/manager/home_bloc.dart';
import 'package:webtask/features/home/presentation/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetAllNewsEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title:const Text("24-Hour News Website",style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true),
            body: ConditionalBuilder(
              condition: state.newsList.isNotEmpty,
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    NewsCard(news:state.newsList[index]  ,),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
