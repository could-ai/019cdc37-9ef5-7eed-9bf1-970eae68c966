import 'package:flutter/material.dart';

class AIToolsScreen extends StatelessWidget {
  const AIToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI工具'),
        backgroundColor: const Color(0xFF1A73E8),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI量化工具',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildToolCard(
              '策略因子化',
              '将投资思路转换为量化因子',
              Icons.psychology,
              Colors.blue,
              () {
                // 打开策略因子化工具
              },
            ),
            _buildToolCard(
              '回测分析',
              '历史数据回测和绩效分析',
              Icons.analytics,
              Colors.green,
              () {
                // 打开回测分析工具
              },
            ),
            _buildToolCard(
              '风险评估',
              '多维度风险分析和预警',
              Icons.warning,
              Colors.orange,
              () {
                // 打开风险评估工具
              },
            ),
            _buildToolCard(
              '智能选股',
              'AI模型辅助股票筛选',
              Icons.search,
              Colors.purple,
              () {
                // 打开智能选股工具
              },
            ),
            const SizedBox(height: 20),
            const Text(
              '市场监控',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildToolCard(
              '实时监控',
              '市场数据实时监控和提醒',
              Icons.monitor,
              Colors.red,
              () {
                // 打开实时监控
              },
            ),
            _buildToolCard(
              '舆情分析',
              '新闻和社交媒体情绪分析',
              Icons.article,
              Colors.teal,
              () {
                // 打开舆情分析
              },
            ),
            _buildToolCard(
              '技术指标',
              '自动计算各类技术指标',
              Icons.show_chart,
              Colors.indigo,
              () {
                // 打开技术指标计算
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'AI算力支持',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DeepSeek模型集成',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '已集成DeepSeek等先进AI模型，为量化分析和策略生成提供强大算力支持。',
                      style: TextStyle(
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildFeatureChip('GPU加速'),
                        _buildFeatureChip('高性能计算'),
                        _buildFeatureChip('模型微调'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
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
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A73E8).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF1A73E8),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
