using System;
using System.Windows;
using System.Windows.Controls;

namespace Project_07
{
    /// <summary>
    /// Логика взаимодействия для AddSchoolOrAdress.xaml
    /// </summary>
    public partial class AddSchoolOrAdress : Window
    {
        private static string WhatAdd { get; set; }
        public AddSchoolOrAdress(string whatAdd)
        {
            WhatAdd = whatAdd;

            InitializeComponent();

            Logic();
        }

        private void Logic()
        {
            switch (WhatAdd)
            {
                case "Добавить адрес":
                    AddAdress(0);
                    break;

                case "Добавить среднее":
                    AddSchool(0);
                    break;
            }
        }

        private void AddSchool(byte key)
        {
            if (key == 0)
            {
                Header.Content = "Добавьте новое среднее образование";

                InfoTextBox.MaxLength = 200;
            }
            else
            {
                HighSchools newHighSchool = new HighSchools();
                newHighSchool.HighSchool = InfoTextBox.Text;

                StudentsBaseEntities.GetContext().HighSchools.Add(newHighSchool);
            }

        }

        private void AddAdress(byte key)
        {
            if (key == 0)
            {
                Header.Content = "Добавьте новый адрес";

                InfoTextBox.MaxLength = 250;
            }
            else
            {
                Addresses newAddress = new Addresses();
                newAddress.HomeAddress = InfoTextBox.Text;

                StudentsBaseEntities.GetContext().Addresses.Add(newAddress);
            }
        }

        private void ConfirmAndSave_Click(object sender, RoutedEventArgs e)
        {
            
            switch (WhatAdd)
            {
                case "Добавить адрес":
                    AddAdress(1);
                    break;

                case "Добавить среднее":
                    AddSchool(1);
                    break;
            }

            try
            {
                StudentsBaseEntities.GetContext().SaveChanges();

                MessageBox.Show("Добавление прошло успешно!", "Оповещение");

                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void InfoTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            ConfirmAndSave.IsEnabled = !string.IsNullOrWhiteSpace(InfoTextBox.Text);
        }

        private void Exit_Click(object sender, RoutedEventArgs e) => Close();
    }
}
