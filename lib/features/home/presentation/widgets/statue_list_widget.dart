import 'package:flutter/material.dart';
import 'package:kemetwsr/features/home/presentation/widgets/statue_card_widget.dart';
import '../../data/models/statue_model.dart';
import '../../data/statue_service/statue_service.dart';

class StatueListWidget extends StatefulWidget {
  const StatueListWidget({super.key});

  @override
  State<StatueListWidget> createState() => _StatueListWidgetState();
}

class _StatueListWidgetState extends State<StatueListWidget> {
  late Future<List<StatueModel>> _statuesFuture;
  final StatueService _statueService = StatueService();

  @override
  void initState() {
    super.initState();
    _statuesFuture = _statueService.fetchStatues();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StatueModel>>(
      future: _statuesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No statues found.'));
        }

        final statues = snapshot.data!;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: statues.length,
          itemBuilder: (BuildContext context, int index) {
            final statue = statues[index];
            return StatueCardWidget(statueModel: statue);
          },
        );
      },
    );
  }
}
