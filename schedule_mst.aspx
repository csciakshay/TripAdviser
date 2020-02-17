<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="schedule_mst.aspx.vb" Inherits="schedule_mst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>Schedule Master</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />
            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contentTemplate>
            <div class="row">
                <div class ="col-md-4">
                    <asp:Label ID="Label6" runat="server" Text="Sechedul Id"></asp:Label>
                </div>
                <div class ="col-md-4">
                    <div class="form-group">
                
                         <asp:DropDownList ID="idDropDownList" runat="server" class="form-control" AutoPostBack ="true" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="idDropDownList"></asp:RequiredFieldValidator>
                </div>
                    </div> 
                                 <div class ="col-md-4"></div>
                </div> 
            <hr />
            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Id"></asp:Label>
                         <asp:TextBox ID="txtid" runat="server" ReadOnly ="true" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtid"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                   <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Package Id"></asp:Label>
                         <asp:DropDownList ID="idDropDown" runat="server" class="form-control" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="idDropDown"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
               <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Day"></asp:Label>
                <asp:TextBox ID="txtday" runat="server" class="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtday"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


            <div class="row">
                <div class ="col-md-4">
                 <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Route"></asp:Label>
                <asp:TextBox ID="txtroute" runat="server" class="form-control" TextMode="MultiLine" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtroute"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4"><div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Night Hold"></asp:Label>
                <asp:TextBox ID="txtnighthold" runat="server" class="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtnighthold"></asp:RequiredFieldValidator>
                </div>  </div>
                 <div class ="col-md-4"></div>
        </div> 

</contentTemplate>
            </asp:UpdatePanel>
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
             <div class="form-group">
        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info py-3 px-5"/> 
                 &nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" Text="Update" class="btn btn-info py-3 px-5"/>
                 
                 </div>
                    </div>
                <div class ="col-md-4"></div>
        </div> 


           </div> 
        </section> 
</asp:Content>

