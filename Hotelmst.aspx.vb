Imports System.Data.SqlClient
Partial Class Hotelmst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
        If Not Page.IsPostBack Then
            Dim adp As New SqlDataAdapter("select * from countrymst", con)
            Dim dt As New Data.DataTable()
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                country.DataSource = dt
                country.DataTextField = "Country"
                country.DataValueField = "Country"
                country.DataBind()
                country.Items.Insert(0, New ListItem("Select Country", ""))

            End If

            Dim adp1 As New SqlDataAdapter("select * from statemst", con)
            Dim dt1 As New Data.DataTable()
            adp1.Fill(dt1)
            If dt1.Rows.Count > 0 Then
                state.DataSource = dt1
                state.DataTextField = "state"
                state.DataValueField = "state"
                state.DataBind()
                state.Items.Insert(0, New ListItem("Select state", ""))

            End If


            Dim adp2 As New SqlDataAdapter("select * from citymst", con)
            Dim dt2 As New Data.DataTable()
            adp2.Fill(dt2)
            If dt2.Rows.Count > 0 Then
                city.DataSource = dt2
                city.DataTextField = "city"
                city.DataValueField = "city"
                city.DataBind()
                city.Items.Insert(0, New ListItem("Select city", ""))

            End If
        End If
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If Page.IsPostBack Then
            con.Open()
            Dim check As String = ""

            For Each item As ListItem In CheckBoxList1.Items
                If item.Selected Then
                    check &= item.Value + ","
                End If
            Next
            Dim adap As New SqlCommand("select max(Id) from hotelmst", con)
            Dim a As Integer
            a = adap.ExecuteScalar()
            a += 1

            Dim img As String
            FileUpload1.SaveAs(Server.MapPath("~/upload/" + FileUpload1.FileName))
            img = "~/upload/" + FileUpload1.FileName
            Dim cmd As New SqlCommand("hotelpro", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@Hotelnm", Data.SqlDbType.VarChar).Value = txtnm.Text
            cmd.Parameters.Add("@Address", Data.SqlDbType.VarChar).Value = txtadrss.Text
            cmd.Parameters.Add("@Country", Data.SqlDbType.VarChar).Value = country.SelectedValue
            cmd.Parameters.Add("@State", Data.SqlDbType.VarChar).Value = state.SelectedValue
            cmd.Parameters.Add("@City", Data.SqlDbType.VarChar).Value = city.SelectedValue
            cmd.Parameters.Add("@Check_in", Data.SqlDbType.VarChar).Value = txtcheckin.Text
            cmd.Parameters.Add("@Check_out", Data.SqlDbType.VarChar).Value = txtcheckout.Text
            cmd.Parameters.Add("@Room", Data.SqlDbType.VarChar).Value = txtroom.Text
            cmd.Parameters.Add("@Rate", Data.SqlDbType.VarChar).Value = txtrate.Text
            cmd.Parameters.Add("@Facility", Data.SqlDbType.VarChar).Value = check
            cmd.Parameters.Add("@Id", Data.SqlDbType.VarChar).Value = a
            cmd.Parameters.Add("@imagepath", Data.SqlDbType.VarChar).Value = img

            If cmd.ExecuteNonQuery() Then
                MsgBox("success")
            Else
                MsgBox("fail")
            End If
            con.Close()
        End If

    End Sub
End Class
