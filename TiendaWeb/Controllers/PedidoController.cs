using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TiendaWeb.Models;

namespace TiendaWeb.Controllers
{
    public class PedidoController : Controller
    {
        private tiendaWeb db = new tiendaWeb();

        [Authorize]
        public ActionResult Index()
        {
            return View(db.Pedidos.ToList());
        }
    }
}