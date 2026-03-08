import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters_cubit.dart';
import '../../constants/strings.dart';
// استورد الموديل والكيوبيت الخاص بك

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty Characters"),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(settingsScreen);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CharactersSuccess) {
            final characterData = state.character; // هذا هو الموديل (Character)
            final results = characterData.results; // قائمة الشخصيات
            final info = characterData.info; // معلومات الصفحات

            return Column(
              children: [
                // 1. عرض قائمة الشخصيات
                Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          // الانتقال لصفحة التفاصيل مع تمرير بيانات الشخصية الحالية
                          Navigator.pushNamed(
                            context,
                            chracterDetailsScreen, // الثابت المعرف في strings.dart
                            arguments: results[index],
                          );
                        },
                        leading: Hero(
                          tag: results[index]
                              .id, // يجب أن يكون نفس الـ tag في صفحة التفاصيل
                          child: CachedNetworkImage(
                            imageUrl: results[index].image,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(backgroundImage: imageProvider),
                          ),
                        ),
                        title: Text(results[index].name),
                        subtitle: Text(
                          "${results[index].status.name} - ${results[index].species.name}",
                        ),
                      );
                    },
                  ),
                ),

                // 2. أزرار الـ Pagination
                Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.blueGrey.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // زر السابق
                      ElevatedButton(
                        onPressed: info.prev == null
                            ? null
                            : () {
                                // نطلب الصفحة السابقة من الكيوبيت
                                context.read<CharactersCubit>().getCharacters(
                                  info.prev!,
                                );
                              },
                        child: const Text("Previous"),
                      ),

                      // عرض إحصائية بسيطة
                      Text("Total: ${info.count}"),

                      // زر التالي
                      ElevatedButton(
                        onPressed: (info.next == null)
                            ? null
                            : () {
                                // نطلب الصفحة التالية من الكيوبيت
                                context.read<CharactersCubit>().getCharacters(
                                  info.next!,
                                );
                              },
                        child: const Text("Next"),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          if (state is CharactersError) {
            return Center(child: Text(state.errorMessage));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
