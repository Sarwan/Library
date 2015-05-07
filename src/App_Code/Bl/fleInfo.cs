using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for fleInfo
/// </summary>
public class fleInfo
{
    private int _ID;

    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }
    private string _FileName;

    public string FileName
    {
        get { return _FileName; }
        set { _FileName = value; }
    }
    private string _FilePath;

    public string FilePath
    {
        get { return _FilePath; }
        set { _FilePath = value; }
    }
    private string _Extension;

    public string Extension
    {
        get { return _Extension; }
        set { _Extension = value; }
    }
    private string _MimeType;

    public string MimeType
    {
        get { return _MimeType; }
        set { _MimeType = value; }
    }
    private string _Icon;

    public string Icon
    {
        get { return _Icon; }
        set { _Icon = value; }
    }
    private int _ArticleID;

    public int ArticleID
    {
        get { return _ArticleID; }
        set { _ArticleID = value; }
    }

    

    public fleInfo()
    {
    }
    public fleInfo(int id,int articleid,string filename,string filepath,string icon,string extension,string mimetype)
    {
        this.ID = id;
        this.ArticleID = articleid;
        this.FileName = filename;
        this.FilePath = filepath;
        this.Icon = icon;
        this.Extension = extension;
        this.MimeType = mimetype;
    }
}