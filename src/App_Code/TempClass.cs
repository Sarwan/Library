using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TempClass
/// </summary>
public class TempClass
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
    private string _language;

    public string Language
    {
        get { return _language; }
        set { _language = value; }
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
	public TempClass()
	{
        
		//
		// TODO: Add constructor logic here
		//
	}
}