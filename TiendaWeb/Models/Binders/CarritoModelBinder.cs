using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TiendaWeb.Models.Binders
{
    public class CarritoModelBinder : IModelBinder
    {
        private static string KEY_CARRITO = "KEY:1234";
        public object BindModel(ControllerContext controllerContext,
            ModelBindingContext bindingContext)
        {
            //El carrito de la compra se almacena en la KEY:1234    
            Carrito cc = (Carrito)controllerContext.HttpContext.Session[KEY_CARRITO]; // Para acceder a las variables de sesión
            if (cc == null) // Si no existe el carrito la sentencia anterior devolvera un null. Si es null, creo el carrito
            {
                cc = new Carrito();
                controllerContext.HttpContext.Session[KEY_CARRITO] = cc;
            }
            return cc;
        }
    }
}