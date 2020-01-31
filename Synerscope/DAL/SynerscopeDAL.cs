using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Synerscope.BO;

namespace Synerscope.DAL
{
    public class SynerscopeDAL : Database
    {
        public int Create(SynerscopeBO synerscopeBO)
        {
            //INSERT INTO statement die de ingevoerde waardes toevoegd aan de SQL database
            return ExecOverig($"INSERT INTO Persoon (Voornaam, Achternaam) VALUES ('{synerscopeBO.Voornaam}','{synerscopeBO.Achternaam}')");
        }

        public int CreateHobbyAanPersoon(SynerscopeBO synerscopeBO)
        {
            //INSERT INTO statement die de ingevoerde waardes toevoegd aan de SQL database
            return ExecOverig($"INSERT INTO PersoonHobby(PersoonID, HobbyID) VALUES ('{synerscopeBO.PersoonID}','{synerscopeBO.HobbyID}')");
        }
    }
}