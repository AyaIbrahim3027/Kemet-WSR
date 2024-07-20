import 'package:flutter/material.dart';
import 'package:kemetwsr/features/home/presentation/widgets/details_view_body_widget.dart';
import '../../../../core/utils/functions/buildAppBar.dart';
import '../../data/models/statue_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.statueModel});

  final StatueModel statueModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(text: statueModel.name),
        body: DetailsViewBodyWidget(
          statueModel: statueModel,
        ),
      ),
    );
  }
}
