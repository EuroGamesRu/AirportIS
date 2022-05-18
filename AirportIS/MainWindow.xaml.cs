using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;
using System.Text.RegularExpressions;


namespace AirportIS
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        
        private void AuthBTN_Click(object sender, RoutedEventArgs e)
        {
            char str1 = LoginText.Text[0];
            if (!String.IsNullOrEmpty(LoginText.Text))
            {
                if (Regex.IsMatch(str1.ToString(), "[а-яА-ЯA-Za-z]$"))
                {
                    if (!String.IsNullOrEmpty(PWDText.Password))
                    {
                        if (PWDText.Password.Length > 6)
                        {
                            if (Regex.IsMatch(PWDText.Password, "[a-zа-яёA-ZА-ЯЁ]+"))
                            {
                                if (Regex.IsMatch(PWDText.Password, "[1-9]+"))
                                {
                                    IQueryable<Users> users = Entities1.GetContext().Users.Where(p => p.Login == LoginText.Text && p.password == PWDText.Password);
                                    if (users.Count() == 1)
                                    {
                                        
                                        //MessageBox.Show("Велкоме");
                                        Window index = new index(users.First());
                                        index.Owner = this;
                                        index.Show();
                                        this.Hide();
                                    }
                                    else
                                    {
                                        MessageBox.Show("Неверный пароль или логин");
                                    }
                                }
                                else
                                {
                                    MessageBox.Show("Пароль должен содержать хотя бы 1 цифру");
                                } 
                            }
                            else
                            {
                                MessageBox.Show("Пароль должен содержать хотя бы 1 букву");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Длинна пароля должна быть более 6 символов");
                        }
                        
                    }
                }
                else
                {
                    MessageBox.Show("В логине должна быть первая буква");
                }
            }
        }
        
    }
}
