using System.Windows.Controls;

namespace Project_03
{
    /// <summary>
    /// Логика взаимодействия для ResPage.xaml
    /// </summary>
    public partial class ResPage : Page
    {
        public ResPage(string result)
        {
            InitializeComponent();

            ResultTB.Text = result;
        }
    }
}
