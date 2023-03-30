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
    public partial class Form1 : Form
    {
        //cadena de conexion
        string conexionstring = "Data source=LAPTOP-0RJ9S5F5;" + "Initial Catalog=proyecto; Integrated Security= true";

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)//panel de la pantalla principal
        {
            panel55.Visible = false;
            activa_panel(panel1, panel2, panel33, panel4, true, false, false, false);
        }
        //--------------------Funcion para activar paneles--------------------------------
        private void activa_panel(Panel p1, Panel p2, Panel p3, Panel p4, Boolean v1, Boolean v2, Boolean v3, Boolean v4)
        {
            p1.Visible = v1;
            p2.Visible = v2;
            p3.Visible = v3;
            p4.Visible = v4;
        }
        //-----boton para salir del sistema-----------------------------
        private void b_salir0_Click(object sender, EventArgs e)
        {
            Close();
        }

        //#################################----[Empleado]----#########################################
        private void B_empleado_Click(object sender, EventArgs e)
        {

            panel55.Visible = false;
            activa_panel(panel1, panel2, panel33, panel4, false, true, false, false);
            activa_panel(panel5, panel6, panel7, panel13, false, false, false, false);

        }
        //------------------funcion para insertar empleado----------------------------------------
        private void Insertar_empleado()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("insertar_empleado", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@nif_e", Convert.ToInt32(riTextBox1.Text));
            comando.Parameters.AddWithValue("@Telefono", System.Convert.ToInt32(riTextBox3.Text));
            comando.Parameters.AddWithValue("@Nombre", riTextBox2.Text);
            comando.Parameters.AddWithValue("@Num_hijos", System.Convert.ToInt32(numericUpDown1.Value));
            comando.Parameters.AddWithValue("@Salario", System.Convert.ToDouble(riTextBox4.Text));
            comando.Parameters.AddWithValue("@Fecha_alta", System.Convert.ToDateTime(richTextBox8.Text));

            comando.Parameters.AddWithValue("@cadena_habilidad", cboBox1.Text);
            comando.Parameters.AddWithValue("@cadena_departamento", cboBox2.Text);
            comando.Parameters.AddWithValue("@cadena_CT", comboBox3.Text);
            
            comando.Parameters.AddWithValue("@bandera", Convert.ToInt32(riTextBox1.Text));

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
        //--------------------Boton de agregar empleado------------------------------------------
        private void b_agregar_Click(object sender, EventArgs e)
        {
            activa_panel(panel5, panel6, panel7, panel13, true, false, false, false);


            Muestra_datos_combo("mostra_todos_habilidad", cboBox1, "descripcion");//combobox habilidad
            Muestra_datos_combo("mostra_todos_departamentos", cboBox2, "nombre");//combobox departamento
            Muestra_datos_combo("mostrar_todos_CT", comboBox3, "nombre");//combobox centro de trabajo


        }
        //--------------boton "Guardar" para insertar empleado-------------------------------
        private void b_guardar1_Click(object sender, EventArgs e)
        { 
            Insertar_empleado();
        }
        //--------------------Boton de actiualizar datos del emplaeado-----------------------
        private void bu_actualizar_Click(object sender, EventArgs e)
        {
            activa_panel(panel5, panel6, panel7, panel13, false, true, false, false);

            Muestra_datos_combo("mostra_todos_habilidad", comboBox7, "descripcion");//combobox habilidad
            Muestra_datos_combo("mostra_todos_departamentos", comboBox8, "nombre");//combobox departamento
            Muestra_datos_combo("mostrar_todos_CT", comboBox4, "nombre");//combobox centro de trabajo
        }
        //--------------------Boton de buscar datos del empleado-----------------------------
        private void bu_buscar_Click(object sender, EventArgs e)
        {
            panel20.Visible = false;
            panel15.Visible = false;
            activa_panel(panel5, panel6, panel7, panel13, false, false, true, false);
            panel12.Visible = false;
            activa_panel(panel8, panel9, panel10, panel11, false, false, false, false);
        }
        //--------------------ComboBox para buscar algun dato espesifico del empleado--------
        private void comboBox_buscar1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox_buscar1.Text == "NIF")
            {
                panel20.Visible = false;
                panel15.Visible = false;
                panel12.Visible = false;
                activa_panel(panel8, panel9, panel10, panel11, true, false, false, false);
            }
            if (comboBox_buscar1.Text == "Nombre")
            {
                panel20.Visible = false;
                panel15.Visible = false;
                panel12.Visible = false;
                activa_panel(panel8, panel9, panel10, panel11, false, true, false, false);
            }
            if (comboBox_buscar1.Text == "Salario")
            {
                panel20.Visible = false;
                panel15.Visible = false;
                panel12.Visible = false;
                activa_panel(panel8, panel9, panel10, panel11, false, false, true, false);
            }
            if (comboBox_buscar1.Text == "Telefono")
            {
                panel20.Visible = false;
                panel15.Visible = false;
                panel12.Visible = false;
                activa_panel(panel8, panel9, panel10, panel11, false, false, false, true);
            }
            if (comboBox_buscar1.Text == "Numero de Hijos")
            {
                panel20.Visible = false;
                panel15.Visible = false;
                panel12.Visible = true;
                activa_panel(panel8, panel9, panel10, panel11, false, false, false, false);
            }
            if (comboBox_buscar1.Text == "Fecha de Alta")
            {
                panel20.Visible = true;
                panel15.Visible = false;
                panel12.Visible = false;
                activa_panel(panel8, panel9, panel10, panel11, false, false, false, false);
            }



        }
        //--------------------Boton de eliminar algun empleado------------------------------------------
        private void bu_eliminar_Click(object sender, EventArgs e)
        {
            activa_panel(panel5, panel6, panel7, panel13, false, false, false, true);
        }
        //--------------------Boton para regresar a la pagina pricipal------------------
        private void b_regresar_Click(object sender, EventArgs e)
        {
            panel55.Visible = false;
            activa_panel(panel1, panel2, panel33, panel4, true, false, false, false);
        }


        //#################################----[Departamento]----#########################################
        //---------Bototon para mostrar el panel de Departamento--------------------------------------------
        private void b_Departamento_Click(object sender, EventArgs e)
        {
            activa_panel(panel1, panel2, panel33, panel4, false, false, true, false);
            panel55.Visible = false;
            panel18.Visible = false;
            activa_panel(p_Agregar_Departamento, p_Actualizar_Departamento, p_Buscar_Departamento, p_Eliminar_Departamento, false, false, false, false);

        }                                    
        //-----------------funcion de insertar departamento--------------------------------------
        private void Insertar_departamento()
         {
             SqlConnection conexion =new SqlConnection(conexionstring);
             SqlCommand comando = new SqlCommand("insertar_departamento1", conexion);
             comando.CommandType = CommandType.StoredProcedure;
             comando.Parameters.AddWithValue("@Codigo_d", System.Convert.ToInt32(riTextBox14.Text));
             comando.Parameters.AddWithValue("@Nombre",  riTextBox15.Text);
             comando.Parameters.AddWithValue("@Presupuesto_anual", System.Convert.ToDouble(riTextBox16.Text));

            comando.Parameters.AddWithValue("@cadena_CT", comboBox6.Text);

            try
            {
                 conexion.Open();
                 comando.ExecuteNonQuery();
                 MessageBox.Show("Datos insertado exitosamente");
             }
             catch(Exception ex){
             MessageBox.Show("Error: No se pudo inserta registro. "+ ex);
             }
             finally{
                 conexion.Dispose();
                 comando.Dispose();
             }

         }
        //--------------------Boton de agregar departamento------------------------------------------
        private void bu_agregar2_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Departamento, p_Actualizar_Departamento, p_Buscar_Departamento, p_Eliminar_Departamento, true, false, false, false);
            Muestra_datos_combo("mostrar_todos_CT", comboBox6, "nombre");//combobox centro de trabajo
        }
        //--------------Boton "Guardar"para agregar un nuevo departamento-------------------------------
        private void b_gurdar3_Click(object sender, EventArgs e)
        {
            Insertar_departamento();
        }

        //--------------------Boton de actualizar departamento------------------------------------------
        private void b_actualizar_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Departamento, p_Actualizar_Departamento, p_Buscar_Departamento, p_Eliminar_Departamento, false, true, false, false);
            Muestra_datos_combo("mostrar_todos_CT", comboBox9, "nombre");//combobox centro de trabajo
        }
        //--------------------Boton de buscar departamento------------------------------------------
        private void b_Buscar_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Departamento, p_Actualizar_Departamento, p_Buscar_Departamento, p_Eliminar_Departamento, false, false, true, false);
            activa_panel(p_buscarCodigo, p_buscarNombre, p_buscarPresupuesto, panel4, false, false, false, false);
            panel18.Visible = false;
        }
        //--------------------ComboBox de departamento------------------------------------------
        private void comboBox_Departamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox_Departamento.Text == "Codigo")
            {
                panel18.Visible = false;
                activa_panel(p_buscarCodigo, p_buscarNombre, p_buscarPresupuesto, panel4, true, false, false, false);
            }
            if (comboBox_Departamento.Text == "Nombre")
            {
                panel18.Visible = false;
                activa_panel(p_buscarCodigo, p_buscarNombre, p_buscarPresupuesto, panel4, false, true, false, false);
            }
            if (comboBox_Departamento.Text == "Presupuesto")
            {
                panel18.Visible = false;
                activa_panel(p_buscarCodigo, p_buscarNombre, p_buscarPresupuesto, panel4, false, false, true, false);
            }
        }
        //--------------------Boton de eliminar departamento------------------------------------------
        private void b_Eliminar_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Departamento, p_Actualizar_Departamento, p_Buscar_Departamento, p_Eliminar_Departamento, false, false, false, true);
        }
        //--------------------Boton de regresar al inicio------------------------------------------
        private void b_regresar2_Click(object sender, EventArgs e)
        {
            panel55.Visible = false;
            activa_panel(panel1, panel2, panel33, panel4, true, false, false, false);
        }

        //#################################----[Centro de Trabajo]----#########################################
        //--------------------Boton para mostrar el panel de Centro de trabajo------------------------------------
        private void b_centro_trabajo_Click(object sender, EventArgs e)
        {
            activa_panel(panel1, panel2, panel33, panel4, false, false, false, true);
            panel55.Visible = false;
            activa_panel(p_CTrabajo, p_Actualizar_CTrabajo, p_Buscar_CTrabajo, p_Eliminar_CTrabajo, false, false, false, false);
        }
        private void Insertar_CentroTrabajo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand(" insertar_centro_trabajo", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_CT", System.Convert.ToInt32(riTextBox24.Text));
            comando.Parameters.AddWithValue("@Nombre", riTextBox25.Text);
            comando.Parameters.AddWithValue("@Poblacion", riTextBox26.Text);
            comando.Parameters.AddWithValue("@Direccion", riTextBox27.Text);
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
        //--------------------Boton de agregar centro de trabajo-----------------------------------------
        private void b_agregarCT_Click(object sender, EventArgs e)
        {
            activa_panel(p_CTrabajo, p_Actualizar_CTrabajo, p_Buscar_CTrabajo, p_Eliminar_CTrabajo, true, false, false, false);
        }
        //--------------agregar centro de trabajo---------------------------------------
        private void b_guardar5_Click(object sender, EventArgs e)
        {
            Insertar_CentroTrabajo();
        }
        //--------------------Boton de actualizar centro de trabajo-----------------------------------------
        private void b_actializarCT_Click(object sender, EventArgs e)
        {
            activa_panel(p_CTrabajo, p_Actualizar_CTrabajo, p_Buscar_CTrabajo, p_Eliminar_CTrabajo, false, true, false, false);
        }
        //--------------------Boton de buscar centro de trabajo-----------------------------------------
        private void b_buscarCT_Click(object sender, EventArgs e)
        {
            activa_panel(p_CTrabajo, p_Actualizar_CTrabajo, p_Buscar_CTrabajo, p_Eliminar_CTrabajo, false, false, true, false);
            
            activa_panel(panel16, p_nombre2, p_buscarPoblacion, p_buscarDireccion, false, false, false, false);
        }
        //--------------------ComboBox de centro de trabajo-----------------------------------------
        private void comboBox_CTrabajo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox_CTrabajo.Text == "Codigo")
            {
                activa_panel(panel16, p_nombre2, p_buscarPoblacion, p_buscarDireccion, true, false, false, false);
            }
            if (comboBox_CTrabajo.Text == "Nombre")
            {
                activa_panel(panel16, p_nombre2, p_buscarPoblacion, p_buscarDireccion, false, true, false, false);
            }
            if (comboBox_CTrabajo.Text == "Poblacion")
            {
                activa_panel(panel16, p_nombre2, p_buscarPoblacion, p_buscarDireccion, false, false, true, false);
            }
            if (comboBox_CTrabajo.Text == "Direccion")
            {
                activa_panel(panel16, p_nombre2, p_buscarPoblacion, p_buscarDireccion, false, false, false, true);
            }
        }
        //--------------------Boton de eliminar centro de trabajo-----------------------------------------
        private void b_eliminarCT_Click(object sender, EventArgs e)
        {
            activa_panel(p_CTrabajo, p_Actualizar_CTrabajo, p_Buscar_CTrabajo, p_Eliminar_CTrabajo, false, false, false,true);
        }
        //--------------------Boton de regresa al inicio-----------------------------------------
        private void b_regresar3_Click(object sender, EventArgs e)
        {
            panel55.Visible = false;
            activa_panel(panel1, panel2, panel33, panel4, true, false, false, false);
        }


        //#################################----[Habildad]----#########################################
        //---------------------Boton para mostrar el panel de Centro de trabajo----------------------------------
        private void b_habilidades2_Click(object sender, EventArgs e)
        {
            activa_panel(panel1, panel2, panel33, panel4, false, false, false, false);
            panel55.Visible = true;
            activa_panel(p_Agregar_Habilidades, p_Actualizar_habilidad, p_Buscar_habilidad, p_Eliminar_habilidad, false, false, false, false);
        }

        //funcion para insertar datos de Hbilidades
        private void Insertar_Habilidad()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("insertar_habilidad", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_h", System.Convert.ToInt32(riTextBox37.Text));
            comando.Parameters.AddWithValue("@Descripcion", riTextBox38.Text);
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
        //--------------------Boton de agregar habilidad-------------------------------------------------------
        private void b_agregarH_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Habilidades, p_Actualizar_habilidad, p_Buscar_habilidad, p_Eliminar_habilidad, true, false, false, false);
        }
        //--------------------agregar habilidad-------------------------------------------------------
        private void b_guardar7_Click(object sender, EventArgs e)
        {
            Insertar_Habilidad();
        }


        //--------------------Boton de actualizar habilidad---------------------------------------------------
        private void b_actualizarH_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Habilidades, p_Actualizar_habilidad, p_Buscar_habilidad, p_Eliminar_habilidad, false, true, false, false);
        }
        //--------------------Boton de buscar habilidad---------------------------------------------------
        private void b_buscarH_Click(object sender, EventArgs e)
        {
            panel19.Visible = true;
            panel21.Visible = false;
            panel22.Visible = false;
            activa_panel(p_Agregar_Habilidades, p_Actualizar_habilidad, p_Buscar_habilidad, p_Eliminar_habilidad, false, false, true, false);
        }
        private void comboBox1_habilidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1_habilidad.Text == "Codigo")
            {
                panel19.Visible = true;
                panel21.Visible = true;
                panel22.Visible = false;
            }
            if (comboBox1_habilidad.Text == "Descripcion")
            {
                panel19.Visible = true;
                panel22.Visible = true;
                panel21.Visible = false;
            }
        }

        //--------------------Boton de eliminar habilidad---------------------------------------------------
        private void b_eliminarH_Click(object sender, EventArgs e)
        {
            activa_panel(p_Agregar_Habilidades, p_Actualizar_habilidad, p_Buscar_habilidad, p_Eliminar_habilidad, false, false, false, true);
        }
        //--------------------Boton de regresar al inicio---------------------------------------------------
        private void b_regresar4_Click(object sender, EventArgs e)
        {
            panel55.Visible = false;
            activa_panel(panel1, panel2, panel33, panel4, true, false, false, false);
        }



        //###############Botones de Cancelar##########################################################################

        private void b_cancelar1_Click(object sender, EventArgs e)
        {
            riTextBox1.Text = " ";
            riTextBox2.Text = " ";
            riTextBox3.Text = " ";
            riTextBox4.Text = " ";
        }

        private void b_cancelar2_Click(object sender, EventArgs e)
        {
            riTextBox5.Text = " ";
            riTextBox6.Text = " ";
            riTextBox7.Text = " ";
            riTextBox8.Text = " ";
            richTextBox9.Text = " ";
            numericUpDown4.Text = "0";
            Muestra_datos_combo("mostra_todos_habilidad", cboBox1, "descripcion");//combobox habilidad
            Muestra_datos_combo("mostra_todos_departamentos", cboBox2, "nombre");//combobox departamento
            Muestra_datos_combo("mostrar_todos_CT", comboBox3, "nombre");//combobox centro de trabajo
        }

        private void b_cancelar3_Click(object sender, EventArgs e)
        {
            riTextBox9.Text = " ";
        }

        private void b_cancelar4_Click(object sender, EventArgs e)
        {
            riTextBox10.Text = " ";
        }

        private void b_cancelar5_Click(object sender, EventArgs e)
        {
            riTextBox11.Text = " ";
        }

        private void b_cancelar6_Click(object sender, EventArgs e)
        {
            riTextBox12.Text = " ";
        }

        private void b_cancelar7_Click(object sender, EventArgs e)
        {
            riTextBox13.Text = " ";
        }

        private void b_camcelar8_Click(object sender, EventArgs e)
        {
            riTextBox14.Text = " ";
            riTextBox15.Text = " ";
            riTextBox16.Text = " ";
        }

        private void b_cancelar9_Click(object sender, EventArgs e)
        {
            riTextBox17.Text = " ";
            riTextBox18.Text = " ";
            riTextBox19.Text = " ";
        }

        private void b_cancelar10_Click(object sender, EventArgs e)
        {
            riTextBox20.Text = " ";
        }

        private void b_cancelar11_Click(object sender, EventArgs e)
        {
            riTextBox21.Text = " ";
        }

        private void b_cancelar12_Click(object sender, EventArgs e)
        {
            riTextBox22.Text = " ";
        }

        private void b_cancelar13_Click(object sender, EventArgs e)
        {
            riTextBox23.Text = " ";
        }

        private void b_cancelar14_Click(object sender, EventArgs e)
        {
            riTextBox24.Text = " ";
            riTextBox25.Text = " ";
            riTextBox26.Text = " ";
            riTextBox27.Text = " ";
        }

        private void b_cancelar15_Click(object sender, EventArgs e)
        {
            riTextBox28.Text = " ";
            riTextBox29.Text = " ";
            riTextBox30.Text = " ";
            riTextBox31.Text = " ";
        }

        private void b_cancelar16_Click(object sender, EventArgs e)
        {
            riTextBox32.Text = " ";
        }

        private void b_cancelar17_Click(object sender, EventArgs e)
        {
            riTextBox33.Text = " ";
        }

        private void b_cancelar18_Click(object sender, EventArgs e)
        {
            riTextBox34.Text = " ";
        }

        private void b_cancelar19_Click(object sender, EventArgs e)
        {
            riTextBox35.Text = " ";
        }

        private void b_cancelar20_Click(object sender, EventArgs e)
        {
            riTextBox36.Text = " ";
        }

        private void b_cancelar21_Click(object sender, EventArgs e)
        {
            riTextBox37.Text = " ";
            riTextBox38.Text = " ";
        }

        private void b_cancelar22_Click(object sender, EventArgs e)
        {
            riTextBox39.Text = " ";
            riTextBox40.Text = " ";
        }

        private void b_cancelar23_Click(object sender, EventArgs e)
        {
            riTextBox41.Text = " ";
        }

        private void b_cancelar24_Click(object sender, EventArgs e)
        {
            riTextBox42.Text = " ";
        }

        private void b_cancelar25_Click(object sender, EventArgs e)
        {
            riTextBox43.Text = " ";
        }
        private void b_cancelar_Fecha_Click(object sender, EventArgs e)
        {
            richTextBox10.Text = " ";
        }

        //###############Botones de inserccion de empleado  #######################################################################



        //-----------------busqueda rapida de empleado------------------------------

        private void b_ir_Click(object sender, EventArgs e)
        {
            Muestra_empleado();
        }

        //----------------boton actualizar empleado-----------------------------------
        private void b_guardar2_Click(object sender, EventArgs e)
        {
            Modifica_Empeado();
        }



        //-------------busqueda rapida de departamento----------------------
        private void b_ir2_Click(object sender, EventArgs e)
        {
            Muestra_departamento();

        }
        //--------------------actualizacion de departamento---------------------------
        private void b_guradar4_Click(object sender, EventArgs e)
        {
            Modifica_Departamento();
        }
   

        //busqueda rapida de centro de trabajo
        private void b_ir3_Click(object sender, EventArgs e)
        {
            Muestra_centro_Trabajo();
        }

        //----------------actualizar centro de trabajo---------------------- 
        private void guardar6_Click(object sender, EventArgs e)
        {
            Modifica_CentroTrabajo();
        }
        //----------------busqueda rapida de habilidad---------------------
        private void b_ir4_Click(object sender, EventArgs e)
        {
            Muestra_habilidad();
        }
        //---------------actualizar habilidad-------------------------------
        private void b_gurdar8_Click(object sender, EventArgs e)
        {
            Modifica_Habilidad();
        }

        //°°°°°°°°°°°°°°°°°°°°°°°°°°°°°Busquedas°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

        //-----------------busqueda por NIf----------------------------
        private void b_buscar1_Click(object sender, EventArgs e)
        {
            panel8.Visible = false;
            panel15.Visible = true;
            Buscar_empleado_NIF();
        }
        //----------------busqueda por nombre-----------------------------------
        private void b_bucar2_Click(object sender, EventArgs e)
        {
            panel9.Visible = false;
            panel15.Visible = true;
            Buscar_empleado_Nombre();
        }
        //----------------busqueda por salario------------------------------------
        private void b_buscar3_Click(object sender, EventArgs e)
        {
            panel10.Visible = false;
            panel15.Visible = true;
            Buscar_empleado_Salario();
        }
       //----------------------busqueda por telefono-------------------------------------
        private void b_buscar4_Click(object sender, EventArgs e)
        {
            panel11.Visible = false;
            panel15.Visible = true;
            Buscar_empleado_Telefono();
        }
        //--------------------busqueda por numero de hijos
        private void b_buscar5_Click(object sender, EventArgs e)
        {
            panel12.Visible = false;
            panel15.Visible = true;
            Buscar_empleado_NumHijos();
        }
        //-------------------busqueda por fecha de Alta
        private void b_buscarFecha6_Click(object sender, EventArgs e)
        {
            panel20.Visible = false;
            panel15.Visible = true;
            Buscar_empleado_FechaAlta();
        }
        //°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°Busquedas de departamento°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
        //---------------busqueda por codigo---------------------------
        private void b_buscar6_Click(object sender, EventArgs e)
        {
            p_buscarCodigo.Visible = false;
            panel18.Visible = true;
            buscar_departamento_Codigo();
        }
        //------------buscar por nombre-----------------------------------
        private void b_buscar7_Click(object sender, EventArgs e)
        {
            p_buscarNombre.Visible = false;
            panel18.Visible = true;
            buscar_departamento_Nombre();
        }

        private void b_buscar8_Click(object sender, EventArgs e)
        {
            p_buscarPresupuesto.Visible = false;
            panel18.Visible = true;
            buscar_departamento_Presupuesto();
        }
        //.............................Funciones de actualizaciones............................................
        //funcion para actualizar datos de empleado
        private void Modifica_Empeado()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("actualizar_empleado", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            
            comando.Parameters.AddWithValue("@nif_e", Convert.ToInt32(riTextBox5.Text));
            comando.Parameters.AddWithValue("@Telefono", System.Convert.ToInt32(riTextBox7.Text));
            comando.Parameters.AddWithValue("@Nombre", riTextBox6.Text);
            comando.Parameters.AddWithValue("@Num_hijos", System.Convert.ToInt32(numericUpDown4.Value));
            comando.Parameters.AddWithValue("@Salario", System.Convert.ToDouble(riTextBox8.Text));
            comando.Parameters.AddWithValue("@Fecha_alta", System.Convert.ToDateTime(richTextBox9.Text));

            comando.Parameters.AddWithValue("@cadena_habilidad", comboBox7.Text);
            comando.Parameters.AddWithValue("@cadena_departamento", comboBox8.Text);
            comando.Parameters.AddWithValue("@cadena_CT", comboBox4.Text);

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
        //funcion para actualizar datos de Deparatamneto
        private void Modifica_Departamento()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("actualizar_departamento1", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Codigo_d", Convert.ToInt32(riTextBox17.Text));

            comando.Parameters.AddWithValue("@Nombre", riTextBox18.Text);
            comando.Parameters.AddWithValue("@Presupuesto_anual", System.Convert.ToDouble(riTextBox19.Text));

            comando.Parameters.AddWithValue("@cadena_CT", comboBox9.Text);
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
        //funcion para actualizar datos centro de trabajo
        private void Modifica_CentroTrabajo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("actualizar_centroTrabajo", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Codigo_CT", Convert.ToInt32(riTextBox28.Text));

            comando.Parameters.AddWithValue("@Nombre", riTextBox29.Text);
            comando.Parameters.AddWithValue("@Poblacion", riTextBox30.Text);
            comando.Parameters.AddWithValue("@Direccion", riTextBox31.Text);

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
        //funcion para actualizar datos de Habilidades
        private void Modifica_Habilidad()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("actualizar_habilidad", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Codigo_H", Convert.ToInt32(riTextBox39.Text));

            comando.Parameters.AddWithValue("@Descripcion", riTextBox40.Text);
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
        //........................Funciones de eliminacion............................................
        //funcion para eliminar datos de departamento
        private void Elimina_empleado()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("eliminar_empleado", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nif_e", System.Convert.ToInt32(riTextBox13.Text));

            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                MessageBox.Show("Datos Eliminado correctamente");
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
        //funcion para eliminar departamento
        private void Elimina_departamento()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("eliminar_departamento", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_d", System.Convert.ToInt32(riTextBox23.Text));

            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                MessageBox.Show("Datos Eliminado correctamente");
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
        //funcion para eliminar centro de trabajo
        private void Elimina_Centro_Trabajo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("eliminar_centroTrabajo", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_CT", System.Convert.ToInt32(riTextBox36.Text));

            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                MessageBox.Show("Datos Eliminado correctamente");
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
        //funcion para eliminar habilidad
        private void Elimina_hablidad()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("eliminar_Habilidad", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_h", System.Convert.ToInt32(riTextBox42.Text));

            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                MessageBox.Show("Datos Eliminado correctamente");
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
        //.......................Funciones para mostrar datos de salidad.....................................
        //funcion para mostarar datos de salida de departamento
        private void Muestra_departamento()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("mostrar_departamento1", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_d", System.Convert.ToInt32(riTextBox17.Text));

            comando.Parameters.Add("@Nombre", SqlDbType.VarChar,50);
            comando.Parameters.Add("@Presupuesto_anual", SqlDbType.Float);

            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Presupuesto_anual"].Direction = ParameterDirection.Output;

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
                riTextBox18.Text = comando.Parameters["@Nombre"].Value.ToString();
                riTextBox19.Text = comando.Parameters["@Presupuesto_anual"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }
        }
        //funcion para mostarar datos de salida de empleado
        private void Muestra_empleado()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("mostrar_empleado", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nif_e", System.Convert.ToInt32(riTextBox5.Text));

            comando.Parameters.Add("@Nombre", SqlDbType.VarChar,50);
            comando.Parameters.Add("@Telefono", SqlDbType.Int);
            comando.Parameters.Add("@Num_hijos", SqlDbType.Int);
            comando.Parameters.Add("@Salario", SqlDbType.Float);
            comando.Parameters.Add("@Fecha_alta", SqlDbType.DateTime);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);


            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Telefono"].Direction = ParameterDirection.Output;
            comando.Parameters["@Num_hijos"].Direction = ParameterDirection.Output;
            comando.Parameters["@Salario"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_alta"].Direction=ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;

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
                riTextBox6.Text = comando.Parameters["@Nombre"].Value.ToString();
                riTextBox7.Text = comando.Parameters["@Telefono"].Value.ToString();
                riTextBox8.Text = comando.Parameters["@Salario"].Value.ToString();
                richTextBox9.Text = comando.Parameters["@Fecha_alta"].Value.ToString();
                numericUpDown4.Text = comando.Parameters["@Num_hijos"].Value.ToString();
                comboBox7.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox8.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox4.Text = comando.Parameters["@cadena_CT"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }
        }

        //funcion para mostarar datos de salida de centro de trabajo
        private void Muestra_centro_Trabajo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("mostrar_CentroTrabajo", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_CT", System.Convert.ToInt32(riTextBox28.Text));

            comando.Parameters.Add("@Nombre", SqlDbType.VarChar,50);
            comando.Parameters.Add("@Poblacion", SqlDbType.VarChar,50);
            comando.Parameters.Add("@Direccion", SqlDbType.VarChar,50);
            
            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Poblacion"].Direction = ParameterDirection.Output;
            comando.Parameters["@Direccion"].Direction = ParameterDirection.Output;

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
                riTextBox29.Text = comando.Parameters["@Nombre"].Value.ToString();
                riTextBox30.Text = comando.Parameters["@Poblacion"].Value.ToString();
                riTextBox31.Text = comando.Parameters["@Direccion"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }
        }
        //funcion para mostarar datos de salida de habilidades
        private void Muestra_habilidad()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("mostrar_habilidad", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_h", System.Convert.ToInt32(riTextBox39.Text));

            comando.Parameters.Add("@Descripcion", SqlDbType.VarChar, 50);
           
            comando.Parameters["@Descripcion"].Direction = ParameterDirection.Output;
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
                riTextBox40.Text = comando.Parameters["@Descripcion"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }
        }
        //funcion para hacer una cosulta de conbobox
        private DataTable Muestra_datos_combo(string PA, ComboBox cb, string dato)
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand(PA, conexion);
            comando.CommandType = CommandType.StoredProcedure;
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(comando);
                DataTable tb = new DataTable();
                da.Fill(tb);
                cb.DataSource = tb;
                cb.DisplayMember = dato;
                cb.ValueMember = dato;
                return tb;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Dispose();
                comando.Dispose();
            }
        }

        //...............Funciones para botenes de eliminar...........................
        private void Eliminar_E_Click(object sender, EventArgs e)
        {
            Elimina_empleado();
        }

        private void b_eliminar_De_Click(object sender, EventArgs e)
        {
            Elimina_departamento();
        }

        private void b_Elimina_CT_Click(object sender, EventArgs e)
        {
            Elimina_Centro_Trabajo();
        }

        private void b_Eliminar_H_Click(object sender, EventArgs e)
        {
            Elimina_hablidad();
        }
        //boton de registro de numero de hijos 
        private void b_Registar_Click(object sender, EventArgs e)
        {
            string cadena = riTextBox1.Text;
            int totalPr = Convert.ToInt32(numericUpDown1.Value);
            for (int i = 1; i <= totalPr; i++)
            {
                Form2 frm = new Form2(i, totalPr,cadena); 
                frm.ShowDialog(this);
            }
        }
        //boton de actualizar hijo
        private void b_actualizar_Hijo_Click(object sender, EventArgs e)
        {
            string cadena = riTextBox5.Text;
            int totalPr = Convert.ToInt32(numericUpDown4.Value);
            for (int i = 1; i <= totalPr; i++)
            {
                Form3 frm = new Form3(i, totalPr, cadena);
                frm.ShowDialog(this);
            }
        }

        //--------------------------Funciones de Busqueda----------------------------------------------------
        //--------------------------Busqueda por NIF
        private void Buscar_empleado_NIF()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("Buscar_empleado_NIF", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@nif_e", System.Convert.ToInt32(riTextBox9.Text));
            
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@Telefono", SqlDbType.Int);
            comando.Parameters.Add("@Num_hijos", SqlDbType.Int);
            comando.Parameters.Add("@Salario", SqlDbType.Float);
            comando.Parameters.Add("@Fecha_alta", SqlDbType.DateTime);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);

            
            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Telefono"].Direction = ParameterDirection.Output;
            comando.Parameters["@Num_hijos"].Direction = ParameterDirection.Output;
            comando.Parameters["@Salario"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_alta"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;
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
                richTextBox4.Text = riTextBox9.Text;
                richTextBox3.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox11.Text = comando.Parameters["@Telefono"].Value.ToString();
                richTextBox2.Text = comando.Parameters["@Salario"].Value.ToString();
                richTextBox1.Text = comando.Parameters["@Fecha_alta"].Value.ToString();
                numericUpDown2.Text = comando.Parameters["@Num_hijos"].Value.ToString();
                comboBox2.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox5.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox1.Text = comando.Parameters["@cadena_CT"].Value.ToString();

                conexion.Dispose();
                comando.Dispose();
            }
        }
        //--------------------------Busqueda por Nombre------------------------------------------------------------------------
        private void Buscar_empleado_Nombre()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("Buscar_empleado_Nombre", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Nombre",riTextBox10.Text);

            comando.Parameters.Add("@nif_e", SqlDbType.Int);
            comando.Parameters.Add("@Telefono", SqlDbType.Int);
            comando.Parameters.Add("@Num_hijos", SqlDbType.Int);
            comando.Parameters.Add("@Salario", SqlDbType.Float);
            comando.Parameters.Add("@Fecha_alta", SqlDbType.DateTime);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);

            comando.Parameters["@nif_e"].Direction = ParameterDirection.Output;
            comando.Parameters["@Telefono"].Direction = ParameterDirection.Output;
            comando.Parameters["@Num_hijos"].Direction = ParameterDirection.Output;
            comando.Parameters["@Salario"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_alta"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;
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
                
                richTextBox4.Text = comando.Parameters["@nif_e"].Value.ToString();
                richTextBox3.Text = riTextBox10.Text;
                richTextBox11.Text = comando.Parameters["@Telefono"].Value.ToString();
                richTextBox2.Text = comando.Parameters["@Salario"].Value.ToString();
                richTextBox1.Text = comando.Parameters["@Fecha_alta"].Value.ToString();
                numericUpDown2.Text = comando.Parameters["@Num_hijos"].Value.ToString();
                comboBox2.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox5.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox1.Text = comando.Parameters["@cadena_CT"].Value.ToString();

                conexion.Dispose();
                comando.Dispose();
            }
        }
        //--------------------------Busqueda por salario------------------------------------------------------------------------
        private void Buscar_empleado_Salario()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("Buscar_empleado_Salario", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Salario", System.Convert.ToDouble(riTextBox11.Text));

       
            comando.Parameters.Add("@nif_e", SqlDbType.Int);
            comando.Parameters.Add("@Telefono", SqlDbType.Int);
            comando.Parameters.Add("@Num_hijos", SqlDbType.Int);
            comando.Parameters.Add("@Fecha_alta", SqlDbType.DateTime);
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);

            comando.Parameters["@nif_e"].Direction = ParameterDirection.Output;
            comando.Parameters["@Telefono"].Direction = ParameterDirection.Output;
            comando.Parameters["@Num_hijos"].Direction = ParameterDirection.Output;
            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_alta"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;
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

                richTextBox4.Text = comando.Parameters["@nif_e"].Value.ToString();
                richTextBox3.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox11.Text = comando.Parameters["@Telefono"].Value.ToString();
                richTextBox2.Text = riTextBox11.Text;
                richTextBox1.Text = comando.Parameters["@Fecha_alta"].Value.ToString();
                numericUpDown2.Text = comando.Parameters["@Num_hijos"].Value.ToString();
                comboBox2.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox5.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox1.Text = comando.Parameters["@cadena_CT"].Value.ToString();

                conexion.Dispose();
                comando.Dispose();
            }
        }
        //--------------------------Busqueda por Telefono------------------------------------------------------------------------
        private void Buscar_empleado_Telefono()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("Buscar_empleado_Telefono", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Telefono", System.Convert.ToInt32(riTextBox12.Text));

          


            comando.Parameters.Add("@nif_e", SqlDbType.Int);
            comando.Parameters.Add("@Salario", SqlDbType.Float);
            comando.Parameters.Add("@Num_hijos", SqlDbType.Int);
            comando.Parameters.Add("@Fecha_alta", SqlDbType.DateTime);
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);

            comando.Parameters["@nif_e"].Direction = ParameterDirection.Output;
            comando.Parameters["@Salario"].Direction = ParameterDirection.Output;
            comando.Parameters["@Num_hijos"].Direction = ParameterDirection.Output;
            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_alta"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;
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

                richTextBox4.Text = comando.Parameters["@nif_e"].Value.ToString();
                richTextBox3.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox11.Text = riTextBox12.Text;
                richTextBox2.Text = comando.Parameters["@Salario"].Value.ToString();
                richTextBox1.Text = comando.Parameters["@Fecha_alta"].Value.ToString();
                numericUpDown2.Text = comando.Parameters["@Num_hijos"].Value.ToString();
                comboBox2.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox5.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox1.Text = comando.Parameters["@cadena_CT"].Value.ToString();

                conexion.Dispose();
                comando.Dispose();
            }
        }
        //--------------------------Busqueda por Numero de Hijos------------------------------------------------------------------------
        private void Buscar_empleado_NumHijos()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("Buscar_empleado_NumHijos", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Num_hijos", System.Convert.ToInt32(riTextBox43.Text));




            comando.Parameters.Add("@nif_e", SqlDbType.Int);
            comando.Parameters.Add("@Salario", SqlDbType.Float);
            comando.Parameters.Add("@Telefono", SqlDbType.Int);
            comando.Parameters.Add("@Fecha_alta", SqlDbType.DateTime);
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);

            comando.Parameters["@nif_e"].Direction = ParameterDirection.Output;
            comando.Parameters["@Salario"].Direction = ParameterDirection.Output;
           comando.Parameters["@Telefono"].Direction = ParameterDirection.Output;
            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Fecha_alta"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;
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

                richTextBox4.Text = comando.Parameters["@nif_e"].Value.ToString();
                richTextBox3.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox11.Text = comando.Parameters["@Telefono"].Value.ToString();
                richTextBox2.Text = comando.Parameters["@Salario"].Value.ToString();
                richTextBox1.Text = comando.Parameters["@Fecha_alta"].Value.ToString();
                numericUpDown2.Text = riTextBox43.Text;
                comboBox2.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox5.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox1.Text = comando.Parameters["@cadena_CT"].Value.ToString();

                conexion.Dispose();
                comando.Dispose();
            }
        }
        //--------------------------Busqueda por Fecha de Alta------------------------------------------------------------------------
        private void Buscar_empleado_FechaAlta()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("Buscar_empleado_FechaAlta", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Fecha_alta", System.Convert.ToDateTime(richTextBox10.Text));

            comando.Parameters.Add("@nif_e", SqlDbType.Int);
            comando.Parameters.Add("@Salario", SqlDbType.Float);
            comando.Parameters.Add("@Telefono", SqlDbType.Int);
            comando.Parameters.Add("@Num_hijos", SqlDbType.Int);
            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_habilidad", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_departamento", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@cadena_CT", SqlDbType.VarChar, 50);

            comando.Parameters["@nif_e"].Direction = ParameterDirection.Output;
            comando.Parameters["@Salario"].Direction = ParameterDirection.Output;
            comando.Parameters["@Telefono"].Direction = ParameterDirection.Output;
            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Num_hijos"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_habilidad"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_departamento"].Direction = ParameterDirection.Output;
            comando.Parameters["@cadena_CT"].Direction = ParameterDirection.Output;
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

                richTextBox4.Text = comando.Parameters["@nif_e"].Value.ToString();
                richTextBox3.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox11.Text = comando.Parameters["@Telefono"].Value.ToString();
                richTextBox2.Text = comando.Parameters["@Salario"].Value.ToString();
                richTextBox1.Text =richTextBox10.Text;
                numericUpDown2.Text = comando.Parameters["@Num_hijos"].Value.ToString();
                comboBox2.Text = comando.Parameters["@cadena_habilidad"].Value.ToString();
                comboBox5.Text = comando.Parameters["@cadena_departamento"].Value.ToString();
                comboBox1.Text = comando.Parameters["@cadena_CT"].Value.ToString();

                conexion.Dispose();
                comando.Dispose();
            }
        }
        //------------------------Funciones de Busqueda de Departamento---------------------------------
        //-----------Busqueda por codigo
        private void buscar_departamento_Codigo()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("buscar_departamento_Codigo ", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Codigo_d", System.Convert.ToInt32(riTextBox20.Text));

            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@Presupuesto_anual", SqlDbType.Float);

            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Presupuesto_anual"].Direction = ParameterDirection.Output;

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
                richTextBox6.Text = riTextBox20.Text;
                richTextBox5.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox7.Text = comando.Parameters["@Presupuesto_anual"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }
        }
        //-----------------------------Busqueda por Nombre-----------------------------------------------------------------
        private void buscar_departamento_Nombre()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("buscar_departamento_Nombre", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Nombre", riTextBox21.Text);

            
            comando.Parameters.Add("@Codigo_d", SqlDbType.Int);
            comando.Parameters.Add("@Presupuesto_anual", SqlDbType.Float);

            
            comando.Parameters["@Codigo_d"].Direction = ParameterDirection.Output;
            comando.Parameters["@Presupuesto_anual"].Direction = ParameterDirection.Output;

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
                richTextBox6.Text = comando.Parameters["@Codigo_d"].Value.ToString();
                richTextBox5.Text = riTextBox21.Text;
                richTextBox7.Text = comando.Parameters["@Presupuesto_anual"].Value.ToString();
                conexion.Dispose();
                comando.Dispose();
            }
        }
        //-----------------------------Busqueda por Presupuesto-----------------------------------------------------------------
        private void buscar_departamento_Presupuesto()
        {
            SqlConnection conexion = new SqlConnection(conexionstring);
            SqlCommand comando = new SqlCommand("buscar_departamento_Presupuesto ", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Presupuesto_anual", System.Convert.ToDouble(riTextBox22.Text));
            

            comando.Parameters.Add("@Nombre", SqlDbType.VarChar, 50);
            comando.Parameters.Add("@Codigo_d", SqlDbType.Int);
            

            comando.Parameters["@Nombre"].Direction = ParameterDirection.Output;
            comando.Parameters["@Codigo_d"].Direction = ParameterDirection.Output;
            

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
                richTextBox6.Text = comando.Parameters["@Codigo_d"].Value.ToString();
                richTextBox5.Text = comando.Parameters["@Nombre"].Value.ToString();
                richTextBox7.Text = riTextBox22.Text;
                conexion.Dispose();
                comando.Dispose();
            }
        }

      
    }
}
