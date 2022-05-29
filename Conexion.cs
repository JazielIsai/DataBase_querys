using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


public class Conexion
{
    //string StrCnx = "Integrated Security=false; Data Source=PCDUBI\\SQL2005; user=sa; password=1234; Initial Catalog=POO;";       // AUNTENTICACION USUARIO Y PASSWORD //  
    string StrCnx = "Data Source = JASONPC; Initial Catalog = Proyecto; Integrated Security = True";                                // AUNTENTICACION DE WINDOWS SQL //

    
    public bool Ejecutar(string Query) 
    {
        SqlConnection ObjCnx = new SqlConnection(StrCnx);

        try 
        {
            ObjCnx.Open();

            SqlCommand ObjSqlCmd = new SqlCommand(Query, ObjCnx);
            ObjSqlCmd.ExecuteNonQuery();

            return true;
        }
        catch {

            return false;
        }
    }


    public DataTable RegresaValores(string Query)
    {
        SqlConnection ObjCnx = new SqlConnection(StrCnx);
        DataSet Dtset = new DataSet();

        try
        {
            ObjCnx.Open();

            SqlCommand ObjSqlCmd = new SqlCommand(Query, ObjCnx);
            ObjSqlCmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(ObjSqlCmd);
            da.Fill(Dtset);

            return Dtset.Tables[0];
        }
        catch
        {
            return null;
        }
    }
  

}



