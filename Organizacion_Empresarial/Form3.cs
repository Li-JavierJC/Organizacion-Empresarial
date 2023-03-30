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
    public partial class Form3 : Form
    {
        string conexionstring = "Data source=LAPTOP-0RJ9S5F5;" + "Initial Catalog=proyecto; Integrated Security= true";
        //form 3
        public Form3(int i, int totalPr, string cadena)
        {
            InitializeComponent();
            this.N_Proces.Text = i.ToString();
            textBox2.Text = cadena;
            if (i == totalPr)
            {
                b_Siguente.Text = "Finalizar";
            }

        }
        // boton para buscar el registro del hijo
        private void b_ir_hijo_Click(object sender, EventArgs e)
        {
            mostrar_hijo();
        }
        //boton para el siguiente form
        private void b_Siguente_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
        //------------------funcion para mostrar hijo----------------------------------------
        private void mostrar_hijo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("mostrar_hijo", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nif_e", Convert.ToInt32(textBox2.Text));
            comando.Parameters.AddWithValue("@Codigo_he", Convert.ToInt32(textBox1.Text));

            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@Fecha_nacimiento", SqlDbType.DateTime);

            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_nacimiento"].Direction = ParameterDirection.Output;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: No se pudo inserta registro. " + ex);
            }
            finally
            {
                Caja_1.Text = comando.Parameters["@Nombre"].Value.ToString();
                Caja_2.Text = comando.Parameters["@Fecha_nacimiento"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }

        }
        //funcion para actualizar datos de Deparatamneto
        private void Modifica_Hijo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("actualizar_hijo", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Codigo_he", Convert.ToInt32(textBox1.Text));

            comando.Parameters.AddWithValue("@Nombre", Caja_1.Text);
            comando.Parameters.AddWithValue("@Fecha_nacimiento", System.Convert.ToDateTime(Caja_2.Text));
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                MessageBox.Show("Datos actualizado exitosamente");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error : no se puede actualiza el registro" + ex);
            }
            finally
            {
                conexion.Dispose();
                comando.Dispose();
            }
        }

        private void b_actualizaar_Click(object sender, EventArgs e)
        {
            Modifica_Hijo();
        }
    }
}
