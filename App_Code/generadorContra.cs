using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de generadorContra
/// </summary>
public class generadorContra
{
    public String generarContra()
    {
        String resp = "";
        String cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        int longitudCadena = cadena.Length;
        Random rand = new Random();
        for (int i = 1; i <= 8; i++)
        {
            int x= rand.Next(1,62);
            char c = cadena[x];
            resp += c;
        }
        return resp;
    }
}