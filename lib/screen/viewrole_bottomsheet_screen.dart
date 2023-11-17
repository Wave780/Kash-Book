import 'package:flutter/material.dart';

import 'package:kashbook_app/utils/extension.dart';
import 'package:kashbook_app/utils/utils.dart';
import 'package:kashbook_app/widgets/roleinfo_container.dart';

class ViewRoleBottomSheetScreen extends StatefulWidget {
  const ViewRoleBottomSheetScreen({super.key});

  @override
  State<ViewRoleBottomSheetScreen> createState() =>
      _ViewRoleBottomSheetScreenState();
}

class _ViewRoleBottomSheetScreenState extends State<ViewRoleBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(tabs: [
            Tab(
              child: Text(
                'Owner (You)',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Partner',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                'Staff',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          Expanded(
              child: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: colors.primary)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RoleContainerWidget(
                    headerTitle1: 'Permissions',
                    headerTitle2: '',
                    detail: 'Full access to all record of each account',
                    icon1: Icons.check_circle,
                    icon3: Icons.check_circle,
                    color1: Colors.green.shade700,
                    color3: Colors.green.shade700,
                    detail2: 'Full access to record settings',
                    detail3: 'Add/remove members in  record Account',
                    detail4: '',
                    detail5: '',
                    detail6: '',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: colors.primary)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RoleContainerWidget(
                    headerTitle1: 'Permissions',
                    headerTitle2: 'Restrictions',
                    detail: 'Full access to all record in this account',
                    icon1: Icons.check_circle,
                    icon3: Icons.check_circle,
                    icon4: Icons.cancel,
                    icon5: Icons.cancel,
                    color1: Colors.green.shade700,
                    color3: Colors.green.shade700,
                    color4: Colors.red.shade700,
                    color5: Colors.red.shade700,
                    detail2: 'Full access to record settings',
                    detail3: 'Add/remove members in  record Account',
                    detail4: "Can't delete account",
                    detail5: "Can't remove onwer from account",
                    detail6: '',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: colors.primary)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RoleContainerWidget(
                    headerTitle1: 'Permissions ',
                    headerTitle2: 'Restrictions',
                    detail: 'Limited access to authorized account',
                    icon1: Icons.check_circle,
                    icon4: Icons.cancel,
                    icon5: Icons.cancel,
                    icon6: Icons.cancel,
                    color1: Colors.green.shade700,
                    color4: Colors.red.shade700,
                    color5: Colors.red.shade700,
                    color6: Colors.red.shade700,
                    detail2:
                        'Owner/Partner can assign Modertor, Viewer or\n Operator to staffin any Account',
                    detail3: '',
                    detail4: 'No access to account they are not authorized',
                    detail5: 'No access to record setting',
                    detail6: 'No option to delete books',
                  ),
                ),
              ),
            ),
          ])),
          SizedBox(
              width: 350,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Action')))
        ],
      ),
    );
  }
}

