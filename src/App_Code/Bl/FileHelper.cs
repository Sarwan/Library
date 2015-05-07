using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for FileHelper
/// </summary>
public class DocumentFiles
{
    public DocumentFiles()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<fleInfo> getAllFiles()
    {
        return null;
    }

    public List<fleInfo> getFiles(int nArticleID)
    {
        LibraryDataContext lib = new LibraryDataContext();
        List<fleInfo> files = (from f in lib.Files
                               where f.ArticleID == nArticleID
                               select new fleInfo
                               {
                                   ID=f.ID,
                                   ArticleID=f.ArticleID,
                                   FileName=f.FileName,
                                   FilePath=f.FilePath,
                                   Extension=f.FileType1.Extension,
                                   Icon=f.FileType1.Icon,
                                   MimeType=f.FileType1.MimeType
                               }).ToList<fleInfo>();
        return files;
    }
}