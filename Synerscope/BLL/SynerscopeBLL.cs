using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Synerscope.BO;
using Synerscope.DAL;

namespace Synerscope.BLL
{
    public class SynerscopeBLL
    {
        public int Create(SynerscopeBO synerscopeBO)
        {
            SynerscopeDAL synerscopeDAL = new SynerscopeDAL();
            return synerscopeDAL.Create(synerscopeBO);
        }

        public int CreateHobbyAanPersoon(SynerscopeBO synerscopeBO)
        {
            SynerscopeDAL synerscopeDAL = new SynerscopeDAL();
            return synerscopeDAL.CreateHobbyAanPersoon(synerscopeBO);
        }
    }
}