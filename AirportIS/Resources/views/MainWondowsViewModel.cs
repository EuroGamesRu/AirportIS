using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using AirportIS.Resources.pages.MainWindowsPage;

namespace AirportIS.Resources.views
{
    class MainWondowsViewModel : INotifyPropertyChanged
    {
        private void PropertyChange(string property) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(property));
        public event PropertyChangedEventHandler PropertyChanged;


        
        public Users Users { get; private set; }
        public ObservableCollection<Page> PageCollections { get; set; }

        private Page _currentPage;

        public Page CurrentPage
        {
            get => _currentPage;
            set
            {
                if (_currentPage != value)
                {
                    _currentPage = value;
                    PropertyChange("CurrentPage");
                }
            }
        }


        public MainWondowsViewModel(Users users)
        {
            Users = users;
            PageCollections = new ObservableCollection<Page>();
            PageCollections.Add(new Page1());
            if (users.role != "Пользователь")
            {
                PageCollections.Add(new Page2());
            }
           
            if (users.role == "Администратор")
            {
                PageCollections.Add(new Page3());
            }
            CurrentPage = PageCollections[0];
        }
    }
}
