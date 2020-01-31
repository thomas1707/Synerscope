using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Synerscope.DAL
{
    public class Database
    {
        //TOEVOEGEN ALS REFERENCE
        static string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        //de functie die word gebruikt om de overige sql querys uit te voeren.
        public int ExecOverig(string sqlString)
        {
            int result = 0;
            // Creeer een nieuw SqlConnection Object met de connectionString
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Alle data uit het Windows Forms formulieren  wordt
                // in het data object klas gestopt. getransporteerd via de Business Logic Layer 
                // naar de Data Access Laag.
                // In de Data Access Laag wordt de connectie met de database verzorgd.

                // Creeer een nieuw SqlCommand Object
                SqlCommand cmd = new SqlCommand
                {
                    // vul het SqlCommando object met relevante informatie
                    Connection = con,               // De verbinding
                    CommandType = CommandType.Text, // Type command is Text
                                                    // De SQL query string om een nieuwe klas in te voeren
                    CommandText = sqlString
                };


                // Voer de query uit
                try
                {
                    // Open de Database connection met de connection string
                    con.Open();
                    result = cmd.ExecuteNonQuery();      // Voer het commando uit op de database
                    con.Close();
                }
                catch (Exception)
                {
                    // Belangrijk: Toon error message hier. 
                    //MessageBox.Show("Fatale fout: " + e.Message);
                }
            }   // 
            return result; // Aantal rijen aangepast in de tabel
        }

        //de functie die word gebruikt voor het selecteren van data.
        public DataSet ExecSelect(string sqlString)
        {
            //het aanmaken van een nieuwe dataset met de opgevraagde gegevens er in
            DataSet ds = new DataSet();
            // Creeer een nieuw SqlConnection Object met de connectionString
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    // Met behulp van een DataAdapter wordt er een dataset gevuld met het
                    // meegegeven select statement
                    // De Dataset wordt vanuit de Data Access Layer weer via de 
                    // Business Logic Layer doorgestuurd naar de Presentatie Layer

                    SqlDataAdapter da = new SqlDataAdapter();   // Maak een DataAdapter object om een DataSet op te vragen.

                    SqlCommand cmd = new SqlCommand()           // Creeer een nieuw SqlCommand object
                    {
                        Connection = con,               // De verbinding
                        CommandType = CommandType.Text, // Type command is Text
                        CommandText = sqlString         // De  Sql query string om alle data op te vragen

                    };
                    da.SelectCommand = cmd;
                    //ds.Clear();

                    // Verkorte schrijfwijze
                    // da.SelectCommand= new SqlCommand(sqlString,con);

                    // Vul de DataSet ds met de tabel uit de Leerlinggegevens database
                    da.Fill(ds);
                }
                catch (Exception)
                {
                    // Belangrijk: Geef error message hier
                    //MessageBox.Show("Fatale fout bij selecteren: " + e.Message);
                }
                return ds;
            }
        }
    }
}