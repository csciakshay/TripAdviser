Imports System.Data.SqlClient
Imports System.Data
Imports System.Globalization
Imports System.Xml
Imports System.IO

Partial Class PackageDtl
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Dim da As New SqlDataAdapter()

    Dim adsource As PagedDataSource

    Dim pos, pos1 As Integer
    Dim dt As New Data.DataTable()
    Dim CurrentPage As Integer
    Dim pid As Integer
    Private Shared prevPage As String = String.Empty


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ClientScript.RegisterStartupScript(GetType(Page), "Javascript", "javascript:initialize();", True)
        con.Open()
        pid = 2
        'Query to get ImagesName and Description from database
        Dim command As New SqlCommand("SELECT img from imgmst", con)
        Dim da As New SqlDataAdapter(command)
        Dim dt As New DataTable()
        da.Fill(dt)
        Dim files As New List(Of ListItem)()
        For Each row As DataRow In dt.Rows
            ' dt = row.Item("img")
            files.Add(New ListItem(row.Item("img"), row.Item("img").ToString.Substring(2)))
        Next row
        con.Close()

        If Not IsPostBack Then
            Repeater1.DataSource = files
            Repeater1.DataBind()
            BindDataList()
            ViewState("PageCount") = 0
            prevPage = Request.UrlReferrer.ToString()
        End If
    End Sub
    Protected Sub BindDataList()
        con.Open()
        'Query to get ImagesName and Description from database
        Dim command As New SqlCommand("SELECT * from package_detail", con)
        Dim da As New SqlDataAdapter(command)
        Dim dt As New DataTable()
        da.Fill(dt)
        DataListPaging(dt)
        'dlImages.DataSource = dt
        'dlImages.DataBind()
        con.Close()

    End Sub
    Private Sub DataListPaging(dt As DataTable)

        'creating object of PagedDataSource;  


        Dim PD As PagedDataSource = New PagedDataSource()

        PD.DataSource = dt.DefaultView
        PD.PageSize = 5
        PD.AllowPaging = True
        PD.CurrentPageIndex = CurrentPage
        Button1.Enabled = Not PD.IsFirstPage
        Button2.Enabled = Not PD.IsFirstPage
        Button4.Enabled = Not PD.IsLastPage
        Button3.Enabled = Not PD.IsLastPage
        ViewState("TotalCount") = PD.PageCount
        EmpDataList.DataSource = PD
        EmpDataList.DataBind()
        ViewState("PagedDataSurce") = dt
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = 0
        dt = ViewState("PagedDataSurce")
        ' DataListPaging(dt)
        EmpDataList.DataSource = dt
        EmpDataList.DataBind()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = Integer.Parse(ViewState("PageCount"))
        CurrentPage -= 1
        ViewState("PageCount") = CurrentPage
        dt = ViewState("PagedDataSurce")
        DataListPaging(dt)

    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = Integer.Parse(ViewState("PageCount"))
        CurrentPage += 1
        ViewState("PageCount") = CurrentPage
        dt = ViewState("PagedDataSurce")
        DataListPaging(dt)
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = Integer.Parse(ViewState("TotalCount")) - 1
        dt = ViewState("PagedDataSurce")
        DataListPaging(dt)
    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim ci As CultureInfo = New CultureInfo("en-us")
        ' getting the total cost of the cart
        Dim cost As Decimal = CalculateTotalAmount()
        If cost = 0 Then
            Response.Redirect("~/home.aspx")
        End If

        Try
            Session("Amount") = cost.ToString(ci)

            ' creating a record about the payment request
            Dim request_id As String = CreatePaymentRequest(pid, cost)
            If request_id <> Nothing Then
                Session("request_id") = request_id.ToString
            Else
                Return
            End If

        Catch ex As Exception
            KBSoft.Carts.WriteFile("Error in ViewCart.ibPayPal_Click(): " + ex.Message)
            Response.Redirect("~/home.aspx")
        End Try

        Response.Redirect("~/PayPal.aspx")
    End Sub
    Protected Function CreatePaymentRequest(ByVal cart_id As String, ByVal cost As Decimal) As Integer

        Dim xmlFile As String = Server.MapPath("~/App_Data/PaymentRequests.xml")
        Dim doc As New XmlDocument()
        Dim ci As CultureInfo = New CultureInfo("en-us")

        Dim reader As XmlTextReader

        If File.Exists(xmlFile) Then
            reader = New XmlTextReader(xmlFile)
            reader.Read()
        Else
            KBSoft.Carts.CreateXml(xmlFile, "Requests")
            reader = New XmlTextReader(xmlFile)
            reader.Read()
        End If

        doc.Load(reader)
        reader.Close()

        ' getting a unique request identifier
        Dim nodes As XmlNodeList = doc.GetElementsByTagName("Request")
        Dim request_id As Integer
        If nodes.Count <> 0 Then
            request_id = KBSoft.Carts.GetIdentity(nodes, "request_id")
        Else
            request_id = 0
        End If

        ' creating a new element containing information about the payment request
        Dim myrequest As XmlElement = doc.CreateElement("Request")
        myrequest.SetAttribute("request_id", request_id)
        myrequest.SetAttribute("cart_id", cart_id)
        myrequest.SetAttribute("price", cost.ToString(ci))
        myrequest.SetAttribute("request_date", DateTime.Now.ToString(ci))
        doc.DocumentElement.AppendChild(myrequest)

        Try
            doc.Save(xmlFile)
        Catch ex As Exception
            KBSoft.Carts.WriteFile("Error in ViewCart.CreatePaymentRequest(): " + ex.Message)
            Return Nothing
        End Try

        Return request_id
    End Function
    ''' <summary>    
    ''' getting the total cost of goods in the cart
    ''' </summary>
    ''' <returns>the total cost of goods in the cart</returns>
    Protected Function CalculateTotalAmount() As Decimal
        Dim total As Decimal = 10
        Dim ci As CultureInfo = New CultureInfo("en-us")
        Try
            'For Each row As GridViewRow In Me.gvCarts.Rows
            '    Dim price As Decimal = Decimal.Parse(row.Cells(1).Text, ci)
            '    Dim quantity As Integer = Decimal.Parse(row.Cells(2).Text, ci)
            '    total = total + (price * quantity)
            'Next
            Return total
        Catch ex As Exception
            KBSoft.Carts.WriteFile("Error in ViewCart.CalculateTotalAmount(): Input string was not in a correct format")
            Return 0
        End Try
    End Function

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Response.Redirect(prevPage)
    End Sub
    Public Function ConvertDataTabletoString() As String
        Dim dt As New DataTable()
        'Using con As New SqlConnection("Data Source=(LocalDB)\v11.0;AttachDbFilename=G:\ASPNET\AddMarkerstoGoogleMapFromDatabase\App_Data\Database.mdf;Integrated Security=True")
        Using cmd As New SqlCommand("select title=City,lat=latitude,lng=longitude from citymst", con)
            con.Open()
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
            Dim rows As New List(Of Dictionary(Of String, Object))()
            Dim row As Dictionary(Of String, Object)
            For Each dr As DataRow In dt.Rows
                row = New Dictionary(Of String, Object)()
                For Each col As DataColumn In dt.Columns
                    row.Add(col.ColumnName, dr(col))
                Next
                rows.Add(row)
            Next
            Return serializer.Serialize(rows)
        End Using
        ' End Using
    End Function
End Class
