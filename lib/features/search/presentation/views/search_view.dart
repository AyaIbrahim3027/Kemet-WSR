import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:go_router/go_router.dart';
import 'package:kemetwsr/core/utils/resources/color_manager.dart';
import 'package:kemetwsr/core/utils/resources/strings_manager.dart';
import 'package:kemetwsr/features/search/presentation/widgets/search_icon_widget.dart';
import 'package:overlay_search/overlay_search.dart';
import '../../../../app/app_router.dart';
import '../../../../core/utils/resources/app_style.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../home/data/models/statue_model.dart';
import '../../../home/data/statue_service/statue_service.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late OverlaySearchController overlayController;
  late List<StatueModel> statues;
  late TextEditingController searchController;
  List<StatueModel> filteredStatue = [];
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    overlayController = OverlaySearchController();
    fetchStatues();
  }

  Future<void> fetchStatues() async {
    try {
      statues = await StatueService().fetchStatues();
      setState(() {
        filteredStatue = statues;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch statues: $e')),
      );
    }
  }

  void filterStatues(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredStatue = statues;
        isSearch = false;
      });
    } else {
      final filteredList = statues.where((statue) {
        final nameRatio = ratio(statue.name.toLowerCase(), query.toLowerCase());
        return nameRatio > 10;
      }).toList();
      setState(() {
        filteredStatue = filteredList;
        isSearch = true;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    overlayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchWithList(
      overlaySearchController: overlayController,
      searchBackgroundColor: ColorManager.beige.withOpacity(AppOpacity.op0_2),
      list: filteredStatue
          .map((statue) => OverlayItemModel(
                title: statue.name,
                content: statue.epoch,
                image: statue.image,
                leadingWidget: Container(
                  width: AppSize.s50,
                  height: AppSize.s50,
                  decoration: BoxDecoration(
                      color: ColorManager.black.withOpacity(AppOpacity.op0_02),
                      borderRadius: BorderRadius.circular(AppSize.s10),
                      image: DecorationImage(
                        image: NetworkImage(statue.image),
                      )),
                ),
              ))
          .toList(),
      overlayBackgroundColor: ColorManager.lightBeige,
      hint: StringsManager.searchHintText,
      hintStyle: AppStyles.styleMedium14(context).copyWith(
        color: ColorManager.black.withOpacity(AppOpacity.op0_6),
      ),
      titleStyle: AppStyles.styleRegular17(context),
      contentStyle: AppStyles.styleRegular15(context)
          .copyWith(color: ColorManager.black.withOpacity(AppOpacity.op0_8)),
      suffixAction: () {
        overlayController.hideOverlay();
        overlayController.clearSearchQuery();
      },
      prefixIcon: const SearchIconWidget(),
      suffixIcon: FontAwesomeIcons.xmark,
      iconColor: ColorManager.brown,
      overlayHeight: MediaQuery.of(context).size.height * 0.43,
      onItemSelected: (item) {
        final selectedStatue = filteredStatue.firstWhere(
          (statue) => statue.name == item.title,
        );
        GoRouter.of(context)
            .push(AppRouter.kDetailsView, extra: selectedStatue);
      },
      enableDebounce: true,
      debounceDuration: const Duration(milliseconds: 500),
      onChanged: (value) {
        filterStatues(value);
      },
      onTap: () {
        fetchStatues();
      },
    );
  }
}
