using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Collections.Generic;

namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для SecondReportPage.xaml
    /// </summary>
    public partial class SecondReportPage : Page
    {
        private static int StudentCount { get; set; }

        private static List<Students> CurrentStudents { get; set; }

        public SecondReportPage()
        {
            InitializeComponent();

            StudentCount = 0;

            CurrentStudents = StudentsBaseEntities.GetContext().Students.ToList();

            ShowStudent();
        }

        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(SearchBar.Text))
            {
                SearchLabel.Visibility = Visibility.Hidden;

                int count = 0;
                foreach (Students student in CurrentStudents)
                {
                    if (student.FullName.ToLower().Equals(SearchBar.Text.ToLower()))
                    {
                        StudentCount = count;
                        ShowStudent();

                        SearchBar.Text = null;

                        toolTip.IsOpen = false;

                        break;
                    }

                    count++;
                    toolTip.IsOpen = true;
                }
            }
            else
            {
                SearchLabel.Visibility = Visibility.Visible;
                toolTip.IsOpen = false;
            }
        }

        private void ShowStudent()
        {
            CountLabel.Content = $"{StudentCount + 1}/{CurrentStudents.Count}";

            InfoBlock.Text = $"ФИО: {CurrentStudents[StudentCount].FullName}\n\n" +
                $"Дата рождения: {CurrentStudents[StudentCount].Birthday.ToShortDateString()}\n\n" +
                $"Курс: {CurrentStudents[StudentCount].Course}\n\n" +
                $"Специальность: {CurrentStudents[StudentCount].Speciality}\n\n" +
                $"Домашний адрес: {CurrentStudents[StudentCount].Addresses.HomeAddress}\n\n" +
                $"Среднее образование: {CurrentStudents[StudentCount].HighSchools.HighSchool}";
        }

        private void NextStudent_Click(object sender, RoutedEventArgs e)
        {
            StudentCount++;

            CheckCount();

            ShowStudent();
        }

        private void PrevStudent_Click(object sender, RoutedEventArgs e)
        {
            StudentCount--;

            CheckCount();

            ShowStudent();
        }

        private void CheckCount()
        {
            SearchBar.Text = null;

            if (StudentCount == CurrentStudents.Count)
            {
                StudentCount = 0;
            }
            else if (StudentCount == -1)
            {
                StudentCount = CurrentStudents.Count - 1;
            }
        }

        private void Page_Unloaded(object sender, RoutedEventArgs e)
        {
            toolTip.IsOpen = false;
        }
    }
}
