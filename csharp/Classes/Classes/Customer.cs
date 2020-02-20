using System.Collections.Generic;

namespace Classes
{
    public class Customer
    {
        public int id;
        public string Name;
        public List<Order> Orders;

        public Customer()
        {
            this.Orders = new List<Order>();
        }

        public Customer(string name)
            : this()
        {
            this.Name = name;
        }

        public Customer(int id, string name)
            : this(name)
        {
            this.id = id;
        }
    }
}
