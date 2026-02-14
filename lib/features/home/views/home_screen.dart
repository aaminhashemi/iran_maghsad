import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider برای مدیریت داده‌های صفحه اصلی
final homeDataProvider = FutureProvider<List<String>>((ref) async {
  // شبیه‌سازی دریافت داده از API یا دیتابیس
  await Future.delayed(const Duration(seconds: 1));
  return [
    'آیتم شماره ۱',
    'آیتم شماره ۲',
    'آیتم شماره ۳',
    'آیتم شماره ۴',
    'آیتم شماره ۵',
  ];
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  // لیست صفحه‌های مختلف برای BottomNavigationBar
  final List<Widget> _pages = [
    const HomeTab(),
    const SearchTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'صفحه اصلی',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // رفتن به صفحه نوتیفیکیشن
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // رفتن به صفحه تنظیمات
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'جستجو',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'پروفایل',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // اقدام سریع
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// تب خانه
class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(homeDataProvider);

    return RefreshIndicator(
      onRefresh: () async {
        // برای آپدیت دستی صفحه
        ref.invalidate(homeDataProvider);
      },
      child: CustomScrollView(
        slivers: [
          // هدر خوش‌آمدگویی
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade700],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'خوش آمدید!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'به اپلیکیشن ما خوش آمدید. امروز چه کمکی می‌تونیم بکنیم؟',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // کارت‌های آماری
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'بازدیدها',
                      '۱,۲۳۴',
                      Icons.visibility,
                      Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'کاربران',
                      '۸۹۰',
                      Icons.people,
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // لیست آیتم‌ها
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: itemsAsync.when(
              data: (items) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade100,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(items[index]),
                          subtitle: const Text('توضیحات آیتم'),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // رفتن به صفحه جزئیات
                          },
                        ),
                      );
                    },
                    childCount: items.length,
                  ),
                );
              },
              error: (error, stack) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        const SizedBox(height: 16),
                        Text('خطا: $error'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            ref.invalidate(homeDataProvider);
                          },
                          child: const Text('تلاش مجدد'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              loading: () {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// تب جستجو
class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'جستجو',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// تب پروفایل
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'کاربر مهمان',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'guest@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // رفتن به صفحه ورود
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('ورود به حساب'),
          ),
        ],
      ),
    );
  }
}