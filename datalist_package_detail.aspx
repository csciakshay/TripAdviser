<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="datalist_package_detail.aspx.vb" Inherits="datalist_package_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="3" >
        <ItemTemplate>
            Image:
            
            <asp:Image ID="Image1" runat="server" ImageUrl ='<%# Eval("img") %>' Height ="40" Width="40"/>
            <br />
            
            country:
            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
            <br />
            state:
            <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("state") %>' />
            <br />
            city:
            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
            <br />
            places:
            <asp:Label ID="placesLabel" runat="server" Text='<%# Eval("places") %>' />
            <br />
            duration:
            <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
            <br />
            
            
            
            
            tour_type:
            <asp:Label ID="tour_typeLabel" runat="server" Text='<%# Eval("tour_type") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Databs %>" SelectCommand="SELECT a.Id,a.country,a.state,a.city,a.places,a.duration,a.discription,a.start_date,a.end_date,a.hotel_id,a.terms_condition,a.budget,a.food,a.vehicle_type,a.tour_type,a.schedule,b.img FROM package_detail a LEFT JOIN imgmst b on a.Id= b.pkg_id "></asp:SqlDataSource>
</asp:Content>

