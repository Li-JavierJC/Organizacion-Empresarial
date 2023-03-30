using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Organizacion_Empresarial
{
    public partial class Form2 : Form
    {
        string conexionstring = "Data source=LAPTOP-0RJ9S5F5;" + "Initial Catalog=proyecto; Integrated Security= true";
       
        public Form2(int i, int totalPr, string cadena)
        {
            InitializeComponent();           
            this.N_Proces.Text = i.ToString();
            textBox2.Text = cadena;
            if (i == totalPr)
            {
                b_Siguente.Text = "Finalizar";
            }          
        }
        //boton para el sijguiente form
        private void b_Siguente_Click(object sender, EventArgs e)
        {
            Insertar_hijo();
            this.Hide();
        }
        //------------------funcion para insertar empleado----------------------------------------
        private void Insertar_hijo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("insertar_hijo", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Codigo_he", Convert.ToInt32(textBox1.Text));
            comando.Parameters.AddWithValue("@nif_e", Convert.ToInt32(textBox2.Text));
            comando.Parameters.AddWithValue("@Nombre", Caja_1.Text);
            comando.Parameters.AddWithValue("@Fecha_nacimiento", System.Convert.ToDateTime(Caja_2.Text));      
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                MessageBox.Show("Datos insertado exitosamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: No se pudo inserta registro. " + ex);
            }
            finally
            {
                conexion.Dispose();
                comando.Dispose();
            }
        }
    }
}
