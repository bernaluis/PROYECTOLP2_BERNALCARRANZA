using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Descripción breve de correo
/// </summary>
public class correo
{
    Boolean estado = true;
    String merror;
	public correo(String destinatario, String asunto, String mensaje)
	{
        MailMessage correo = new MailMessage();
        SmtpClient protocolo = new SmtpClient();
        correo.To.Add(destinatario);
        correo.From = new MailAddress("carranzafernando99@gmail.com", "Fernando Carranza - Creador del Sistema",System.Text.Encoding.UTF8);
        correo.Subject = asunto;
        correo.SubjectEncoding = System.Text.Encoding.UTF8;
        correo.Body = mensaje;
        correo.BodyEncoding = System.Text.Encoding.UTF8;
        correo.IsBodyHtml = false;
        protocolo.Credentials = new System.Net.NetworkCredential("carranzafernando99@gmail.com","fernando12345");
        protocolo.Port = 587;
        protocolo.Host = "smtp.gmail.com";
        protocolo.EnableSsl = true;
        try
        {
            protocolo.Send(correo);
        }
        catch (SmtpException e)
        {
            estado = false;
            merror = e.Message.ToString();
        }
	}
    public Boolean Estado
    {
        get { return estado; }
    }
    public String mensaje_error
    {
        get { return merror; }
    }
}