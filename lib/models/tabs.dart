import 'package:flutter/material.dart';
import 'package:mealapp/screen/categories_screen.dart';
import 'package:mealapp/screen/filtersscree.dart';
import 'package:mealapp/screen/mealsscreen.dart';
import 'package:mealapp/widgets/favourite_provider.dart';
import 'package:mealapp/widgets/sidebar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/widgets/filters_provider.dart';

const kinitialFilters= {
  Filters.glutenfree: false,
  Filters.lactosfree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class Tabscreen extends ConsumerStatefulWidget {
  const Tabscreen({
    super.key,
  });
  @override
  ConsumerState<Tabscreen> createState() {
    return _TabscreenState();
  }
}

class _TabscreenState extends ConsumerState<Tabscreen> {
  var _selectpageindex = 0;

  void _onselectpage(int index) {
    setState(() {
      _selectpageindex = index;
    });
  }

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) =>const Filterscreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final availablemeals= ref.watch(filtermealsprovider);

    Widget activescreen = Categoriesscreen(
      availablemeals: availablemeals,
    );
    var activescreentitle = 'Categories';

    if (_selectpageindex == 1) {
      final favouritemeals= ref.watch(favouritemealsProvider);
      activescreen = Mealsscreen(
        meal: favouritemeals,
      );
      activescreentitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activescreentitle),
      ),
      drawer: Sidedrawer(onSelectdrawer: _selectScreen),
      body: activescreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectpageindex,
        //mouseCursor: MouseCursor.defer,
        onTap: _onselectpage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_outlined,
                  color: _selectpageindex == 0
                      ? const Color.fromARGB(255, 0, 162, 183)
                      : null),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: _selectpageindex == 1
                    ? const Color.fromARGB(255, 255, 162, 0)
                    : null,
              ),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
