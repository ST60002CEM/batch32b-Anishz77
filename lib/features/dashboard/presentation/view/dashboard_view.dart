import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trailtrekker_app/features/censor/presentation/accelerometer.dart';
import 'package:trailtrekker_app/features/dashboard/presentation/viewmodel/paginated_products_view_model.dart';

class DashboardView extends ConsumerStatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(paginatedProductsViewModelProvider).fetchProducts();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !ref.read(paginatedProductsViewModelProvider).isLoading) {
        ref.read(paginatedProductsViewModelProvider).fetchProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(paginatedProductsViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _buildHeader(context),
              _buildSearchBar(),
              _buildPromoBanner(),
              _buildSectionTitle(context, 'Featured'),
              _buildPaginatedProducts(viewModel),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/image/me.png'),
            radius: 20,
          ),
          Text('Hello', style: TextStyle(fontSize: 20)),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.device_hub, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccelerometerScreen(),
                    ),
                  );
                },
              ),
              Icon(Icons.notifications, size: 28),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Text(
                'Get free rain covers\nOn every purchase\nover Rs 5000',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Image.asset('assets/image/rain-cover.png', height: 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('See All', style: TextStyle(color: Theme.of(context).primaryColor)),
        ],
      ),
    );
  }

  Widget _buildPaginatedProducts(PaginatedProductsViewModel viewModel) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: viewModel.products.length + (viewModel.hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == viewModel.products.length) {
              return Center(child: CircularProgressIndicator());
            }
            final product = viewModel.products[index];
            return _buildProductItem(product.name, product.price, product.image);
          },
        ),
      ],
    );
  }

  Widget _buildProductItem(String name, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset(imagePath, height: 100, width: 100),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 16)),
              Text(price, style: TextStyle(color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
