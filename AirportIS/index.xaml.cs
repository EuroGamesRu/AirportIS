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
using System.Windows.Shapes;
using AirportIS.Resources.views;

namespace AirportIS
{
    /// <summary>
    /// Логика взаимодействия для index.xaml
    /// </summary>
    public partial class index : Window
    {
        public index(Users users)
        {
            InitializeComponent();
            DataContext = new MainWondowsViewModel(users);
            
        }

        private void BTNExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
            this.Owner.Show();
        }

        private void WindowsClose(object sender, EventArgs e)
        {
            this.Close();
            this.Owner.Show();
        }
    }
}
