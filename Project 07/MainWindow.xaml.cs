using System;
using System.Windows;
using System.Threading;
using System.Threading.Tasks;

namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            DateManager();
            TimeManager();

            StudentsBaseEntities.GetContext();
            FrameManager.MainFrame = MainWindowFrame;
        }

        private async void DateManager()
        {
            await Task.Run(() =>
            {
                while (true)
                {
                    Dispatcher.Invoke(() =>
                    {
                        DateBlock.Text = DateTime.Now.ToString("D");
                    });

                    Thread.Sleep(3600000);
                }
            });
        }
        private async void TimeManager()
        {
            await Task.Run(() =>
            {
                while (true)
                {
                    Dispatcher.Invoke(() =>
                    {
                        TimeBlock.Text = DateTime.Now.ToString("T");
                    });

                    Thread.Sleep(1000);
                }
            });
        }

        private void ViewStudentList_Click(object sender, RoutedEventArgs e)
        {
            FrameManager.MainFrame.Navigate(new ViewAllStudentPage());
            DeleteStudentBtn.IsEnabled = true;
            AddStudentBtn.IsEnabled = true;
        }

        private void DeleteStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridManager.DGridStudentsTmp != null)
            {
                DataGridManager.DeleteFromDataGrid();
                FrameManager.MainFrame.Visibility = Visibility.Hidden;
                FrameManager.MainFrame.Visibility = Visibility.Visible;
            }
            else
            {
                MessageBox.Show("Чтобы удалить элемент - выделите их в таблице.", "Подсказка");
                return;
            }
        }

        private void CteateReport_Click(object sender, RoutedEventArgs e)
        {
            FrameManager.MainFrame.Navigate(new MainReportPage());
            DeleteStudentBtn.IsEnabled = false;
            AddStudentBtn.IsEnabled = false;
        }

        private void AddStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            FrameManager.MainFrame.Navigate(new AddEditPage(null, true));
        }
    }
}