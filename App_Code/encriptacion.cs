using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Linq;
using System.Web;
using System.Text;

/// <summary>
/// Descripción breve de encriptacion
/// </summary>
public class encriptacion
{
    public String encriptarContra(string originalPassword)
    {
        SHA1 sha1 = new SHA1CryptoServiceProvider();

        byte[] inputBytes = (new UnicodeEncoding()).GetBytes(originalPassword);
        byte[] hash = sha1.ComputeHash(inputBytes);

        return Convert.ToBase64String(hash);
    }
}