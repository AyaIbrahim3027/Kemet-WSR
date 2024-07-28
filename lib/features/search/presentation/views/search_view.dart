import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kemetwsr/features/home/data/models/statue_model.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../home/data/statue_service/statue_service.dart';
import '../widgets/custom_text_form_field_widget.dart';

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
      List<StatueModel> filteredList = statues.where((statue) {
        return statue.name.toLowerCase().contains(query.toLowerCase()) ||
            statue.civilizationName.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() {
        filteredStatue = filteredList;
        isSearch = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFieldWidget(
          prefixIcon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: AppSize.s20,
          ),
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
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10)),
                  border: Border(
                    top: BorderSide(
                      color: ColorManager.black.withOpacity(0.3),
                      width: 1.0,
                    ),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredStatue.length,
                  // itemCount: state.statues.length,
                  itemBuilder: (context, index) {
                    final statue = filteredStatue[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(statue.image)),
                        title: Text(statue.name),
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
