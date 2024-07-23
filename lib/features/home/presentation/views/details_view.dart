import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:kemetwsr/features/home/presentation/widgets/details_view_body_widget.dart';
import '../../../../core/utils/functions/buildAppBar.dart';
import '../widgets/expandable_fab_button_widget.dart';
import '../../data/models/statue_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.statueModel});

  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context: context, text: statueModel.name),
        body: DetailsViewBodyWidget(
          statueModel: statueModel,
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFabButtonWidget(
          statueModel: statueModel,
        ),
      ),
    );
  }
}
