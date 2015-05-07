using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace net.UyghurDev.Library
{
    /// <summary>
    /// Summary description for ArticleHelper
    /// </summary>
    public class ArticleHelper
    {
        private LibraryDataContext dcLb;
        public ArticleHelper()
        {
            dcLb = new LibraryDataContext();
        }

        public IList<SearchResult> getAllArticles()
        {
            var someArticles = from aa in dcLb.Articles
                               where aa.Language !=null
                               orderby aa.ID descending
                               select new SearchResult()
                               {
                                   ID = aa.ID,
                                   Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                   Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                   Language = aa.Language1.NameEn,
                                   DownCount = aa.DownCount,
                                   VisitCount = aa.VisitCount
                               };

            return someArticles.ToList<SearchResult>();
        }

        /// <summary>
        /// recommendation
        /// not good! we have no recomendation table. used down count
        /// </summary>
        /// <returns></returns>
        public IList<SearchResult> getRecomendedArticles()
        {
            var someArticles = (from aa in dcLb.Articles
                               where aa.Language != null && aa.Titles.Count>0 && aa.Recommend==true
                               orderby aa.DownCount descending
                               select new SearchResult()
                               {
                                   ID = aa.ID,
                                   Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                   Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                   Language = aa.Language1.NameEn,
                                   DownCount = aa.DownCount,
                                   VisitCount = aa.VisitCount
                               }).Take(15);

            return someArticles.ToList<SearchResult>();
        }

        /// <summary>
        /// newst article
        /// not good. we have no addtime colum in article table. used ID.
        /// </summary>
        /// <returns></returns>
        public IList<SearchResult> getNewsArticles()
        {
            var someArticles = (from aa in dcLb.Articles
                                where aa.Language != null && aa.Titles.Count > 0
                                orderby aa.ID descending
                                select new SearchResult()
                                {
                                    ID = aa.ID,
                                    Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                    Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                    Language = aa.Language1.NameEn,
                                    DownCount = aa.DownCount,
                                    VisitCount = aa.VisitCount
                                }).Take(15);

            return someArticles.ToList<SearchResult>();
        }

        /// <summary>
        /// Top viewed articles
        /// </summary>
        /// <returns></returns>
        public IList<SearchResult> getTopViewdArticles()
        {
            var someArticles = (from aa in dcLb.Articles
                                where aa.Language != null && aa.Titles.Count > 0
                                orderby aa.VisitCount descending
                                select new SearchResult()
                                {
                                    ID = aa.ID,
                                    Title = aa.Titles.OrderBy(t=>t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                    Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                    Language = aa.Language1.NameEn,
                                    DownCount = aa.DownCount,
                                    VisitCount = aa.VisitCount
                                }).Take(15);

            return someArticles.ToList<SearchResult>();
        }

        public IList<SearchResult> getTopDownloadedArticles()
        {
            var someArticles = (from aa in dcLb.Articles
                                where aa.Language != null && aa.Titles.Count > 0
                                orderby aa.DownCount descending
                                select new SearchResult()
                                {
                                    ID = aa.ID,
                                    Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                    Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                    Language = aa.Language1.NameEn,
                                    DownCount = aa.DownCount,
                                    VisitCount = aa.VisitCount
                                }).Take(15);

            return someArticles.ToList<SearchResult>();
        }

        public IList<SearchResult> getTopReplayedArticles()
        {
            var someArticles = (from aa in dcLb.Articles
                                where aa.Language != null && aa.Titles.Count > 0
                                orderby aa.Replays.Count descending
                                select new SearchResult()
                                {
                                    ID = aa.ID,
                                    Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                    Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                    Language = aa.Language1.NameEn,
                                    DownCount = aa.DownCount,
                                    VisitCount = aa.VisitCount
                                }).Take(15);

            return someArticles.ToList<SearchResult>();
        }

        public IEnumerable<SearchResult> getArticlesByCategory(int FirstCat, int SecondCat, int ThirdCat)
        {

          return  getArticlesByCategory(FirstCat + SecondCat + ThirdCat);

        }


        public IEnumerable<SearchResult> getArticlesByCategory(int CatID)
        {
            var someArticles = from aa in dcLb.Articles
                               orderby aa.VisitCount descending
                               select new SearchResult()
                               {
                                   ID = aa.ID,
                                   Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).FirstOrDefault().ToString(),
                                   Author = aa.Authors.Select(a => a.AuthorName).FirstOrDefault().ToString(),
                                   Language = aa.Language1.NameEn,
                                   DownCount = aa.DownCount,
                                   VisitCount = aa.VisitCount,
                                   CatID=Convert.ToInt32(aa.Classification)
                               };
            if (CatID % 100 == 0)
            {
                someArticles = someArticles.Where(a => a.CatID >= CatID && a.CatID < CatID+100);
            }
            else if (CatID % 10 == 0)
            {
                
                someArticles = someArticles.Where(a => a.CatID> CatID-1 && a.CatID <CatID+10);
            }
            else
            {
                someArticles = someArticles.Where(a => a.CatID == CatID);
            }

            return someArticles;
        }


        public IEnumerable<SearchResult> search(String Keyword)
        {
            return search(Keyword, false, false);
        }

        public IEnumerable<SearchResult> searchByTitle(String Keyword)
        {
            return search(Keyword, false, true);
        }

        public IEnumerable<SearchResult> searchByKeyword(String Keyword)
        {
          return  search(Keyword, true, false);
        }

        private IEnumerable<SearchResult> search(String Keyword,Boolean byKeyword,Boolean byTitle)
        {

            var kw = from k in dcLb.KeyWords
                     where k.KeyWord1.Contains(Keyword)
                     select k.ArticleID;
            var tit = from t in dcLb.Titles
                      where t.Title1.Contains(Keyword)
                      select t.ArticleID;
            //var all = (from k in dcLb.KeyWords
            //          where k.KeyWord1.Contains(Keyword)
            //          select k.Article).Union(
            //          from t in dcLb.Titles
            //          where t.Title1.Contains(Keyword)
            //          select t.Article
            //          ).Distinct().Select(al=>al.ID);
            //List<int> nak = kw.ToList<int>();
            //List<int> nat = tit.ToList<int>();
            //nak.AddRange(nat);
           // int kc = kw.Count();
            var someArticles = from aa in dcLb.Articles
                               orderby aa.VisitCount descending
                               select aa;
            if (byKeyword &&!byTitle)
            {
                //someArticles=(IOrderedQueryable<Article>)(from a in someArticles
                //             where a.KeyWords.Select(k=>k.KeyWord1).Contains(Keyword)
                //             select a);


                someArticles = (IOrderedQueryable<Article>)(from a in someArticles
                                                            join kww in kw on a.ID equals kww
                                                            where a.ID==kww
                                                            select a);
            }
            else if (byTitle && !byKeyword)
            {
                someArticles = (IOrderedQueryable<Article>)(from a in someArticles
                                                            join tt in tit on a.ID equals tt
                                                            where a.ID == tt 
                                                            select a);
            }
            else if (byTitle && byKeyword)
            {
                //someArticles=(IOrderedQueryable<Article>)(from a in someArticles
                //where a.Titles.Select(t=>t.Title1).Contains(Keyword) && a.KeyWords.Select(k=>k.KeyWord1).Contains(Keyword)
                //select a);

                someArticles = (IOrderedQueryable<Article>)(from a in someArticles
                                                            join tt in tit on a.ID equals tt
                                                            join kww in kw on a.ID equals kww
                                                            where a.ID == tt && a.ID == kww
                                                            select a);
            }
            else
            {
                //someArticles = (IOrderedQueryable<Article>)(from a in someArticles
                //            where a.Titles.Select(t => t.Title1).Contains(Keyword) || a.KeyWords.Select(k => k.KeyWord1).Contains(Keyword)
                //            select a);
                var ta = (IOrderedQueryable<Article>)(from a in someArticles
                                                            join tt in tit on a.ID equals tt
                                                             where a.ID == tt 
                                                            select a);
                var ka = (IOrderedQueryable<Article>)(from a in someArticles
                                                            join kww in kw on a.ID equals kww
                                                            where a.ID == kww
                                                            select a);
                someArticles = (IOrderedQueryable<Article>)ta.Union(ka).Distinct();
                
            }

            var finalResult = from aa in someArticles
                         select new SearchResult()
                               {
                                   ID = aa.ID,
                                   Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).FirstOrDefault().ToString(),
                                   Author = aa.Authors.Select(a => a.AuthorName).FirstOrDefault().ToString(),
                                   Language = aa.Language1.NameEn,
                                   DownCount = aa.DownCount,
                                   VisitCount = aa.VisitCount,
                                   CatID = Convert.ToInt32(aa.Classification)
                               };

            return finalResult;//(IEnumerable<SearchResult>)someArticles;
            
        }

        private Boolean KeyWordContains(System.Data.Linq.EntitySet<KeyWord> kwords,string strkw)
        {
            var kw=from k in kwords
                   where k.KeyWord1.Contains(strkw)
                   select(k.ID);
            if(kw.Count()>0)
            {
                return true;
            }
            else
            {
                return false;
            }
                
        }

        private Boolean TitleContains(System.Data.Linq.EntitySet<Title> esTitle, string strKw)
        { 
            var tt=from t in esTitle
                   where t.Title1.Contains(strKw)
                   select t.ID;
            if (tt.Count() > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Article getArticle(Int32 nArticleID)
        {
            Article oneArticle = (from aa in dcLb.Articles
                                    where aa.ID == nArticleID
                                    select aa).SingleOrDefault();

            return oneArticle;
        }

        public void addVisitCount(Int32 nArticleID)
        {
            Article oneArticle = (from aa in dcLb.Articles
                                  where aa.ID == nArticleID
                                  select aa).SingleOrDefault();
            oneArticle.VisitCount++;
            dcLb.SubmitChanges();
        }

        public void addDownCount(Int32 nArticleID)
        {
            Article oneArticle = (from aa in dcLb.Articles
                                  where aa.ID == nArticleID
                                  select aa).SingleOrDefault();
            oneArticle.DownCount++;
            dcLb.SubmitChanges();
        }


        /// <summary>
        /// not used
        /// </summary>
        /// <param name="CurrentPage"></param>
        /// <param name="PageSize"></param>
        /// <returns></returns>
        public object getTopDownloadedArticles(int CurrentPage, int PageSize)
        {
            var someArticles = (from aa in dcLb.Articles
                                where aa.Language != null && aa.Titles.Count > 0
                                orderby aa.DownCount descending
                                select new SearchResult()
                                {
                                    ID = aa.ID,
                                    Title = aa.Titles.OrderBy(t => t.Language).Select(t => t.Title1).Take(1).SingleOrDefault().ToString(),
                                    Author = aa.Authors.Select(a => a.AuthorName).Take(1).SingleOrDefault().ToString(),
                                    Language = aa.Language1.NameEn,
                                    DownCount = aa.DownCount,
                                    VisitCount = aa.VisitCount
                                }).Take(15).Skip((CurrentPage-1)*PageSize);

            return someArticles.ToList<SearchResult>();
        }


        public IList<SearchResult> getArticleForHome(TopArticleType ArticleType)
        {
            switch (ArticleType)
            {
                case TopArticleType.MostDownloaded:
                    return getTopDownloadedArticles();
                    break;
                case TopArticleType.MostReplayed:
                    return getTopReplayedArticles();
                    break;
                case TopArticleType.MostVisited:
                    return getTopViewdArticles();
                    break;
                case TopArticleType.Newst:
                    return getNewsArticles();
                    break;
                case TopArticleType.Recomended:
                    return getRecomendedArticles();
                    break;
            }
            return null;
        }
    }
}