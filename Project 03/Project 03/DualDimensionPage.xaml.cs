using System;
using System.Windows.Controls;
using System.Windows.Input;

namespace Project_03
{
    /// <summary>
    /// Логика взаимодействия для DualDimensionPage.xaml
    /// </summary>
    public partial class DualDimensionPage : Page
    {
        public DualDimensionPage()
        {
            MainWindow.Equation = new double[2, 3] { { 0, 0, 0 }, { 0, 0, 0 } };

            InitializeComponent();
        }

        //private void AddToArray(object sender, TextChangedEventArgs e)
        //{
        //    if (e.OriginalSource == a1)
        //    {
        //        MainWindow.Equation[0, 0] = double.Parse(a1.Text);
        //    }
        //    else if (e.OriginalSource == b1)
        //    {
        //        MainWindow.Equation[0, 1] = double.Parse(a1.Text);
        //    }
        //    else if (e.OriginalSource == s1)
        //    {
        //        MainWindow.Equation[0, 2] = double.Parse(a1.Text);
        //    }
        //    else if (e.OriginalSource == a2)
        //    {
        //        MainWindow.Equation[1, 0] = double.Parse(a1.Text);
        //    }
        //    else if (e.OriginalSource == b2)
        //    {
        //        MainWindow.Equation[1, 1] = double.Parse(a1.Text);
        //    }
        //    else if (e.OriginalSource == s2)
        //    {
        //        MainWindow.Equation[1, 2] = double.Parse(a1.Text);
        //    }
        //}





        private void a1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 0] = double.Parse(a1.Text);

            }
        }

        private void b1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 1] = double.Parse(b1.Text);

            }
        }

        private void s1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 2] = double.Parse(s1.Text);

            }
        }

        private void a2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 0] = double.Parse(a2.Text);

            }
        }

        private void b2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 1] = double.Parse(b2.Text);

            }
        }

        private void s2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 2] = double.Parse(s2.Text);

            }
        }
    }
}
