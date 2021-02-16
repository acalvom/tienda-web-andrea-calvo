using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TiendaWeb.Models;

namespace TiendaWeb.Controllers
{
    public class CarritoController : Controller
    {
        private tiendaWeb db = new tiendaWeb();
        public ActionResult Index(Carrito carrito)
        {
            return View(carrito);
        }

        public ActionResult BuyOrder(Carrito carrito)
        {
            foreach (Producto p in carrito)
            {
                Producto producto = db.Productos.Find(p.Id);
                short stock = (short)(producto.Cantidad - p.Cantidad);

                if (stock < 0)
                {
                    producto.Cantidad = 0;
                }
                else
                {
                    producto.Cantidad = stock;
                }
            }

            db.SaveChanges();
            carrito.Clear();
            return RedirectToAction("Index", "Productos");
        }
    }
}
