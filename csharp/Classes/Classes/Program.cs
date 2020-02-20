using System;

namespace Classes
{
    class Program
    {
        static void Main(string[] args)
        {
            Customer customer = new Customer("Tas");

            var order = new Order();
            customer.Orders.Add(order);

            Console.WriteLine(customer.Name);
        }
    }
}
