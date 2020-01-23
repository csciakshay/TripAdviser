Imports System.Data.SqlClient
Partial Class registrationpg
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Dbconnection").ConnectionString)

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        con.Open()
        Dim gender As String
        Dim img As String
        If rbMale.Checked Then
            gender = "male"
        Else
            gender = "female"
        End If
        FileUpload1.SaveAs(Server.MapPath("~/upload/" + FileUpload1.FileName))
        img = "~/upload/" + FileUpload1.FileName

        Dim cmd As New SqlCommand("insertregi", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@Usernm", Data.SqlDbType.VarChar).Value = txtFullName.Text
        cmd.Parameters.Add("@City", Data.SqlDbType.VarChar).Value = txtCity.Text
        cmd.Parameters.Add("@Contactno", Data.SqlDbType.VarChar).Value = txtContactNo.Text
        cmd.Parameters.Add("@Password", Data.SqlDbType.VarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "md5")
        cmd.Parameters.Add("@Img", Data.SqlDbType.VarChar).Value = img
        cmd.Parameters.Add("@Gender", Data.SqlDbType.VarChar).Value = gender
        cmd.Parameters.Add("@State", Data.SqlDbType.VarChar).Value = txtState.Text
        cmd.Parameters.Add("@Email", Data.SqlDbType.VarChar).Value = txtEmail.Text
        cmd.Parameters.Add("@Address", Data.SqlDbType.VarChar).Value = txtAddress.Text
        cmd.Parameters.Add("@Country", Data.SqlDbType.VarChar).Value = txtCountry.Text
        If cmd.ExecuteNonQuery() Then
            MsgBox("success")
        Else
            MsgBox("fail")
        End If
        con.Close()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub

    Protected Sub txtCountry_TextChanged(sender As Object, e As EventArgs) Handles txtCountry.TextChanged

    End Sub
End Class
