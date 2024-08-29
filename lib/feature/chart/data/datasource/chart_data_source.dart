import '../model/chart_model.dart';

class ChartDataSource {
  List<ChartModel> getChartsData() {
    return _data
        .map(
          (e) => ChartModel.fromJson(e),
        )
        .toList();
  }
}

final _data = [
  {
    "name": "Customer Satisfaction",
    "type": "bar",
    "labels": ["Q1", "Q2", "Q3", "Q4"],
    "values": [75, 80, 85, 90]
  },
  {
    "name": "Stock Prices Over Time",
    "type": "area",
    "colors": ['0xffFF5733', '0xf33C1FF', "0xfFF33A6", "0xf33FF57"],
    "labels": ["January", "February", "March", "April", "May"],
    "values": [120, 135, 150, 160, 155]
  },
  {
    "name": "Market Share",
    "type": "pie",
    "colors": ['0xffFF5733', '0xf33C1FF', "0xfFF33A6", "0xf33FF57"],
    "labels": ["Product A", "Product B", "Product C", "Product D"],
    "values": [40, 30, 20, 10]
  },
  {
    "name": "Employee Skill Distribution",
    "colors": ['0xffFF5733', '0xf33C1FF', "0xfFF33A6", "0xf33FF57"],
    "type": "scatter",
    "labels": ["Beginner", "Intermediate", "Advanced", "Expert"],
    "values": [5, 15, 20, 10]
  },
  {
    "name": "Monthly Revenue",
    "type": "line",
    "colors": ['0xffFF5733', '0xf33C1FF', "0xfFF33A6", "0xf33FF57"],
    "labels": ["January", "February", "March", "April", "May"],
    "values": [10000, 15000, 20000, 25000, 30000]
  },
  {
    "name": "Marketing Channels Effectiveness",
    "type": "radar",
    "labels": ["Email", "Social Media", "SEO", "PPC", "Referrals"],
    "values": [70, 85, 80, 75, 90]
  },
  {
    "name": "Sales by Region",
    "type": "bar",
    "labels": ["North", "South", "East", "West"],
    "values": [25000, 30000, 20000, 15000]
  },
  {
    "name": "Revenue vs. Expenses",
    "type": "area",
    "labels": ["Q1", "Q2", "Q3", "Q4"],
    "values": [50000, 55000, 60000, 65000]
  },
  {
    "name": "Website Traffic",
    "type": "line",
    "labels": ["Week 1", "Week 2", "Week 3", "Week 4"],
    "values": [1500, 2000, 2500, 3000]
  },
  {
    "name": "Quarterly Profits",
    "type": "bar",
    "labels": ["Q1", "Q2", "Q3", "Q4"],
    "values": [12000, 15000, 10000, 20000]
  },
  {
    "name": "Customer Age Distribution",
    "type": "scatter",
    "labels": ["18-24", "25-34", "35-44", "45-54", "55-64", "65+"],
    "values": [20, 30, 25, 15, 7, 3]
  },
  {
    "name": "Employee Turnover Rate",
    "type": "line",
    "labels": ["2019", "2020", "2021", "2022", "2023"],
    "values": [10, 15, 12, 8, 6]
  },
  {
    "name": "Expense Breakdown",
    "type": "pie",
    "labels": ["Rent", "Salaries", "Utilities", "Miscellaneous"],
    "values": [25, 50, 15, 10]
  },
  {
    "name": "Product Sales Distribution",
    "type": "pie",
    "labels": ["Electronics", "Clothing", "Home Goods", "Books"],
    "values": [30, 25, 35, 10]
  },
  {
    "name": "Sales Performance",
    "type": "radar",
    "labels": ["Q1", "Q2", "Q3", "Q4"],
    "values": [80, 85, 75, 90]
  }
];
