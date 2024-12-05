import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rangelandsapp/components/empty_state.dart';
import 'package:rangelandsapp/components/page_switch.dart';
import 'package:rangelandsapp/components/quick_action.dart';
import 'package:rangelandsapp/pages/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.grey,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pie_chart,
                color: Theme.of(context).colorScheme.primary, size: 30),
            const SizedBox(width: 8),
            Text(
              'Kollecta',
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Greetings Sir',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Kevin Kiprotich', // pass the username
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Quick Actions',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(color: Theme.of(context).colorScheme.secondary),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 140,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 8.3,
                    offset: Offset(0, 2),
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QuickAction(
                    icon: Icon(
                      Icons.format_list_bulleted_add,
                      size: 30,
                      color: Color(0xFF007EFF),
                    ),
                    label: 'Collect Data',
                  ),
                  SizedBox(width: 16),
                  QuickAction(
                    icon: Icon(
                      FontAwesomeIcons.penToSquare,
                      size: 30,
                      color: Color.fromRGBO(140, 140, 140, 1),
                    ),
                    label: 'View Drafts',
                  ),
                  SizedBox(width: 16),
                  QuickAction(
                    icon: Icon(
                      Icons.list_alt,
                      size: 30,
                      color: Color(0xFF1AB759),
                    ),
                    label: 'Completed Forms',
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Forms',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.apply(color: Theme.of(context).colorScheme.secondary),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    onPressed: () {},
                    style: Theme.of(context).textButtonTheme.style,
                    label: const Text('See all'),
                    icon: const Icon(Icons.arrow_back, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const EmptyState()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // Shadow color
            offset: const Offset(0, 0), // Shift shadow upwards
            blurRadius: 8, // Spread of the shadow
            spreadRadius: 0, // Intensity of the shadow
          ),
        ]
            // border: BorderDirectional(
            //   top: BorderSide(
            //     color: Color.fromRGBO(138, 150, 160, 1),

            //   ),
            // ),
            ),
        child: Center(
          child: PageSwitch(
            activePage: "kollecta",
            onDashboardClicked: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard(),),);
            },
            onDataCollectionClicked: () {},
          ),
        ),
      ),
    );
  }
}
