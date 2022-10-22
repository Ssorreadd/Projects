using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Collections.Generic;

namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для FirstReportPage.xaml
    /// </summary>
    public partial class FirstReportPage : Page
    {
        private static int StudentCount { get; set; }

        private static List<Students> CurrentStudents { get; set; }

        public FirstReportPage()
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

            InfoBlock.Text = $"Студент(-ка) специальности {CurrentStudents[StudentCount].Speciality} {CurrentStudents[StudentCount].Course} курса\n\n" +
                $"{CurrentStudents[StudentCount].FullName}\n\n" +
                $"родился(-ась) {CurrentStudents[StudentCount].Birthday:D}\n\n" +
                $"проживает по адресу {CurrentStudents[StudentCount].Addresses.HomeAddress}\n\n" +
                $"закончил(-а) {CurrentStudents[StudentCount].HighSchools.HighSchool}";
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
