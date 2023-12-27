using MimeKit;
using MailKit.Net.Smtp;
using System.IO;
using System;
using System.Web;
using PayPal.Api;
using static System.Net.Mime.MediaTypeNames;
using System.Drawing;

namespace ShirtTee
{
    public class EmailManager
    {
        public static void sendEmail(string receiverName, string receiverEmail, string orderId)
        {
            //^[^@\s]+@[^@\s]+\.[^@\s]+$
            var email = new MimeMessage();

            email.From.Add(new MailboxAddress("ShirtTee", "shirttee@email.com"));
            email.To.Add(new MailboxAddress(receiverName, receiverEmail));

            email.Subject = "Testing out email sending";


            var bodyBuilder = new BodyBuilder();

            string htmlContent = emailTemplate(receiverName, orderId);
            bodyBuilder.HtmlBody = htmlContent;
            email.Body = bodyBuilder.ToMessageBody();
            using (var smtp = new SmtpClient())
            {
                smtp.Connect("sandbox.smtp.mailtrap.io", 2525, false);

                // Note: only needed if the SMTP server requires authentication
                smtp.Authenticate("42413a30c4b465", "7acc747fcd7fef");

                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }

        private static string emailTemplate(string receiverName, string orderId)
        {
            string emailTemplate = $@"
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
    <title>ShirtTee</title>
    <style>
        body {{
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }}

        section {{
            max-width: 2xl;
            padding: 2% 6%;
            background-color: white;
        }}

        header img {{
            width: auto;
            height: 7%;
        }}

        main {{
            margin-top: 2%;
        }}

        h2 {{
            color: #333;
        }}

        p {{
            margin-top: 2%;
            line-height: 1.5;
            color: #666;
        }}

        button {{
            padding: 6px 12px;
            margin-top: 2%;
            font-size: 12px;
            font-weight: medium;
            letter-spacing: wider;
            color: white;
            background-color: #3490dc;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }}

        button:hover {{
            background-color: #2779bd;
        }}

        footer {{
            margin-top: 8%;
        }}

        footer p {{
            color: #777;
        }}

        footer a {{
            color: #3490dc;
            text-decoration: none;
        }}

        footer a:hover {{
            text-decoration: underline;
        }}

        footer p:last-child {{
            margin-top: 3%;
        }}
    </style>
</head>
<body>
    <section>
        <header>
            <h1>ShirtTee</h1>
        </header>

        <main>
            <h2>Hi {receiverName}</h2>
            <p>Your Order #{orderId} is updated</p>

            <p>
                Thanks,
                <br>
                ShirtTee
            </p>

            <button>Login</button>
        </main>

        <footer>

            <p>© 2023 ShirtTee. All Rights Reserved.</p>
        </footer>
    </section>
</body>
</html>
";

            return emailTemplate;
        }
    }
}