using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class ShoppingCartController : Controller
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

        // GET: ShoppingCart
        public ActionResult Index()
        {
            GetShoppingCart();
            var hashtable = new Hashtable();
            foreach (var billDetail in ShoppingCart)
            {
                if (hashtable[billDetail.Product.id] != null)
                {
                    (hashtable[billDetail.Product.id] as BillDetail).Quantity += billDetail.Quantity;
                }
                else hashtable[billDetail.Product.id] = billDetail;
            }

            ShoppingCart.Clear();
            foreach (BillDetail billDetail in hashtable.values)
                ShoppingCart.Add(billDetail);
            return View(ShoppingCart);
        }

        // GET: ShoppingCart/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ShoppingCart/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ShoppingCart/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ShoppingCart/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ShoppingCart/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: ShoppingCart/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ShoppingCart/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
