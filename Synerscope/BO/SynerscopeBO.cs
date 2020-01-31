using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Synerscope.BO
{
    public class SynerscopeBO
    {
        private string _voornaam;
        private string _achternaam;

        public string Voornaam
        {
            get { return _voornaam; }
            set { _voornaam = value; }
        }

        public string Achternaam
        {
            get { return _achternaam; }
            set { _achternaam = value; }
        }
        private int _persoonID;

        public int PersoonID
        {
            get { return _persoonID; }
            set { _persoonID = value; }
        }
        private int _hobbyID;

        public int HobbyID
        {
            get { return _hobbyID; }
            set { _hobbyID = value; }
        }

    }
}