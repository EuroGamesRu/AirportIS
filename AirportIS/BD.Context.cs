﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Aircrafts> Aircrafts { get; set; }
        public virtual DbSet<Airports> Airports { get; set; }
        public virtual DbSet<Boardiang_passes> Boardiang_passes { get; set; }
        public virtual DbSet<Bookings> Bookings { get; set; }
        public virtual DbSet<Flights> Flights { get; set; }
        public virtual DbSet<Passenger> Passenger { get; set; }
        public virtual DbSet<Seats> Seats { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Ticket_flights> Ticket_flights { get; set; }
        public virtual DbSet<Tickets> Tickets { get; set; }
    }
}
