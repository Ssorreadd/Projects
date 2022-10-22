using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для ViewAllStudentPage.xaml
    /// </summary>
    public partial class ViewAllStudentPage : Page
    {
        public ViewAllStudentPage()
        {
            InitializeComponent();

            CheckBase();

            DGridStudents.ItemsSource = StudentsBaseEntities.GetContext().Students.ToList();
        }

        private void CheckBase()
        {
            if (StudentsBaseEntities.GetContext().Students.ToList().Count == 0)
            {
                MessageBox.Show("Для начала добавьте студента.", "База данных студентов пуста");

                FrameManager.MainFrame.Navigate(new AddEditPage(null, true));
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                StudentsBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridStudents.ItemsSource = StudentsBaseEntities.GetContext().Students.ToList();
            }

            DGridStudents.SelectedIndex = -1;
        }

        private void DGridStudents_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataGridManager.DGridStudentsTmp = DGridStudents;
        }

        private void EditStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            FrameManager.MainFrame.Navigate(new AddEditPage((sender as Button).DataContext as Students, false));
        }
    }
}
