import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:animate_do/animate_do.dart';
import '../bloc/expense_bloc.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoaded) {
            final categoryData = _getCategoryData(state.expenses);
            final monthlyData = _getMonthlyData(state.expenses);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    child: Text(
                      'Expense by Category',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 200),
                    child: SizedBox(
                      height: 300,
                      child: PieChart(
                        PieChartData(
                          sections: categoryData.entries.map((entry) {
                            return PieChartSectionData(
                              value: entry.value,
                              title: '${(entry.value / categoryData.values.fold(0.0, (a, b) => a + b) * 100).toStringAsFixed(1)}%',
                              color: _getCategoryColor(entry.key),
                              radius: 100,
                              titleStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }).toList(),
                          centerSpaceRadius: 50,
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: _buildLegend(categoryData),
                  ),
                  const SizedBox(height: 32),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Text(
                      'Monthly Trend',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 800),
                    child: SizedBox(
                      height: 300,
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: true),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: (value, meta) {
                                  return Text('\${value.toInt()}');
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                                  if (value.toInt() < months.length) {
                                    return Text(months[value.toInt()]);
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          ),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              spots: monthlyData.entries.map((entry) {
                                return FlSpot(entry.key.toDouble(), entry.value);
                              }).toList(),
                              isCurved: true,
                              color: Theme.of(context).colorScheme.primary,
                              barWidth: 3,
                              dotData: const FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Map<String, double> _getCategoryData(List expenses) {
    final Map<String, double> categoryTotals = {};

    for (final expense in expenses) {
      categoryTotals[expense.category] =
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }

    return categoryTotals;
  }

  Map<int, double> _getMonthlyData(List expenses) {
    final Map<int, double> monthlyTotals = {};

    for (final expense in expenses) {
      final month = expense.date.month - 1; // 0-indexed for chart
      monthlyTotals[month] = (monthlyTotals[month] ?? 0) + expense.amount;
    }

    return monthlyTotals;
  }

  Widget _buildLegend(Map<String, double> categoryData) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: categoryData.entries.map((entry) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: _getCategoryColor(entry.key),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text('${entry.key}: \${entry.value.toStringAsFixed(0)}'),
          ],
        );
      }).toList(),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Colors.orange;
      case 'transport':
        return Colors.blue;
      case 'shopping':
        return Colors.purple;
      case 'entertainment':
        return Colors.green;
      case 'health':
        return Colors.red;
      case 'bills':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }
}