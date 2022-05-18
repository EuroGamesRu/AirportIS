using System.Windows.Controls;
using AirportIS.Resources.views;

namespace AirportIS.Resources.pages.MainWindowsPage
{
    /// <summary>
    /// Логика взаимодействия для Page2.xaml
    /// </summary>
    public partial class Page2 : Page
    {
        CatalogViewModel _catalogViewModel;
        public Page2()
        {
            InitializeComponent();
            _catalogViewModel = new CatalogViewModel();
            DataContext = new CatalogViewModel();
        }
         private void TextBox_TextChanged(object sender, TextChangedEventArgs e) => _catalogViewModel.Updateist();
    }
}
