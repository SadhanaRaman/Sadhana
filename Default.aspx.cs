using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace Portfolio_Sadhana
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static void SendEmail(string emailTo, string Name)
        {
            MailMessage mailMessage = new MailMessage("sadhanaraman4590@gmail.com", emailTo);
            mailMessage.Subject = "Thank you - " + Name;
            mailMessage.Body = "Hi there " + Name + "<p>Thanks for taking the time to give your feedback. It means so much. If you had any queries, I'll get back shortly with a response.</p><p> Cheers </p> Sadhana Kalyana Raman";
            mailMessage.IsBodyHtml = true;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "sadhanaraman4590@gmail.com",
                Password = "Lelouch4590"
            };



            smtpClient.Send(mailMessage);
        }

        [System.Web.Services.WebMethod]
        public static void SendFeedback(string emailFrom, string comments, string name)
        {
            MailMessage mailMessage = new MailMessage("sadhanaraman4590@gmail.com", "sadhanaraman4590@gmail.com");
            mailMessage.Subject = "Website Feedback : - " + name;
            mailMessage.Body = comments + "<p>Email - " + emailFrom + "</p>";
            mailMessage.IsBodyHtml = true;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "sadhanaraman4590@gmail.com",
                Password = "Lelouch4590"
            };



            smtpClient.Send(mailMessage);
        }
    }
}