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
    
    public partial class Boardiang_passes
    {
        public int ticket_no { get; set; }
        public int flight_id { get; set; }
        public int boarding_no { get; set; }
        public int seat_no { get; set; }
    
        public virtual Seats Seats1 { get; set; }
    }
}
