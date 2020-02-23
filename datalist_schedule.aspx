<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="datalist_schedule.aspx.vb" Inherits="datalist_schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            package_Id:
            <asp:Label ID="package_IdLabel" runat="server" Text='<%# Eval("package_Id") %>' />
            <br />
            day:
            <asp:Label ID="dayLabel" runat="server" Text='<%# Eval("day") %>' />
            <br />
            route:
            <asp:Label ID="routeLabel" runat="server" Text='<%# Eval("route") %>' />
            <br />
            Night_Hold:
            <asp:Label ID="Night_HoldLabel" runat="server" Text='<%# Eval("Night_Hold") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Databs %>" SelectCommand="SELECT * FROM [schedule_mst]"></asp:SqlDataSource>
</asp:Content>

