using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Data.Linq;
using System.Linq;
using System.Collections.Generic;

namespace net.UyghurDev.Library
{
    public class CategoryHelper
    {
        private LibraryDataContext dcLb;
        public CategoryHelper()
        {
            dcLb = new LibraryDataContext();
        }

        /// <summary>
        /// بىرىنچى دەرىجىلىك سەھىپىلەرنى ئېلىش
        /// n=0~9
        /// F=n*100
        /// </summary>
        /// <returns></returns>
        public List<Classification> getFirstCategories()
        {
            List<Classification> FirstCategories = (from cc in dcLb.Classifications
                                                    where cc.ID % 100 == 0 && cc.NameUy != null
                                                    orderby cc.ID ascending
                                                    select cc
                                                     ).ToList<Classification>();

            return FirstCategories;
        }

        /// <summary>
        /// ئىككىنچى دەرىجىلىك سەھىپىلەرنى ئېلىش
        /// n=0~9
        /// S=F+10*n
        /// </summary>
        /// <param name="FirstCategoryID"></param>
        /// <returns></returns>
        public List<Classification> getSecondCategories(int FirstCategoryID)
        {
            List<Classification> secondCategories = (from cc in dcLb.Classifications
                                                     where cc.ID > FirstCategoryID && cc.ID < FirstCategoryID + 100 & cc.ID % 10 == 0 && cc.NameUy != null
                                                     orderby cc.ID ascending
                                                     select cc).ToList<Classification>();

            return secondCategories;
        }

        /// <summary>
        /// ئۈچۈنچى دەرىجىلىك سەھىپىلەرنى ئېلىش
        /// n=0~9
        /// T=F+S+n
        /// </summary>
        /// <param name="SecondCategoryID"></param>
        /// <returns></returns>
        public List<Classification> getThirdCategories(int SecondCategoryID)
        {
            List<Classification> ThirdCategories = (from cc in dcLb.Classifications
                                                    where cc.ID > SecondCategoryID && cc.ID < SecondCategoryID + 10 && cc.NameUy != null
                                                    orderby cc.ID ascending
                                                    select cc).ToList<Classification>();

            return ThirdCategories;
        }

        public Classification getCategory(int nCatID)
        {
           Classification  oneCat = (from cc in dcLb.Classifications
                               where cc.ID ==nCatID && cc.NameUy!=null
                               orderby cc.ID ascending
                               select cc).FirstOrDefault();
           return oneCat;
        }
        
    }
}