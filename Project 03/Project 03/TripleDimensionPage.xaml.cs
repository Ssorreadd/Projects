using System.Windows.Controls;
using System.Windows.Input;

namespace Project_03
{
    /// <summary>
    /// Логика взаимодействия для TripleDimensionPage.xaml
    /// </summary>
    public partial class TripleDimensionPage : Page
    {
        public TripleDimensionPage()
        {
            MainWindow.Equation = new double[3, 4] { { 0, 0, 0, 0 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 } };

            InitializeComponent();
        }

        private void a1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 0] = double.Parse(a1.Text);

            }
        }

        private void s3_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[2, 3] = double.Parse(s3.Text);

            }
        }

        private void c3_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[2, 2] = double.Parse(c3.Text);

            }
        }

        private void b3_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[2, 1] = double.Parse(b3.Text);

            }
        }

        private void a3_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[2, 0] = double.Parse(a3.Text);

            }
        }

        private void s2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 3] = double.Parse(s2.Text);

            }
        }

        private void c2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 2] = double.Parse(c2.Text);

            }
        }

        private void b2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 1] = double.Parse(b2.Text);

            }
        }

        private void a2_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[1, 0] = double.Parse(a2.Text);

            }
        }

        private void s1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 3] = double.Parse(s1.Text);

            }
        }

        private void c1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 2] = double.Parse(c1.Text);

            }
        }

        private void b1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Space)
            {
                MainWindow.Equation[0, 1] = double.Parse(b1.Text);

            }
        }
    }
}
