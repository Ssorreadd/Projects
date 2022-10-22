using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Project_07
{
    public class DataGridManager
    {
        public static DataGrid DGridStudentsTmp { get; set; }
        public static void DeleteFromDataGrid()
        {
            var peopleForRemoving = DGridStudentsTmp.SelectedItems.Cast<Students>().ToList();

            if (peopleForRemoving.Count == 0)
            {
                MessageBox.Show("Чтобы удалить элемент - выделите их в таблице.", "Подсказка");
                return;
            }

            if (MessageBox.Show($"Вы уверены, что хотите удалить слудующие {peopleForRemoving.Count} элементов?", "Предупреждение",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    StudentsBaseEntities.GetContext().Students.RemoveRange(peopleForRemoving);
                    StudentsBaseEntities.GetContext().SaveChanges();

                    //DGridStudentsTmp.ItemsSource = StudentsBaseEntities.GetContext().Students.ToList();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}
