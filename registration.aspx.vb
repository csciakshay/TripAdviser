Imports System.Data.SqlClient
Partial Class registration
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
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
        Dim cmd As New SqlCommand("insertpro", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@Usernm", Data.SqlDbType.VarChar).Value = txtFullName.Text
        cmd.Parameters.Add("@City", Data.SqlDbType.VarChar).Value = citydropdown.SelectedValue
        cmd.Parameters.Add("@Contactno", Data.SqlDbType.VarChar).Value = txtContactNo.Text
        cmd.Parameters.Add("@Password", Data.SqlDbType.VarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "md5")
        cmd.Parameters.Add("@Img", Data.SqlDbType.VarChar).Value = img
        cmd.Parameters.Add("@Gender", Data.SqlDbType.VarChar).Value = gender
        cmd.Parameters.Add("@State", Data.SqlDbType.VarChar).Value = statedropdown.SelectedValue
        cmd.Parameters.Add("@Email", Data.SqlDbType.VarChar).Value = txtEmail.Text
        cmd.Parameters.Add("@Address", Data.SqlDbType.VarChar).Value = txtAddress.Text
        cmd.Parameters.Add("@Country", Data.SqlDbType.VarChar).Value = countrydropdown.SelectedValue
        If cmd.ExecuteNonQuery Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Insert Sucessfully');", True)
            reset()
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "fails", "alert('Insert fail');", True)
            reset()
        End If

        con.Close()
    End Sub
    Sub reset()
        txtFullName.Text = ""
        citydropdown.SelectedValue = ""
        txtContactNo.Text = ""
        txtPassword.Text = ""
        rbMale.Checked = False
        rbFemale.Checked = False
        statedropdown.SelectedValue = ""
        txtEmail.Text = ""
        txtAddress.Text = ""
        countrydropdown.SelectedValue = ""
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
        If Session("uid") Then
            Dim adp As New SqlDataAdapter("select * from regipg where id=" & Session("uid") & "", con)
            Dim dt As New Data.DataTable()
            adp.Fill(dt)

            If dt.Rows.Count > 0 Then
                btnUpdate.Visible = True
                Image1.Visible = True
                txtFullName.Text = dt.Rows(0)("Usernm").ToString

                countrydropdown.SelectedValue = dt.Rows(0)("country").ToString
                'Me.countrydropdown_SelectedIndexChanged(sender, e)
                
                statedropdown.SelectedValue = dt.Rows(0)("State").ToString
                'statedropdown_SelectedIndexChanged(sender, e)

                citydropdown.SelectedValue = dt.Rows(0)("City").ToString
                txtContactNo.Text = dt.Rows(0)("Contactno").ToString
                txtPassword.Text = dt.Rows(0)("Password").ToString
                txtEmail.Text = dt.Rows(0)("Address").ToString

                txtAddress.Text = dt.Rows(0)("Address").ToString
                Image1.ImageUrl = dt.Rows(0)("img").ToString
            Else
                btnUpdate.Visible = False
                Image1.Visible = False
            End If

        End If

        If Not Page.IsPostBack Then
            Dim adp As New SqlDataAdapter("select * from countrymst", con)
            Dim dt As New Data.DataTable()
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                countrydropdown.DataSource = dt
                countrydropdown.DataTextField = "Country"
                countrydropdown.DataValueField = "id"
                countrydropdown.DataBind()
                countrydropdown.Items.Insert(0, New ListItem("Select Country", ""))

            End If

        End If
    End Sub

    Protected Sub countrydropdown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles countrydropdown.SelectedIndexChanged
        Try

            con.Open()
            Dim adap As New SqlDataAdapter("select * from statemst where  Country=" & countrydropdown.SelectedValue & "", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            statedropdown.DataSource = ds
            statedropdown.DataTextField = "state"
            statedropdown.DataValueField = "id"
            statedropdown.DataBind()
            statedropdown.Items.Insert(0, New ListItem("Select State", ""))
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub statedropdown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles statedropdown.SelectedIndexChanged
        Try

            con.Open()
            Dim adap As New SqlDataAdapter("select * from citymst where  State=" & statedropdown.SelectedValue & "", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            citydropdown.DataSource = ds
            citydropdown.DataTextField = "city"
            citydropdown.DataValueField = "id"
            citydropdown.DataBind()
            citydropdown.Items.Insert(0, New ListItem("Select city", ""))
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub citydropdown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles citydropdown.SelectedIndexChanged

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
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

        Dim cmd As New SqlCommand("updateprofile", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@Usernm", Data.SqlDbType.VarChar).Value = txtFullName.Text
        cmd.Parameters.Add("@City", Data.SqlDbType.VarChar).Value = citydropdown.SelectedValue
        cmd.Parameters.Add("@Contactno", Data.SqlDbType.VarChar).Value = txtContactNo.Text
        cmd.Parameters.Add("@Password", Data.SqlDbType.VarChar).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "md5")
        cmd.Parameters.Add("@Img", Data.SqlDbType.VarChar).Value = img
        cmd.Parameters.Add("@Gender", Data.SqlDbType.VarChar).Value = gender
        cmd.Parameters.Add("@State", Data.SqlDbType.VarChar).Value = statedropdown.SelectedValue
        cmd.Parameters.Add("@Email", Data.SqlDbType.VarChar).Value = txtEmail.Text
        cmd.Parameters.Add("@Address", Data.SqlDbType.VarChar).Value = txtAddress.Text
        cmd.Parameters.Add("@Country", Data.SqlDbType.VarChar).Value = countrydropdown.SelectedValue
        If cmd.ExecuteNonQuery Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Insert Sucessfully');", True)
            reset()
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "fails", "alert('Insert fail');", True)
            reset()
        End If

        con.Close()
    End Sub
End Class
