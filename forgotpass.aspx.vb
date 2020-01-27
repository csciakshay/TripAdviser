Imports System.Data.SqlClient

Partial Class forgotpass
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim cmd As New SqlCommand("select id,Usernm,Email from regipg where Usernm='" + txtFullName.Text + "' and Email='" + Txtemail.Text + "'", con)
            Dim da As New SqlDataAdapter
            da.SelectCommand = cmd
            Dim dt As New Data.DataTable()
            da.Fill(dt)
            If dt.Rows.Count > 0 Then
                Dim fullUrl As String = "Hey " + dt.Rows(0)("Usernm").ToString + " your new password is : password"
                Dim smtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient("smtp.gmail.com", 587)

                Dim message As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage("akshay.darji@gmail.com", Txtemail.Text, "TripAdviser Activation", "")
                message.IsBodyHtml = True
                message.Body = fullUrl
                smtpClient.EnableSsl = True
                smtpClient.Send(message)
                Dim cmd2 As New SqlCommand("update regipg set Password='" + FormsAuthentication.HashPasswordForStoringInConfigFile("password", "md5") + "'", con)
                con.Open()
                cmd2.ExecuteNonQuery()

                MsgBox("Reset link sent on " + Txtemail.Text)
                Response.Redirect("loginpg.aspx", False)
            Else
                MsgBox("Email " + Txtemail.Text + " not registered")

            End If
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try
        
    End Sub
End Class
