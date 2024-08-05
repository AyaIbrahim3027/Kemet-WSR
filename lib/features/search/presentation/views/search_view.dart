import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:kemetwsr/core/utils/resources/app_style.dart';
import 'package:kemetwsr/features/home/data/models/statue_model.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../home/data/statue_service/statue_service.dart';
import '../widgets/custom_text_form_field_widget.dart';
import '../widgets/search_icon_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<StatueModel> statues;
  late TextEditingController searchController;
  List<StatueModel> filteredStatue = [];
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    fetchStatues();
  }

  Future<void> fetchStatues() async {
    try {
      statues = await StatueService().fetchStatues();
      setState(() {
        filteredStatue = statues;
      });
    } catch (e) {
      setState(() {});
      print('Failed to fetch statues: $e');
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterStatues(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredStatue = statues;
        isSearch = false;
      });
    } else {
      List<StatueModel> filteredList = [];
      for (var statue in statues) {
        final nameRatio = ratio(statue.name.toLowerCase(), query.toLowerCase());
        final civNameRatio =
            ratio(statue.civilizationName.toLowerCase(), query.toLowerCase());
        if (nameRatio > 35 || civNameRatio > 35) {
          filteredList.add(statue);
        }
      }
      setState(() {
        filteredStatue = filteredList;
        isSearch = true;
      });
    }
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      filteredStatue = statues;
      isSearch = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldWidget(
          prefixIcon: const SearchIconWidget(),
          suffixIcon: isSearch
              ? IconButton(
                  onPressed: clearSearch,
                  icon: Icon(
                    FontAwesomeIcons.xmark,
                    size: AppSize.s20,
                    color: ColorManager.black.withOpacity(AppOpacity.op0_7),
                  ))
              : null,
          hintText: StringsManager.searchHintText,
          fillColor: ColorManager.beige.withOpacity(AppOpacity.op0_4),
          controller: searchController,
          borderRadius: isSearch
              ? const BorderRadius.vertical(top: Radius.circular(10))
              : BorderRadius.circular(10),
          onChanged: filterStatues,
        ),
        isSearch
            ? Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.beige.withOpacity(AppOpacity.op0_1),
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(AppSize.s10)),
                  border: Border(
                    top: BorderSide(
                      color: ColorManager.black.withOpacity(AppOpacity.op0_3),
                      width: 1.0,
                    ),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredStatue.length,
                  itemBuilder: (context, index) {
                    final statue = filteredStatue[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p8),
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            child: Image.network(statue.image)),
                        title: Text(
                          statue.name,
                          style: AppStyles.styleMedium16(context),
                        ),
                        subtitle: Text(statue.epoch),
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kDetailsView, extra: statue);
                          setState(() {
                            searchController.clear();
                            isSearch = false;
                          });
                        },
                      ),
                    );
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
