<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="home2.aspx.vb" Inherits="home2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
        	    <h3>Find your best Hotels...</h3>
                <div class="col-md-10">
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" 
                        DataSourceID="SqlDataSource3" ForeColor="#333333" RepeatDirection ="Horizontal" RepeatColumns ="3">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#E3EAEB" />
                        <ItemTemplate>
                            <b>Hotel Name:</b>
                            <asp:Label ID="HotelnmLabel" runat="server" Text='<%# Eval("Hotelnm") %>' />
                            <br />
                            <b>Address:</b>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                            <br />
                            <b>Country:</b>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                            <br />
                            <b>State:</b>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                            <br />
                            <b>City:</b>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                            <br />
                            <b>Check_in:</b>
                            <asp:Label ID="Check_inLabel" runat="server" Text='<%# Eval("Check_in") %>' />
                            <br />
                            <b>Check_out:</b>
                            <asp:Label ID="Check_outLabel" runat="server" Text='<%# Eval("Check_out") %>' />
                            <br />
                            <b>Facility:</b>
                            <asp:Label ID="FacilityLabel" runat="server" Text='<%# Eval("Facility") %>' />
                            <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-info" />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Databs %>" 
                        SelectCommand="SELECT [Hotelnm], [Address], [Country], [State], [City], [Check_in], [Check_out], [Facility] FROM [hotelmst]">
                    </asp:SqlDataSource>
                </div>
                <div class="col-md-2">
                    <h3 class="heading mb-4">Find City</h3>
                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" 
                        DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Databs %>" 
                        SelectCommand="SELECT * FROM [citymst]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"
                        DataSourceID="SqlDataSource2" DataTextField="state" DataValueField="state">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:Databs %>"
                        SelectCommand="SELECT * FROM [statemst]"></asp:SqlDataSource>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeHolder="From Date"></asp:TextBox>
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeHolder="To Date"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Search" class="btn btn-info"/>
                </div>
                
             </div>
        </div> 
    </section> 
</asp:Content>

