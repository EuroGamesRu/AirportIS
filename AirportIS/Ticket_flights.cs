//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AirportIS
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ticket_flights
    {
        public int ticket_no { get; set; }
        public int flight_id { get; set; }
        public string fare_conditions { get; set; }
        public int amount { get; set; }
    
        public virtual Flights Flights { get; set; }
        public virtual Tickets Tickets { get; set; }
    }
}
