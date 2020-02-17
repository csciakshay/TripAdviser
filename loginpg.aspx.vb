Imports System.Data.SqlClient
Partial Class loginpg
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("login1", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@Usernm", Data.SqlDbType.VarChar).Value = txtFullName.Text
        cmd.Parameters.Add("@Password", Data.SqlDbType.VarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpass.Text, "md5")

        'If dt.Rows.Count > 0 Then
        'MsgBox("valid")

        'Response.Redirect("regitem.aspx")
        'Else
        'MsgBox("invalid")
        'End If
        'If cmd.ExecuteNonQuery() Then
        'MsgBox("success")
        'Else
        'MsgBox("fail")
        'End If
        'Dim adap As New SqlDataAdapter("login1", con)
        Dim dt As New Data.DataTable()
        dt.Load(cmd.ExecuteReader())
        If dt.Rows.Count > 0 Then
            Session("uid") = dt.Rows(0)("Id").ToString
            Session("uname") = txtFullName.Text
            Session("userImage") = dt.Rows(0)("Img").ToString
            Session("email") = dt.Rows(0)("email").ToString
            Response.Redirect("registration.aspx", False)
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Invalid UserName and password');", True)
            'MsgBox("Invalid UserName and password")
        End If
        con.Close()

    End Sub

    Protected Sub txtpass_TextChanged(sender As Object, e As EventArgs) Handles txtpass.TextChanged

    End Sub

    Protected Sub txtFullName_TextChanged(sender As Object, e As EventArgs) Handles txtFullName.TextChanged

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub
End Class
