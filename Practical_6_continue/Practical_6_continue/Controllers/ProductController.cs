using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Practical_6_continue.Models;
                                                    
namespace Practical_6_continue.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            List<Product> P = new List<Product>();
            P = GetProducts();
            return View(P);
        }
        public ActionResult Details(int id)
        {
            List<Product> Pall = GetProducts();
            Product P1 = GetProducts().FirstOrDefault(x => x.ProductId == id);
            return View(P1);
        }
        private List<Product> GetProducts()
        {
            List<Product> P = new List<Product>();
            P.Add(new Product { ProductId = 1, ProductName = "Laptop", Description = "dal laptop", Price = 50000 , Category = "Electronics" });
            P.Add(new Product { ProductId = 2, ProductName = "Mobile", Description = "Apol smartphone", Price = 20000, Category = "Electronics" });
            P.Add(new Product { ProductId = 3, ProductName = "Tablet", Description = "sumsan tablet", Price = 30000, Category = "Electronics" });
            P.Add(new Product { ProductId = 4, ProductName = "Headphones", Description = "Sunny headphones", Price = 5000, Category = "Electronics" });
            P.Add(new Product { ProductId = 5, ProductName = "Smartwatch", Description = "Nice smartwatch", Price = 15000, Category = "Electronics" });
            return P;
        }
    }
}