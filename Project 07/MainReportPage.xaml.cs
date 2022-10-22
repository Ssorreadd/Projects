using System;
using System.Windows;
using System.Windows.Controls;


namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для MainReportPage.xaml
    /// </summary>
    public partial class MainReportPage : Page
    {
        public MainReportPage()
        {
            InitializeComponent();

            //FrameManager.ReportFrame = MainReportFrame;

            FormsOfReport.Items.Add("--Выберите форму--");
            FormsOfReport.Items.Add("1-я форма");
            FormsOfReport.Items.Add("2-я форма");
            FormsOfReport.SelectedIndex = 0;
        }

        private void FormsOfReport_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (FormsOfReport.SelectedItem)
            {
                case "--Выберите форму--":
                    //FrameManager.ReportFrame = null;
                    MainReportFrame.Content = null;
                    FrameManager.ReportFrame = MainReportFrame;
                    break;
                case "1-я форма":
                    FrameManager.ReportFrame.Navigate(new FirstReportPage());
                    break;
                case "2-я форма":
                    FrameManager.ReportFrame.Navigate(new SecondReportPage());
                    break;
            }
        }
    }
}