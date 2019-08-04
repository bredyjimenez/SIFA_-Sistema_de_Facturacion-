using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // importar

namespace SIFA_SistemadeFacturacion_
{
    public partial class Nacionalidades : System.Web.UI.Page
    {
        //Metodo limpiar
        protected void Limpiar(Panel p)
        {
            foreach (var c in p.Controls)
            {
                if (c is TextBox)
                {
                    (c as TextBox).Text = "";
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar(pCambio);
            pCambio.Visible = true;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            SqlDataSouerceNacionalidad.SelectParameters["id"].DefaultValue = txtNombreBusqueda.Text;
            SqlDataSouerceNacionalidad.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSouerceNacionalidad.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                txtCodigo.Text = registros["id"].ToString();
                txtNombre.Text = registros["nombre"].ToString();
                txtEstado.Text = registros["estado"].ToString();
                txtNombreBusqueda.Text = "";
                pCambio.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error al buscar')</script>");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSouerceNacionalidad.InsertParameters[0].DefaultValue = txtNombre.Text;
            SqlDataSouerceNacionalidad.InsertParameters[1].DefaultValue = txtEstado.Text;
            SqlDataSouerceNacionalidad.Insert();
            Response.Write("<script>alert('Se guardo correctamente')</script>");
            Limpiar(pCambio);
            gvNacionalidades.DataBind();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            SqlDataSouerceNacionalidad.UpdateParameters["nombre"].DefaultValue = txtNombre.Text;
            SqlDataSouerceNacionalidad.UpdateParameters["estado"].DefaultValue = txtEstado.Text;
            SqlDataSouerceNacionalidad.UpdateParameters["ID"].DefaultValue = txtCodigo.Text;
            int cant;
            cant = SqlDataSouerceNacionalidad.Update();
            if (cant == 1)
            {
                Response.Write("<script>alert('Se modifico el Nacionalidad')</script>");
                gvNacionalidades.DataBind();
            }
            else
                Response.Write("<script>alert('No existe el codigo')</script>");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            SqlDataSouerceNacionalidad.DeleteParameters["id"].DefaultValue = txtCodigo.Text;
            int cant;
            cant = SqlDataSouerceNacionalidad.Delete();
            if (cant == 1)
                Response.Write("<script>alert('Se elimino la Nacionalidad')</script>");
            else
                Response.Write("<script>alert('No existe la Nacionalidad')</script>");
        }
    }
}