import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allItems = [
    "math 211",
    "statistics and probability",
    "introduction to programming",
    "calculus 101",
    "physics 102",
    "advanced algorithms",
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems; // Initially show all items
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredItems = _allItems;
      } else {
        _filteredItems = _allItems
            .where((item) =>
            item.toLowerCase().contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _searchController.text.isEmpty
            ? Wrap(
          spacing: 8.0,
          children: _allItems.map((item) {
            return Chip(
              label: Text(
                item,
                overflow: TextOverflow.ellipsis,
              ),
              backgroundColor: Colors.green,
              labelStyle: const TextStyle(color: Colors.white),
            );
          }).toList(),
        )
            : ListView.builder(
          itemCount: _filteredItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_filteredItems[index]),
              onTap: () {
                // Action when an item is tapped
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You selected: ${_filteredItems[index]}"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
