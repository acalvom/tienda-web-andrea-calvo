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

        [Authorize]
        public ActionResult Index(Carrito carrito)
        {
            return View(carrito);
        }

        [Authorize]
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

                Pedido pedido = new Pedido();
                pedido.Nombre_Cliente = User.Identity.Name;
                pedido.Fecha = DateTime.Now;
                pedido.Id_Producto = producto.Id;
                pedido.Cantidad = p.Cantidad;
                db.Pedidos.Add(pedido);
                string nombreProducto = producto.Nombre;
            }

            db.SaveChanges();
            carrito.Clear();
            return RedirectToAction("Index", "Productos");
        }
    }
}
