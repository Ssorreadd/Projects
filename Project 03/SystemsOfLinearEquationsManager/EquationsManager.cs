using System;
using System.Windows;

namespace SystemsOfLinearEquationsManager
{
    public static class EquationsManager
    {
        public static string Kramer(double[,] equation)
        {
            //
            //http://mathprofi.ru/pravilo_kramera_matrichnyi_metod.html
            //
            // a1 b1 c1 s1
            // a2 b2 c2 s2
            // a3 b3 c3 s3
            //
            // a1 b1 s1
            // a2 b2 s2
            //
            try
            {
                double mainDeterminant = 0;

                if (equation.GetLength(0) == 3)
                {
                    //Решение системы с тремя неизвестными
                    mainDeterminant = (equation[0, 0] * ((equation[1, 1] * equation[2, 2]) - (equation[1, 2] * equation[2, 1]))) -
                        (equation[0, 1] * ((equation[1, 0] * equation[2, 2]) - (equation[1, 2] * equation[2, 0]))) +
                        (equation[0, 2] * ((equation[1, 0] * equation[2, 1]) - (equation[1, 1] * equation[2, 0])));

                    if (mainDeterminant == 0)
                    {
                        //MessageBox.Show("Решить систему методом Крамера невозможно.\nИспользуйте метод Гаусса.", "Главный определитель равен нулю.", MessageBoxButton.OK);
                        return "Главный определитель равен нулю.\nРешить систему методом Крамера невозможно.\nИспользуйте метод Гаусса.";
                    }

                    double determinant1 = (equation[0, 3] * ((equation[1, 1] * equation[2, 2]) - (equation[1, 2] * equation[2, 1]))) -
                        (equation[0, 1] * ((equation[1, 3] * equation[2, 2]) - (equation[1, 2] * equation[2, 3]))) +
                        (equation[0, 2] * ((equation[1, 3] * equation[2, 1]) - (equation[1, 1] * equation[2, 3])));

                    double determinant2 = equation[0, 0] * ((equation[1, 3] * equation[2, 2]) - (equation[1, 2] * equation[2, 3])) -
                        (equation[0, 3] * ((equation[1, 0] * equation[2, 2]) - (equation[1, 2] * equation[2, 0]))) +
                        (equation[0, 2] * ((equation[1, 0] * equation[2, 3]) - (equation[1, 3] * equation[2, 0])));

                    double determinant3 = (equation[0, 0] * ((equation[1, 1] * equation[2, 3]) - (equation[1, 3] * equation[2, 1]))) -
                        (equation[0, 1] * ((equation[1, 0] * equation[2, 3]) - (equation[1, 3] * equation[2, 0]))) +
                        (equation[0, 3] * ((equation[1, 0] * equation[2, 1]) - (equation[1, 1] * equation[2, 0])));


                    double res1 = Math.Round(determinant1 / mainDeterminant, 3);

                    double res2 = Math.Round(determinant2 / mainDeterminant, 3);

                    double res3 = Math.Round(determinant3 / mainDeterminant, 3);

                    //MessageBox.Show($"a = {res1}; b = {res2}; c = {res3}", "", MessageBoxButton.OK);

                    return $"a = {res1}\nb = {res2}\nc = {res3}";
                }
                else
                {
                    //Решение системы с двумя неизвестными
                    mainDeterminant = (equation[0, 0] * equation[1, 1]) - (equation[0, 1] * equation[1, 0]);

                    if (mainDeterminant == 0)
                    {
                        //MessageBox.Show("Решить систему методом Крамера невозможно.\nИспользуйте метод Гаусса.", "Главный определитель равен нулю.", MessageBoxButton.OK);
                        return "Главный определитель равен нулю.\nРешить систему методом Крамера невозможно.\nИспользуйте метод Гаусса.";
                    }
                    else
                    {
                        double determinant1 = (equation[0, 2] * equation[1, 1]) - (equation[0, 1] * equation[1, 2]);

                        double determinant2 = (equation[0, 0] * equation[1, 2]) - (equation[0, 2] * equation[1, 0]);

                        double res1 = Math.Round(determinant1 / mainDeterminant, 3);

                        double res2 = Math.Round(determinant2 / mainDeterminant, 3);
                        
                        //MessageBox.Show($"a = {res1}; b = {res2}", "", MessageBoxButton.OK);

                        return $"a = {res1}\nb = {res2}";
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
                return "Ошибка";
            }
        }

        public static void JordanGauss(double[,] equation)
        {
            MessageBox.Show("Упс.. А реализации то нет.\nЯ не смог понять как реализовать метод Жордана-Гаусса...", "Егор не смог понять.");
        }

        //
        // a1 b1 c1 s1
        // a2 b2 c2 s2
        // a3 b3 c3 s3
        //
        // a1 b1 s1
        // a2 b2 s2
        //
        public static string Gauss(double[,] equation)
        {
            if (equation.GetLength(0) == 3)
            {
                try
                {
                    for (int i = 0; i < equation.GetLength(0); i++)
                    {
                        if (equation[0, 0] == 1)
                        {
                            break;
                        }
                        else if (equation[i, 0] == 1)
                        {
                            for (int j = 0; j < equation.GetLength(0) + 1; j++)
                            {
                                double tmpMassElement = equation[0, j];

                                equation[0, j] = equation[i, j];

                                equation[i, j] = tmpMassElement;
                            }
                        }
                    }

                    double tmpNum = equation[1, 0] > 0 ? -1 : 1;

                    double tmp = 0;

                    while (true)
                    {
                        tmp = equation[0, 0] * tmpNum;

                        if (equation[1, 0] + tmp == 0)
                        {
                            break;
                        }
                        if (tmpNum < 0)
                        {
                            tmpNum--;
                        }
                        else
                        {
                            tmpNum++;
                        }
                    }

                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[0, i] *= tmpNum;
                    }

                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[1, i] += equation[0, i];
                        equation[0, i] /= tmpNum;
                    }

                    //работа с 3й строкой
                    ///////////////////////////////////////////////////
                    while (true)
                    {
                        tmp = equation[0, 0] * tmpNum;

                        if (equation[2, 0] + tmp == 0)
                        {
                            break;
                        }
                        if (tmpNum < 0)
                        {
                            tmpNum--;
                        }
                        else
                        {
                            tmpNum++;
                        }
                    }

                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[0, i] *= tmpNum;
                    }

                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[2, i] += equation[0, i];
                        equation[0, i] /= tmpNum;
                    }


                    //сокращение
                    for (int i = 1; i < 3; i++)
                    {
                        if (equation[i, 1] % 2 != 0 && equation[i, 2] % 2 != 0)
                        {
                            for (int j = 3; j >= 1; j--)
                            {
                                equation[i, j] /= equation[i, 1];

                            }
                        }
                        else
                        {
                            double tmp2 = 2;

                            for (int j = 1; j < 4; j++)
                            {
                                if (equation[i, 1] < 0)
                                {
                                    tmp2 = -2;
                                }
                                equation[i, j] /= tmp2;

                            }
                        }
                    }

                    //*
                    double tmpNum2 = equation[2, 1] * -1;
                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[1, i] *= tmpNum2;

                    }

                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[2, i] += equation[1, i];
                        equation[1, i] /= tmpNum2;

                    }

