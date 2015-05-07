using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for SecurityTools
/// </summary>
public class SecurityTools
{
	public SecurityTools()
	{
		//
		// TODO: Add constructor logic here
		//
	}

   

               /// <summary>
        /// <para>چۇۋالچاق كود ھاسىل قىلىش</para>
        /// <para>كودى ھاسىل قىلىدۇ MD5</para>
        /// </summary>
        /// <param name="strMessage">ئەسلى تېكىست</param>
        /// <returns>چۇۋالچاق كود</returns>
        public  String toMD5(String strMessage)
        {
            MD5CryptoServiceProvider objMD5 = new MD5CryptoServiceProvider();
            Byte[] objByteValue = System.Text.Encoding.UTF8.GetBytes(strMessage);
            String strResult = Convert.ToBase64String(objMD5.ComputeHash(objByteValue));
            objMD5.Clear();
            return strResult;
        }
       

       
    }