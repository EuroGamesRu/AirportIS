using System.Windows.Controls;
using AirportIS.Resources.views;

namespace AirportIS.Resources.pages.MainWindowsPage
{
    /// <summary>
    /// Логика взаимодействия для Page1.xaml
    /// </summary>
    public partial class Page1 : Page
    {
        CatalogViewModel _catalogViewModel;
        public Page1()
        {
            InitializeComponent();
            _catalogViewModel = new CatalogViewModel();
            DataContext = new CatalogViewModel();
        }
        private void TextBox_TextChanged(object sender, TextChangedEventArgs e) => _catalogViewModel.Updateist();
    }
}
