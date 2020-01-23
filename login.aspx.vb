Imports System.Data.SqlClient
Partial Class login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Dbconnection").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("insertregi", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@Usernm", Data.SqlDbType.VarChar).Value = txtFullName.Text
        cmd.Parameters.Add("@Password", Data.SqlDbType.VarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtpass.Text, "md5")

        'If dt.Rows.Count > 0 Then
        'MsgBox("valid")

        'Response.Redirect("regitem.aspx")
        'Else
        'MsgBox("invalid")
        'End If
        If cmd.ExecuteNonQuery() Then
            MsgBox("success")
        Else
            MsgBox("fail")
        End If
        con.Close()
    End Sub
End Class
