using System;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private static Students _currentStudent;

        private static bool Logic { get; set; }

        public AddEditPage(Students selectedStudent, bool logic)
        {
            InitializeComponent();

            _currentStudent = new Students();

            if (selectedStudent != null)
            {
                _currentStudent = selectedStudent;
            }
            else
            {
                _currentStudent.Id = -1;
            }

            Logic = logic;

            if (!logic)
            {
                //AddAdress.IsEnabled = logic;
                //AddAdress.Visibility = Visibility.Hidden;

                //AddSchool.IsEnabled = logic;
                //AddSchool.Visibility = Visibility.Hidden;

                DeleteAdress.IsEnabled = logic;
                DeleteAdress.Visibility = Visibility.Hidden;

                DeleteSchool.IsEnabled = logic;
                DeleteSchool.Visibility = Visibility.Hidden;
            }

            DataContext = _currentStudent;

            UpdateBoxes();
        }

        private void UpdateBoxes()
        {
            HomeBox.ItemsSource = StudentsBaseEntities.GetContext().Addresses.ToList();
            SchoolBox.ItemsSource = StudentsBaseEntities.GetContext().HighSchools.ToList();
        }

        private void ToEditPage_Click(object sender, RoutedEventArgs e)
        {
            Button button = (Button)e.Source;

            string whatSend = button.Content.ToString();

            if (whatSend == "System.Windows.Controls.TextBlock")
            {
                whatSend = ((TextBlock)button.Content).Text;
            }


            AddSchoolOrAdress addSchoolOrAdress = new AddSchoolOrAdress(whatSend);
            addSchoolOrAdress.ShowDialog();

            UpdateBoxes();
        }

        static bool TextIsDate(string text)
        {
            var dateFormat = "dd.MM.yyyy";
            DateTime scheduleDate;
            if (DateTime.TryParseExact(text, dateFormat, DateTimeFormatInfo.InvariantInfo, DateTimeStyles.None, out scheduleDate))
            {
                return true;
            }
            return false;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder builder = new StringBuilder();

            if (string.IsNullOrEmpty(_currentStudent.FullName))
                builder.AppendLine("Данные не введены: ФИО");
            if(HomeBox.SelectedIndex == -1)
                builder.AppendLine("Данные не введены: домашний адрес");
            if (SchoolBox.SelectedIndex == -1)
                builder.AppendLine("Данные не введены: среднее образование");
            if(_currentStudent.Course < 1 || _currentStudent.Course > 5)
                builder.AppendLine("Данные введены некорректно: Курс - Значение должно быть от 1 до 5");
            if(!TextIsDate(BirthDateBox.Text))
                builder.AppendLine("Данные введены некорректно: Дата рождения - неверный формат");


            if (builder.Length > 0)
            {
                MessageBox.Show(builder.ToString(), "Ошибка сохранения");

                FrameManager.MainFrame.GoBack();
                return;
            }

            if (_currentStudent.Id == -1)
            {
                StudentsBaseEntities.GetContext().Students.Add(_currentStudent);
            }

            try
            {
                StudentsBaseEntities.GetContext().SaveChanges();
                FrameManager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void HomeBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Logic)
            {
                if (HomeBox.SelectedIndex != -1)
                {
                    DeleteAdress.IsEnabled = true;
                }
                else
                {
                    DeleteAdress.IsEnabled = false;
                }
            }
           
        }

        private void SchoolBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Logic)
            {
                if (SchoolBox.SelectedIndex != -1)
                {
                    DeleteSchool.IsEnabled = true;
                }
                else
                {
                    DeleteSchool.IsEnabled = false;
                }
            }     
        }

        private void DeleteAdress_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show($"Вы уверены, что хотите удалить адрес:\n{HomeBox.Text}?", "Предупреждение",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    foreach (var neededAddress in StudentsBaseEntities.GetContext().Addresses)
                    {
                        if (HomeBox.Text.Equals(neededAddress.HomeAddress))
                        {
                            StudentsBaseEntities.GetContext().Addresses.Remove(neededAddress);
                            break;
                        }
                    }

                    StudentsBaseEntities.GetContext().SaveChanges();

                    UpdateBoxes();

                    MessageBox.Show("Удаление прошло успешно.", "Оповещение");
                }
                catch
                {
                    MessageBox.Show("Чтобы удалить объект - у него не должно быть связей с другими объектами.\n" +
                        "Проще говоря, для начала удалите всех студентов, что используют этот адрес.",
                        "Попытка удаления используемого объекта");
                }
            }
        }

        private void DeleteSchool_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show($"Вы уверены, что хотите удалить среднее образование:\n{SchoolBox.Text}?", "Предупреждение",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    foreach (var neededHighSchool in StudentsBaseEntities.GetContext().HighSchools)
                    {
                        if (SchoolBox.Text.Equals(neededHighSchool.HighSchool))
                        {
                            StudentsBaseEntities.GetContext().HighSchools.Remove(neededHighSchool);
                            break;
                        }
                    }

                    StudentsBaseEntities.GetContext().SaveChanges();

                    UpdateBoxes();

                    MessageBox.Show("Удаление прошло успешно.", "Оповещение");
                }
                catch
                {
                    MessageBox.Show("Чтобы удалить объект - у него не должно быть связей с другими объектами.\n" +
                        "Проще говоря, сначала удалите всех студентов, что используют это среднее образование.",
                        "Попытка удаления используемого объекта");
                }
            }
        }
    }
}