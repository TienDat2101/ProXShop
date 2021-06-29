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
        private CT25Team11Entities db = new CT25Team11Entities();

        private List<Chitietdonhang> ShoppingCart = null;

        private void GetShoppingCart()
        {
            if (Session["ShoppingCart"] != null)
                ShoppingCart = Session["ShoppingCart"] as List<Chitietdonhang>;
            else
            {
                ShoppingCart = new List<Chitietdonhang>();
                Session["ShoppingCart"] = ShoppingCart;
            }
        }

        [Authorize(Roles ="Admin")]
        // GET: Donhang
        public ActionResult Index()
        {
            var model = db.Donhangs.ToList();
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
        public ActionResult Create(Donhang model)
        {

            if (ModelState.IsValid)
            {
                model.Ngaytaodon = DateTime.Now;
                db.Donhangs.Add(model);
                db.SaveChanges();

                foreach (var item in ShoppingCart)
                {
                    db.Chitietdonhangs.Add(new Chitietdonhang
                    {
                        Madonhang = model.Madonhang,
                        Masanpham = item.Masanpham,
                        Gia = item.Gia,
                        Soluong = item.Soluong
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
            //if (regex.IsMatch(model.Phone))
            //    ModelState.AddModelError("Phone", "Weong phone number");
        }
    }
}