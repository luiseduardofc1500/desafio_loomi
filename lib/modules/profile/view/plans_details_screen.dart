import 'package:cine_loomi/modules/auth/widgets/button_account.dart';
import 'package:cine_loomi/modules/profile/widgets/terminate_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansDetailsScreen extends StatelessWidget {
  const PlansDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: theme.colorScheme.secondary,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Subscription'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/register_logo.png',
                width: 132,
                height: 98,
              ),
              SizedBox(
                height: 32,
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.purple),
                title: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.purple),
                title: Text('Consectetur adipiscing elit'),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.purple),
                title: Text('Sed do eiusmod tempor'),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.purple),
                title:
                    Text('Sed do eiusmod tempor Mengo fdfd fdasdfsf afg asdf'),
              ),
              ListTile(
                leading: Icon(Icons.check, color: Colors.purple),
                title: Text(
                    'Sed do eiusmod tempor sdasd flamengo dasfa afdadfad fadfad'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              color: Color.fromRGBO(108, 109, 122, 0.2),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Plan Renewal',
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 14),
                ),
                Text(
                  "Dec 12,2025",
                  style: theme.textTheme.labelMedium
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Divider(
              color: Color.fromRGBO(108, 109, 122, 0.2),
              thickness: 1,
            ),
            SizedBox(
              height: 16,
            ),
            ButtonAccount(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                  ),
                  builder: (BuildContext context) {
                    return TerminatePlan();
                  },
                );
              },
              labelText: 'Terminate Plan',
            ),
          ],
        ),
      ),
    );
  }
}
