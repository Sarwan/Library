using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SearchResult
/// </summary>
public class SearchResult
{
    private int _ID;

    public int ID
    {
        get { return _ID; }
        set { _ID = value; }
    }
    private string _Title;

    public string Title
    {
        get { return _Title; }
        set { _Title = value; }
    }
    private string _Author;

    public string Author
    {
        get { return _Author; }
        set { _Author = value; }
    }
    private string _Language;

    public string Language
    {
        get { return _Language; }
        set { _Language = value; }
    }
    private int _DownCount;

    public int DownCount
    {
        get { return _DownCount; }
        set { _DownCount = value; }
    }
    private int _VisitCount;

    public int VisitCount
    {
        get { return _VisitCount; }
        set { _VisitCount = value; }
    }

    private int _CatID;

    public int CatID
    {
        get { return _CatID; }
        set { _CatID = value; }
    }

	public SearchResult()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public SearchResult(int id,string title,string author,string language,int downcount,int visitcount,int catid)
    {
        this.ID = id;
        this.Title = title;
        this.Author = author;
        this.Language = language;
        this.DownCount = downcount;
        this.VisitCount = visitcount;
        this.CatID = catid;
    }
}