import 'package:flutter/material.dart';
import 'strategy_market_screen.dart';
import 'my_strategies_screen.dart';
import 'ai_tools_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    StrategyMarketScreen(),
    MyStrategiesScreen(),
    AIToolsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: '首页',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.show_chart_rounded),
                  label: '策略',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_rounded),
                  label: '持仓',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.auto_awesome_rounded),
                  label: 'AI',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: '我的',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color(0xFF1E88E5),
              unselectedItemColor: Colors.grey[400],
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedFontSize: 12,
              unselectedFontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'AI量化交易',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1E88E5),
                      Color(0xFF1976D2),
                      Color(0xFF1565C0),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -50,
                      top: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -30,
                      bottom: -30,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // 实时数据卡片
                _buildMarketOverviewCard(),
                const SizedBox(height: 16),
                
                // 快捷功能
                _buildQuickActions(context),
                const SizedBox(height: 20),
                
                // 平台优势
                _buildSectionTitle('平台优势'),
                const SizedBox(height: 12),
                _buildAdvantageCards(),
                const SizedBox(height: 20),
                
                // 特色策略
                _buildSectionTitle('明星策略'),
                const SizedBox(height: 12),
                _buildFeaturedStrategy(),
                const SizedBox(height: 20),
                
                // 核心价值
                _buildSectionTitle('核心价值'),
                const SizedBox(height: 12),
                _buildCoreValues(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E88E5).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMarketStat('上证指数', '3,245.67', '+1.25%', true),
              Container(width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
              _buildMarketStat('深证成指', '10,856.32', '-0.45%', false),
              Container(width: 1, height: 40, color: Colors.white.withOpacity(0.3)),
              _buildMarketStat('创业板指', '2,134.56', '+2.15%', true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMarketStat(String title, String value, String change, bool isUp) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: isUp ? Colors.redAccent : Colors.greenAccent,
                size: 16,
              ),
              Text(
                change,
                style: TextStyle(
                  color: isUp ? Colors.redAccent : Colors.greenAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            Icons.analytics_rounded,
            '策略市场',
            const Color(0xFF1E88E5),
            () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            Icons.auto_awesome_rounded,
            'AI选股',
            const Color(0xFF7C4DFF),
            () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            Icons.assessment_rounded,
            '回测分析',
            const Color(0xFFFF6F00),
            () {},
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            Icons.trending_up_rounded,
            '实时监控',
            const Color(0xFF00C853),
            () {},
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFF1E88E5),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAdvantageCards() {
    return Column(
      children: [
        _buildAdvantageCard(
          Icons.trending_up_rounded,
          '牛散策略市场',
          '将牛散炒股思路因子化和策略化，形成可订阅的策略产品',
          const Color(0xFF1E88E5),
        ),
        const SizedBox(height: 12),
        _buildAdvantageCard(
          Icons.groups_rounded,
          '订阅者收益',
          '跟随认可的牛散操作，获得超额收益，降低投资门槛',
          const Color(0xFF7C4DFF),
        ),
        const SizedBox(height: 12),
        _buildAdvantageCard(
          Icons.auto_awesome_rounded,
          'AI量化跟踪',
          '自动监控、量化执行和回测分析，全程AI辅助决策',
          const Color(0xFFFF6F00),
        ),
      ],
    );
  }

  Widget _buildAdvantageCard(IconData icon, String title, String description, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedStrategy() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple[400]!,
            Colors.deepPurple[600]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      '推荐',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                '年化收益',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '35%+',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '跷跷板策略',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '成长/红利价值切换',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '在震荡市中，资金在成长股和红利价值股之间智能切换。通过估值、拥挤度等指标AI分析，当偏离基准值时自动调整仓位配置。',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTag('震荡市有效'),
              _buildTag('自动切换'),
              _buildTag('AI辅助'),
              _buildTag('1250人订阅'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCoreValues() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          _buildValueItem('低门槛AI投研、监控跟踪、回测、舆情监控'),
          const Divider(height: 20),
          _buildValueItem('策略市场生态，将个人投资策略产品化'),
          const Divider(height: 20),
          _buildValueItem('订阅者获取超额收益，降低投资门槛'),
          const Divider(height: 20),
          _buildValueItem('个人量化平台，支持自动交易'),
        ],
      ),
    );
  }

  Widget _buildValueItem(String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF00C853).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF00C853),
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
