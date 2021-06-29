using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
using WebApplication1.Service;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
    
        CT25Team11Entities model = new CT25Team11Entities();
        CommonService commonService = new CommonService();
        // GET: Admin/Admin
        public ActionResult Login()
        {
            
            return View();
        }
        [HttpPost]
        //[Filter.AuthorizeAdmin]
        public ActionResult Login(string email, string password)
        {
            var admin = model.TaiKhoans.FirstOrDefault(x => x.Tentaikhoan == email);

            if (admin != null)
            {
                //string pass = commonService.hash(password);
                Session.Timeout = 30;
                if (admin.Matkhau.Equals(password))
                {
                    Session["FullName"] = admin.Tentaikhoan;
                    Session["isAdmin"] = "Admin";
                    return RedirectToAction("Index", "Sanphams");
                    
                }
            }
            else
            {
                ViewBag.mgs = "tài khoản không tồn tại";
                return View();
            }
            return View();
        }

        //[Filter.AuthorizeAdmin]
        public ActionResult Logout()
        {
            Session.Clear();
            Session.RemoveAll();
            return View("Login");
        }

        public ActionResult Dashboard()
        {
            return View();
        }
    }
}