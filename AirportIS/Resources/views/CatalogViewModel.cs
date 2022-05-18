using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace AirportIS.Resources.views
{
    class CatalogViewModel : INotifyPropertyChanged
    {
        //private void PropertyChange(string property) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(property));
         public event PropertyChangedEventHandler PropertyChanged;
         public ObservableCollection<Airports> Airports { get; set; }
         public string SearchString { get; set; } = "";
        public CatalogViewModel()
        {
            Airports = new ObservableCollection<Airports>();
            Updateist();
        }

        public void Updateist()
        {
            try
            {
                Airports.Clear();
                List<Airports> airports = Entities1.GetContext().Airports.ToList();

                if (!String.IsNullOrWhiteSpace(SearchString))
                    airports = airports.Where(p => p.airport_name.Contains(SearchString.Trim())).ToList();

                if (airports.Count != 0)
                {
                    foreach (Airports airport in airports)
                        Airports.Add(airport);
                }
                else MessageBox.Show("Ничего не найдено", "Результат поиска");
               // Airports = new ObservableCollection<Airports>(Entities1.GetContext().Airports);
            }
            catch(Exception e)
            {
                MessageBox.Show("Ошибка: "+e.Message);
            }
        }
    }
    /*class ListPassangerToStringConvert : IValueConverter
    {
        public object Convert(object value, Type targetType, object parametr, CultureInfo culture)
        {
            ICollection<Passenger> passenger = value as ICollection<Passenger>;
            return string.Join(", ", passenger.Select(p => p.passenger_name + " " + p.dob + " " + p.passport));
        }
        public object ConvertBack(object value, Type targetType, object parametr, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }*/
}
