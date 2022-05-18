using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace AirportIS.Resources.converters
{
    class RelativeToFullPatchConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            string path = value as string;
            if (String.IsNullOrWhiteSpace(path)) return "../Resources/Images/noimage.png";
            try
            {
                return !File.Exists(path) ? "../Resources/Images/noimage.png" : Path.GetFullPath(path);
            }
            catch
            {
                return "../Resources/Images/noimage.png";
            }
        }
        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
