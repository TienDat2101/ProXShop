using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class BillController : Controller
    {
        private CS4PEntities db = new CS4PEntities();

        private List<BillDetai> ShoppingCart = null;

        private void GetShoppingCart()
        {
            if (Session["ShoppingCart"] != null)
                GetShoppingCart = Session["ShoppingCart"] as List<BillDetai>;
            else
            {
                ShoppingCart = new List<BillDetai>();
                Session["ShoppingCart"] = ShoppingCart;
            }
        }
        // GET: Donhang
        public ActionResult Index()
        {
            var model = db.Bill.ToList();
            return View(model);
        }

        public ActionResult Create()
        {
            GetShoppingCart();
                ViewBag.Cart = ShoppingCart;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BillController model)
        {
            ValidateBill(model);
            if (ModelState.IsValid)
            {
                model.Date = DateTime.Now;
                db.Bills.Add(model);
                db.SaveChanges();

                foreach (var item in ShoppingCart)
                {
                    db.BillDetails.Add(new BillDetai
                    {
                        Bill_id = model.id,
                        Product_id = item.Product.id,
                        Price = item.Product.Price,
                        Quantity = item.Quantity
                    });
                }
                db.SaveChanges();
                Session["ShoppingCart"] = null;

                return RedirectToAction("Index2", "Products");
            }
            GetShoppingCart();
            ViewBag.Cart = ShoppingCart;
            return View(model);
        }

        private void ValidateBill(BillController model)
        {
            var regex = new Regex("[0-9]{3}");
            GetShoppingCart();
            if (ShoppingCart.Count == 0)
                ModelState.AddModelError("", "There is no item in shopping cart!");
            if (regex.IsMatch(model.Phone))
                ModelState.AddModelError("Phone", "Weong phone number");
        }
    }
}