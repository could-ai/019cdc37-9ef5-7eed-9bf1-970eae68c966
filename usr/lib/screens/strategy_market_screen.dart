import 'package:flutter/material.dart';

class StrategyMarketScreen extends StatelessWidget {
  const StrategyMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('策略市场'),
        backgroundColor: const Color(0xFF1A73E8),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStrategyCard(
            '跷跷板策略',
            '成长/红利价值切换',
            '35%+ 年化预期收益',
            '震荡市有效，通过估值和拥挤度指标自动切换仓位',
            ['震荡市', '自动化', '高收益'],
            299,
            1250,
          ),
          _buildStrategyCard(
            '价值投资策略',
            '基于基本面分析',
            '25%+ 年化预期收益',
            '长期持有优质价值股，关注ROE和市净率指标',
            ['长期投资', '价值股', '稳健'],
            199,
            850,
          ),
          _buildStrategyCard(
            '量化动量策略',
            '技术指标驱动',
            '28%+ 年化预期收益',
            '基于MACD和RSI指标捕捉市场动量',
            ['技术分析', '短线', '高频'],
            399,
            2100,
          ),
          _buildStrategyCard(
            'AI智能选股',
            '机器学习模型',
            '32%+ 年化预期收益',
            '使用深度学习模型预测股价走势',
            ['AI驱动', '智能选股', '创新'],
            499,
            3200,
          ),
        ],
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
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    returnRate,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A73E8).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Color(0xFF1A73E8),
                    fontSize: 12,
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$subscribers 人订阅',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '¥$price/月',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A73E8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A73E8),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('订阅'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}