                    //
                    double tmpNum3 = equation[1, 2] * -1;
                    for (int i = 0; i < equation.GetLength(0) + 1; i++)
                    {
                        equation[2, i] *= tmpNum3;

                    }

                    double z = equation[2, 3] / equation[2, 2];

                    double y = equation[1, 3] + (z * equation[1, 2] * (-1));

                    double x = equation[0, 3] + (equation[0, 1] * y * (-1)) + (equation[0, 2] * z * (-1));

                    //MessageBox.Show($"x = {x}; y = {y}; z = {z}");

                    return $"x = {x}\ny = {y}\nz = {z}";
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                    return "Ошибка";
                }
            }
            else
            {
                try
                {
                    double tmpNum = equation[1, 0] < 0 ? -1 : 1;

                    double tmpLogicElement = equation[0, 0] * tmpNum;

                    equation[0, 0] /= tmpLogicElement;
                    equation[0, 1] /= tmpLogicElement;
                    equation[0, 2] /= tmpLogicElement;

                    tmpLogicElement = equation[1, 0];
                    for (int i = 0; i < 3; i++)
                    {
                        equation[1, i] -= equation[0, i] * tmpLogicElement;
                   
                    }

                    double tmpNum2 = equation[1, 1] > 0 ? -1 : 1;

                    tmpLogicElement = equation[1, 1] * tmpNum2;

                    equation[1, 1] /= tmpLogicElement;
                    equation[1, 2] /= tmpLogicElement;

                    double y = equation[1, 2];

                    double x = equation[0, 2] + (equation[0, 1] * y * (-1));

                    //MessageBox.Show($"x = {x}, y = {y}");
                    return $"x = {x}\ny = {y}";
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                    return "Ошибка";
                }
            }
        }

        public static string SimpleIteration(double[,] equation)
        {
            try
            {
                if (equation.GetLength(0) == 3)
                {
                    double[] tmpMass = new double[3] { equation[0, 0], equation[1, 1], equation[2, 2] };

                    for (int i = 0; i < tmpMass.Length; i++)
                    {
                        for (int j = 0; j < tmpMass.Length - 1; j++)
                        {
                            if (tmpMass[j] < tmpMass[j + 1])
                            {
                                double tmpElement = tmpMass[j];
                                tmpMass[j] = tmpMass[j + 1];
                                tmpMass[j + 1] = tmpElement;
                            }
                        }
                    }

                    double[,] sortedArray = new double[3, 4] { { tmpMass[0], 0, 0, 0 }, { 0, tmpMass[1], 0, 0 }, { 0, 0, tmpMass[2], 0 } };

                    bool flag = false;

                    for (int i = 0; i < sortedArray.GetLength(0); i++)
                    {
                        for (int j1 = 0; j1 < sortedArray.GetLength(1); j1++)
                        {
                            for (int i1 = 0; i1 < equation.GetLength(1); i1++)
                            {
                                if (sortedArray[i, j1] == equation[i, i1])
                                {
                                    for (int colm = 0; colm < equation.GetLength(1); colm++)
                                    {
                                        sortedArray[i, colm] = equation[i1, colm];
                                        flag = true;
                                    }

                                    break;
                                }

                                if (flag)
                                {
                                    break;
                                }
                            }

                            if (flag)
                            {
                                break;
                            }

                        }
                        flag = false;
                    }

                    double prevX1 = 0;
                    double prevX2 = 0;
                    double prevX3 = 0;

                    double d1 = 0;
                    double d2 = 0;
                    double d3 = 0;

                    double maxD = 0;

                    double x1 = (sortedArray[0, 3] + (sortedArray[0, 1] * (-1) * 0) + (sortedArray[0, 2] * (-1) * 0)) / sortedArray[0, 0];

                    double x2 = (sortedArray[1, 3] + (sortedArray[1, 0] * (-1) * 0) + (sortedArray[1, 2] * (-1) * 0)) / sortedArray[1, 1];

                    double x3 = (sortedArray[2, 3] + (sortedArray[2, 0] * (-1) * 0) + (sortedArray[2, 1] * (-1) * 0)) / sortedArray[2, 2];


                    for (int i = 0; i < 15; i++)
                    {
                        prevX1 = x1;
                        x1 = (sortedArray[0, 3] + (sortedArray[0, 1] * prevX2 * (-1)) + (sortedArray[0, 2] * prevX3 * (-1))) / sortedArray[0, 0];
                        d1 = Math.Abs(prevX1 - x1);

                        prevX2 = x2;
                        x2 = (sortedArray[1, 3] + (sortedArray[1, 0] * prevX1 * (-1)) + (sortedArray[1, 2] * prevX3 * (-1))) / sortedArray[1, 1];
                        d2 = Math.Abs(prevX2 - x2);

                        prevX3 = x3;
                        x3 = (sortedArray[2, 3] + (sortedArray[2, 0] * prevX1 * (-1)) + (sortedArray[2, 1] * prevX2 * (-1))) / sortedArray[2, 2];
                        d3 = Math.Abs(prevX3 - x3);

                        maxD = Math.Max(d1, d2);
                        maxD = Math.Max(maxD, d3);

                        if (maxD < 0.001)
                        {
                            break;
                        }
                    }

                    //MessageBox.Show($"a = {Math.Round(x1, 3)} ± 0,001\n" +
                    //    $"b = {Math.Round(x2, 3)} ± 0,001\n" +
                    //    $"c = {Math.Round(x3, 3)} ± 0,001\n");

                    return $"a = {Math.Round(x1, 3)} ± 0,001\n" +
                        $"b = {Math.Round(x2, 3)} ± 0,001\n" +
                        $"c = {Math.Round(x3, 3)} ± 0,001\n";
                }
                else
                {
                    double[] tmpMass = new double[2] { equation[0, 0], equation[1, 1]};

                    for (int i = 0; i < tmpMass.Length; i++)
                    {
                        for (int j = 0; j < tmpMass.Length - 1; j++)
                        {
                            if (tmpMass[j] < tmpMass[j + 1])
                            {
                                double tmpElement = tmpMass[j];
                                tmpMass[j] = tmpMass[j + 1];
                                tmpMass[j + 1] = tmpElement;
                            }
                        }
                    }

                    double[,] sortedArray = new double[2, 3] { { tmpMass[0], 0, 0}, { 0, tmpMass[1], 0}};

                    bool flag = false;

                    for (int i = 0; i < sortedArray.GetLength(0); i++)
                    {
                        for (int j1 = 0; j1 < sortedArray.GetLength(1); j1++)
                        {
                            for (int i1 = 0; i1 < equation.GetLength(1); i1++)
                            {
                                if (sortedArray[i, j1] == equation[i, i1])
                                {
                                    for (int colm = 0; colm < equation.GetLength(1); colm++)
                                    {
                                        sortedArray[i, colm] = equation[i1, colm];
                                        flag = true;
                                    }

                                    break;
                                }

                                if (flag)
                                {
                                    break;
                                }
                            }

                            if (flag)
                            {
                                break;
                            }

                        }
                        flag = false;
                    }

                    double prevX1 = 0;
                    double prevX2 = 0;

                    double d1 = 0;
                    double d2 = 0;

                    double maxD = 0;

                    double x1 = (sortedArray[0, 2] + (sortedArray[0, 1] * (-1) * 0)) / sortedArray[0, 0];
                    double x2 = (sortedArray[1, 2] + (sortedArray[1, 1] * (-1) * 0)) / sortedArray[1, 1];


                    for (int i = 0; i > 15; i++)
                    {
                        prevX1 = x1;
                        x1 = (sortedArray[0, 3] + (sortedArray[0, 1] * (-1) * prevX2)) / sortedArray[0, 0];
                        d1 = Math.Abs(prevX1 - x1);

                        prevX2 = x2;
                        x2 = (sortedArray[1, 3] + (sortedArray[1, 1] * (-1) * prevX1)) / sortedArray[1, 1];
                        d2 = Math.Abs(prevX2 - x2);

                        maxD = Math.Max(d1, d2);

                        if (maxD < 0.001)
                        {
                            break;
                        }
                    }

                    //MessageBox.Show($"a = {Math.Round(x1, 3)} ± 0,001\n" +
                    //    $"b = {Math.Round(x2, 3)} ± 0,001\n");

                    return $"a = {Math.Round(x1, 3)} ± 0,001\n" +
                        $"b = {Math.Round(x2, 3)} ± 0,001\n";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
                return "Ошибка";
            }
        }

        public static string Seidel(double[,] equation)
        {
            try
            {
                if (equation.GetLength(0) == 3)
                {
                    double[] tmpMass = new double[3] { equation[0, 0], equation[1, 1], equation[2, 2] };

                    for (int i = 0; i < tmpMass.Length; i++)
                    {
                        for (int j = 0; j < tmpMass.Length - 1; j++)
                        {
                            if (tmpMass[j] < tmpMass[j + 1])
                            {
                                double tmpElement = tmpMass[j];
                                tmpMass[j] = tmpMass[j + 1];
                                tmpMass[j + 1] = tmpElement;
                            }
                        }
                    }

                    double[,] sortedArray = new double[3, 4] { { tmpMass[0], 0, 0, 0 }, { 0, tmpMass[1], 0, 0 }, { 0, 0, tmpMass[2], 0 } };

                    bool flag = false;

                    for (int i = 0; i < sortedArray.GetLength(0); i++)
                    {
                        for (int j1 = 0; j1 < sortedArray.GetLength(1); j1++)
                        {
                            for (int i1 = 0; i1 < equation.GetLength(1); i1++)
                            {
                                if (sortedArray[i, j1] == equation[i, i1])
                                {
                                    for (int colm = 0; colm < equation.GetLength(1); colm++)
                                    {
                                        sortedArray[i, colm] = equation[i1, colm];
                                        flag = true;
                                    }

                                    break;
                                }

                                if (flag)
                                {
                                    break;
                                }
                            }

                            if (flag)
                            {
                                break;
                            }

                        }
                        flag = false;
                    }

                    double prevX1 = 0;
                    double prevX2 = 0;
                    double prevX3 = 0;

                    double d1 = 0;
                    double d2 = 0;
                    double d3 = 0;

                    double maxD = 0;

                    double x1 = (sortedArray[0, 3] + (sortedArray[0, 1] * (-1) * 0) + (sortedArray[0, 2] * (-1) * 0)) / sortedArray[0, 0];

                    double x2 = (sortedArray[1, 3] + (sortedArray[1, 0] * (-1) * 0) + (sortedArray[1, 2] * (-1) * 0)) / sortedArray[1, 1];

                    double x3 = (sortedArray[2, 3] + (sortedArray[2, 0] * (-1) * 0) + (sortedArray[2, 1] * (-1) * 0)) / sortedArray[2, 2];


                    for (int i = 0; i < 15; i++)
                    {
                        prevX1 = x1;
                        x1 = (sortedArray[0, 3] + (sortedArray[0, 1] * x2 * (-1)) + (sortedArray[0, 2] * x3 * (-1))) / sortedArray[0, 0];
                        d1 = Math.Abs(prevX1 - x1);

                        prevX2 = x2;
                        x2 = (sortedArray[1, 3] + (sortedArray[1, 0] * x1 * (-1)) + (sortedArray[1, 2] * x3 * (-1))) / sortedArray[1, 1];
                        d2 = Math.Abs(prevX2 - x2);

                        prevX3 = x3;
                        x3 = (sortedArray[2, 3] + (sortedArray[2, 0] * x1 * (-1)) + (sortedArray[2, 1] * x2 * (-1))) / sortedArray[2, 2];
                        d3 = Math.Abs(prevX3 - x3);

                        maxD = Math.Max(d1, d2);
                        maxD = Math.Max(maxD, d3);

                        if (maxD < 0.001)
                        {
                            break;
                        }
                    }

                    //MessageBox.Show($"a = {Math.Round(x1, 3)} ± 0,001\n" +
                    //    $"b = {Math.Round(x2, 3)} ± 0,001\n" +
                    //    $"c = {Math.Round(x3, 3)} ± 0,001\n");

                    return $"a = {Math.Round(x1, 3)} ± 0,001\n" +
                        $"b = {Math.Round(x2, 3)} ± 0,001\n" +
                        $"c = {Math.Round(x3, 3)} ± 0,001\n";
                }
                else
                {
                    double[] tmpMass = new double[2] { equation[0, 0], equation[1, 1] };

                    for (int i = 0; i < tmpMass.Length; i++)
                    {
                        for (int j = 0; j < tmpMass.Length - 1; j++)
                        {
                            if (tmpMass[j] < tmpMass[j + 1])
                            {
                                double tmpElement = tmpMass[j];
                                tmpMass[j] = tmpMass[j + 1];
                                tmpMass[j + 1] = tmpElement;
                            }
                        }
                    }

                    double[,] sortedArray = new double[2, 3] { { tmpMass[0], 0, 0 }, { 0, tmpMass[1], 0 } };

                    bool flag = false;

                    for (int i = 0; i < sortedArray.GetLength(0); i++)
                    {
                        for (int j1 = 0; j1 < sortedArray.GetLength(1); j1++)
                        {
                            for (int i1 = 0; i1 < equation.GetLength(1); i1++)
                            {
                                if (sortedArray[i, j1] == equation[i, i1])
                                {
                                    for (int colm = 0; colm < equation.GetLength(1); colm++)
                                    {
                                        sortedArray[i, colm] = equation[i1, colm];
                                        flag = true;
                                    }

                                    break;
                                }

                                if (flag)
                                {
                                    break;
                                }
                            }

                            if (flag)
                            {
                                break;
                            }

                        }
                        flag = false;
                    }

                    double prevX1 = 0;
                    double prevX2 = 0;

                    double d1 = 0;
                    double d2 = 0;

                    double maxD = 0;

                    double x1 = (sortedArray[0, 2] + (sortedArray[0, 1] * (-1) * 0)) / sortedArray[0, 0];
                    double x2 = (sortedArray[1, 2] + (sortedArray[1, 1] * (-1) * 0)) / sortedArray[1, 1];


                    for (int i = 0; i > 15; i++)
                    {
                        prevX1 = x1;
                        x1 = (sortedArray[0, 3] + (sortedArray[0, 1] * (-1) * x2)) / sortedArray[0, 0];
                        d1 = Math.Abs(prevX1 - x1);

                        prevX2 = x2;
                        x2 = (sortedArray[1, 3] + (sortedArray[1, 1] * (-1) * x1)) / sortedArray[1, 1];
                        d2 = Math.Abs(prevX2 - x2);

                        maxD = Math.Max(d1, d2);

                        if (maxD < 0.001)
                        {
                            break;
                        }
                    }

                    //MessageBox.Show($"a = {Math.Round(x1, 3)} ± 0,001\n" +
                    //    $"b = {Math.Round(x2, 3)} ± 0,001\n");

                    return $"a = {Math.Round(x1, 3)} ± 0,001\n" +
                        $"b = {Math.Round(x2, 3)} ± 0,001\n";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
                return "Ошибка";
            }
        }
    }
}