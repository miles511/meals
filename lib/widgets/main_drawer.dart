import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});


  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                    ],
                begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: const Row(
                children:  [
                   Icon(Icons.fastfood,
                  size: 48,
                     color: Colors.white70
                  ),
                   SizedBox(width: 18),
                  Text('Cooking up!',
                  style: TextStyle(
                    color: Colors.white70,
                  )
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.restaurant,
            color: Colors.white70
            ),
            title: const  Text('Meals',
            style: TextStyle(
              color: Colors.white70
            ),
            ),
           onTap: (){
             onSelectScreen('meals');
           },
          ),
          ListTile(
            leading: const  Icon(Icons.settings,
            color: Colors.white70,
            ),
            title: const Text('Filtered',
            style: TextStyle(
              color: Colors.white70
            ),
            ),
            onTap: () {
               onSelectScreen('filters');
            },
          )
        ],
      )
    );
  }
}
