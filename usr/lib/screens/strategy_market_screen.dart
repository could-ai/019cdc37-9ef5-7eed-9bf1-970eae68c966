import 'package:flutter/material.dart';

class StrategyMarketScreen extends StatelessWidget {
  const StrategyMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '策略市场',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1E88E5),
                      Color(0xFF1565C0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // 筛选栏
                _buildFilterBar(),
                const SizedBox(height: 16),
                
                // 策略列表
                _buildStrategyCard(
                  '跷跷板策略',
                  '成长/红利价值切换',
                  '35%+',
                  '震荡市有效，通过估值和拥挤度指标自动切换仓位',
                  ['震荡市', '自动化', 'AI辅助'],
                  299,
                  1250,
                  const Color(0xFF7C4DFF),
                ),
                const SizedBox(height: 12),
                _buildStrategyCard(
                  '价值投资策略',
                  '基于基本面分析',
                  '25%+',
                  '长期持有优质价值股，关注ROE和市净率指标',
                  ['长期投资', '价值股', '稳健'],
                  199,
                  850,
                  const Color(0xFF1E88E5),
                ),
                const SizedBox(height: 12),
                _buildStrategyCard(
                  '量化动量策略',
                  '技术指标驱动',
                  '28%+',
                  '基于MACD和RSI指标捕捉市场动量',
                  ['技术分析', '短线', '高频'],
                  399,
                  2100,
                  const Color(0xFFFF6F00),
                ),
                const SizedBox(height: 12),
                _buildStrategyCard(
                  'AI智能选股',
                  '机器学习模型',
                  '32%+',
                  '使用深度学习模型预测股价走势',
                  ['AI驱动', '智能选股', '创新'],
                  499,
                  3200,
                  const Color(0xFF00C853),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          _buildFilterChip('全部', true),
          const SizedBox(width: 8),
          _buildFilterChip('AI策略', false),
          const SizedBox(width: 8),
          _buildFilterChip('价值', false),
          const SizedBox(width: 8),
          _buildFilterChip('成长', false),
          const Spacer(),
          Icon(Icons.tune_rounded, color: Colors.grey[600], size: 20),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E88E5) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildStrategyCard(
    String title,
    String subtitle,
    String returnRate,
    String description,
    List<String> tags,
    int price,
    int subscribers,
    Color accentColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 顶部标题栏
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accentColor.withOpacity(0.1), accentColor.withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    color: accentColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      returnRate,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '年化收益',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // 内容区域
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags.map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: accentColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.people_rounded, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      '$subscribers 人订阅',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '¥$price',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                      ),
                    ),
                    Text(
                      '/月',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '订阅',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
