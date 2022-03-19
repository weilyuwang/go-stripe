package main

import (
	"bytes"
	"embed"
	"fmt"
	mail "github.com/xhit/go-simple-mail/v2"
	"html/template"
	"time"
)

//go:embed email-templates
var emailTemplateFS embed.FS

func (app *application) SendMail(from, to, subject, tmpl string, attachments []string, data interface{}) error {
	templateToRender := fmt.Sprintf("email-templates/%s.html.tmpl", tmpl)

	t, err := template.New("email-html").ParseFS(emailTemplateFS, templateToRender)
	if err != nil {
		app.errorLog.Println(err)
		return err
	}

	var tpl bytes.Buffer
	if err = t.ExecuteTemplate(&tpl, "body", data); err != nil {
		app.errorLog.Println(err)
		return err
	}

	formattedMessage := tpl.String()

	templateToRender = fmt.Sprintf("email-templates/%s.plain.tmpl", tmpl)
	t, err = template.New("email-plain").ParseFS(emailTemplateFS, templateToRender)
	if err != nil {
		app.errorLog.Println(err)
		return err
	}

	if err = t.ExecuteTemplate(&tpl, "body", data); err != nil {
		app.errorLog.Println(err)
		return err
	}

	plainMessage := tpl.String()

	app.infoLog.Println(formattedMessage, plainMessage)

	// SMTP Server
	server := mail.NewSMTPClient()
	server.Host = app.config.smtp.host
	server.Port = app.config.smtp.port
	server.Username = app.config.smtp.username
	server.Password = app.config.smtp.password
	server.Encryption = mail.EncryptionTLS
	server.KeepAlive = false
	server.ConnectTimeout = 10 * time.Second
	server.SendTimeout = 10 * time.Second

	// SMTP client
	smtpClient, err := server.Connect()
	if err != nil {
		return err
	}

	email := mail.NewMSG()
	email.SetFrom(from).AddTo(to).SetSubject(subject)
	email.SetBody(mail.TextHTML, formattedMessage)
	email.AddAlternative(mail.TextPlain, plainMessage)
	if len(attachments) > 0 {
		for _, x := range attachments {
			email.AddAttachment(x)
		}
	}

	err = email.Send(smtpClient)
	if err != nil {
		app.errorLog.Println(err)
		return err
	}

	return nil
}
