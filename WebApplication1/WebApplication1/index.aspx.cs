using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        int? respuestaLogueo;
        protected void Page_Load(object sender, EventArgs e)
        { // leer las variables desde la URL
            Cargar_Variables_De_URL(Request.QueryString["Maestro"], Request.QueryString["Ano"], Request.QueryString["Tema"], Request.QueryString["Colegio"], Request.QueryString["Materia"], Request.QueryString["Enunciado1"], Request.QueryString["Enunciado2"], Convert.ToBoolean(Request.QueryString["Boton_Enunciado"]), Convert.ToBoolean(Request.QueryString["Boton_Ficha"]), Convert.ToInt16(Request.QueryString["Caso"]), Convert.ToBoolean(Request.QueryString["Boton_MiEjercicio"]), Convert.ToBoolean(Request.QueryString["Boton_MiExplicacion"])); // carga las variables de la URL   
        }

        [WebMethod]              // creamos un metodo para determinar la ubicacion 
        public static string Ubicacion(string longitud, string latitud)    // el método debe ser de static
        {            
            return latitud + "," + longitud;
        }

        // leemos y codificamos las variables del url
        public void Cargar_Variables_De_URL(string Maestro, string Ano, string Tema, string Colegio, string Materia, string Enunciado1, string Enunciado2, bool Boton_Enunciado, bool Boton_Ficha, int Caso, bool Boton_MiEjercicio, bool Boton_MiExplicacion)
        {
            ViewState["Etiqueta_Maestro"] = dLIB.Metodo_Buscar_Profesor(Maestro); // recupera desde el URL el Maestro y lo convierto en etiqueta de busqueda para ficha
            ViewState["Etiqueta_Ano"] = dLIB.Metodo_Buscar_Ano(Ano); // recupera desde el URL el Ano y lo convierto en etiqueta de busqueda para ficha
            ViewState["Etiqueta_Tema"] = dLIB.Metodo_Buscar_Tema(Tema); // recupera desde el URL el Tema y lo convierto en etiqueta de busqueda para ficha
            ViewState["Etiqueta_Colegio"] = dLIB.Metodo_Buscar_Colegio(Colegio); // recupera desde el URL el Colegio y lo convierto en etiqueta de busqueda para ficha
            ViewState["Etiqueta_Materia"] = dLIB.Metodo_Buscar_Materia(Materia); // recupera desde el URL el Materia y lo convierto en etiqueta de busqueda para ficha
            ViewState["Boton_Enunciado"] = Boton_Enunciado;
            ViewState["Boton_Ficha"] = Boton_Ficha;
            ViewState["Enunciado1"] = Enunciado1;
            ViewState["Enunciado2"] = Enunciado2;
            ViewState["Caso"] = Caso;

        }




        public void BtnIngresar_Click(object sender, EventArgs e)
        {
            db.LogueoUsuario(int.Parse(TextBoxCodigo.Text), ref respuestaLogueo);

            if (respuestaLogueo == 1) 
            {
                string ubicacion = HiddenField_lon.Value;
                string[] latlon = new string[2];
                latlon = ubicacion.Split(',');
                Session["latitud"] = latlon[0];
                Session["longitud"] = latlon[1];
                // lote de cerveza
                // negocio
                Response.Redirect("mensajes.aspx");
            }
            
        }
    }
}