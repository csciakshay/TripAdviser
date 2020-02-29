Imports System.Data.SqlClient
Partial Class home
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim adp As New SqlDataAdapter("select * from citymst", con)
            Dim dt As New Data.DataTable
            adp.Fill(dt)

            If dt.Rows.Count > 0 Then
                DropDownList1.DataSource = dt
                DropDownList1.DataTextField = "city"
                DropDownList1.DataValueField = "id"
                DropDownList1.DataBind()
                DropDownList1.Items.Insert(0, "Select City")
            End If
            Dim adp1 As New SqlDataAdapter("select * from countrymst", con)
            Dim dt1 As New Data.DataTable
            adp1.Fill(dt1)

            If dt1.Rows.Count > 0 Then
                DropDownList2.DataSource = dt1
                DropDownList2.DataTextField = "Country"
                DropDownList2.DataValueField = "id"
                DropDownList2.DataBind()
                DropDownList2.Items.Insert(0, "Select Location")
            End If
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim typeCondition, cityCondition, priceCondition, stateCondition As String
        typeCondition = ""
        cityCondition = ""
        priceCondition = ""
        stateCondition = ""
        If DropDownList2.SelectedIndex > 0 Then
            typeCondition = "and a.country like '" + DropDownList2.SelectedValue + "%' "
        End If
        If DropDownList1.SelectedIndex > 0 Then
            cityCondition = "and a.city like '" + DropDownList1.SelectedValue + "%' "
        End If
        SqlDataSource1.SelectCommand = "SELECT a.Id,a.country,a.state,a.city,a.places,a.duration,a.discription,a.start_date,a.end_date,a.hotel_id,a.terms_condition,a.budget,a.food,a.vehicle_type,a.tour_type,a.schedule,(select top(1) img from imgmst b where b.pkg_id=a.Id ) as img FROM package_detail a where 1=1 " + typeCondition + cityCondition
        SqlDataSource1.DataBind()
        DataList1.DataBind()
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        MsgBox("Image button click")
    End Sub
End Class
