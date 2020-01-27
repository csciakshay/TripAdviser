Imports System.Data.SqlClient
Partial Class loginpg
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("login1", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@Usernm", Data.SqlDbType.VarChar).Value = txtFullName.Text
            cmd.Parameters.Add("@Password", Data.SqlDbType.VarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpass.Text, "md5")
            Dim adap As New SqlDataAdapter(cmd)
            Dim dt As New Data.DataTable()
            adap.Fill(dt)
            If dt.Rows.Count > 0 Then
                Session("uname") = txtFullName.Text
                Session("userImage") = dt.Rows(0)("Img").ToString
                Session("email") = dt.Rows(0)("Email").ToString
                Response.Redirect("registration.aspx", False)
            Else
                ' MsgBox("Invalid UserName and password")
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Invalid UserName and password');", True)
            End If
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message, False)
        Finally
            con.Close()
        End Try
        


    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub
End Class
