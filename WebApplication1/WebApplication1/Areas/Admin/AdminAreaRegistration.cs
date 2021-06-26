﻿using System.Web.Mvc;

namespace WebApplication1.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Login", controller ="Admin", id = UrlParameter.Optional },
                namespaces: new[] { "WebApplication1.Areas.Admin.Controllers" }
            );
        }
    }
}