import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../GeneralComponents/Custom_App_bar.dart';
import '../../../../../GeneralComponents/Custom_Card_Widget.dart';
import '../../../../../Provider/contractor_provider.dart';

class CategoryPage extends StatefulWidget {
  final String email;
  final String number;
  final String name;
  final String category;
  final String local;

  CategoryPage({
    required this.email,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
  });

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ContractorProvider>(context, listen: false).fetchContractors(widget.category);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      body: Consumer<ContractorProvider>(
        builder: (context, contractorProvider, child) {
          if (contractorProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (contractorProvider.errorMessage != null) {
            return Center(child: Text(contractorProvider.errorMessage!));
          } else if (contractorProvider.contractors.isEmpty) {
            return Center(child: Text('No contractors found.'));
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: contractorProvider.contractors.map((contractor) {
                  return CustomCard(
                    image: Image.asset('assets/2.png'),
                    email: contractor.email,
                    desc: 'This is an example description for ${contractor.userName}, working for 20 years.',
                    number: contractor.number,
                    name: contractor.userName,
                    category: contractor.service_type,
                    local: contractor.address,
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
