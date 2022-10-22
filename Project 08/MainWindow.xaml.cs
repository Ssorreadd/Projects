using System;
using System.Collections.Generic;
using System.Windows;
using LiveCharts;
using LiveCharts.Wpf;
using LiveCharts.Defaults;

namespace Project_08
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// 

    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            //SeriesCollection = new SeriesCollection();
            //MyChart.Series = SeriesCollection;
        }

        //[0]x [1]y ... [n]x [n + 1]y
        public List<double> points = new List<double>();

        public SeriesCollection SeriesCollection { get; set; }

        private void BuildChart()
        {
            try
            {
                LineSeries lineSeries = new LineSeries();

                ChartValues<ObservablePoint> values = new ChartValues<ObservablePoint>();

                for (int i = 0; i < points.Count; i++)
                {
                    values.Add(new ObservablePoint(points[i], points[i + 1]));
                    i += 3;
                }

                lineSeries.Values = values;

                SeriesCollection.Add(lineSeries);
                DataContext = this;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private double Func(int n)
        {
            try
            {
                double res = Math.Pow(double.Parse(X.Text), n);

                res /= (n + 1) * Math.Pow(5, n);

                return res;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
                return 0;
            }
        }

        private void GetSum()
        {
            try
            {
                int step = 0;

                double previous = 0;
                double current = 0;

                double sum = 0;
                int n = 1;

                do
                {
                    if (current >= double.MaxValue || current <= double.MinValue)
                    {
                        MessageBox.Show("Сумма ряда достигла максимального значения типа данных double..\nВозможно некорректное отображение графика.", "Дальше некуда...", MessageBoxButton.OK, MessageBoxImage.Information);
                        break;
                    }
                    previous = current;

                    current = Func(n);

                    sum += current;

                    n++;

                    points.Add(step);
                    points.Add(current);

                    step++;
                    //BuildChart(previous, current);
                } while (Math.Abs(current - previous) > double.Parse(E.Text));

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

            BuildChart();
        }

        private void Build_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                points = new List<double>();

                SeriesCollection = new SeriesCollection();

                MyChart.Series = SeriesCollection;

                GetSum();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
