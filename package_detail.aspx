<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="package_detail.aspx.vb" Inherits="package_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" type="text/css" href="/datetime/css/foopicker.css"/>
  <script type="text/javascript" src="/datetime/js/foopicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>Package Details</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />
            
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contentTemplate>
            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Package Id"></asp:Label>
                <asp:TextBox ID="txtid" runat="server" class="form-control" ReadOnly ="true" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtid"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Start_Date"></asp:Label>
                <asp:TextBox ID="txtstart_date" runat="server" class="form-control" ClientIDMode="Static" AutoPostBack ="true" ></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtstart_date"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="End_Date"></asp:Label>
                <asp:TextBox ID="txtend_date" runat="server" class="form-control"  AutoPostBack ="true" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtend_date"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>

             
            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Country"></asp:Label>
                         <asp:DropDownList ID="countrydropdown" runat="server" AutoPostBack ="true" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="countrydropdown"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="State"></asp:Label>
                      <asp:DropDownList ID="statedropdown" runat="server" AutoPostBack ="true" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="statedropdown"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="City"></asp:Label>
                    <asp:DropDownList ID="citydropdown" runat="server" AutoPostBack ="true" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="citydropdown"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="Hotel_Id"></asp:Label>
                         <asp:DropDownList ID="iddropdown" runat="server" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="iddropdown"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Duration"></asp:Label>
                <asp:TextBox ID="txtduration" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtduration"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label9" runat="server" Text="Budget"></asp:Label>
                <asp:TextBox ID="txtbudget" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtbudget"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>
            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label10" runat="server" Text="Food"></asp:Label>
                         <asp:CheckBoxList ID="foodCheckBox" runat="server">
                             <asp:ListItem>Veg</asp:ListItem>
                              <asp:ListItem>Non-Veg</asp:ListItem>
                         </asp:CheckBoxList>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label11" runat="server" Text="Vehicle_Type"></asp:Label>
                      <asp:CheckBoxList ID="vehicleCheckBox" runat="server"> 
                           <asp:ListItem Text="3X2 Non AC Bus" Value ="3X2NABUS"></asp:ListItem>
                          <asp:ListItem Text="2X2 Non AC Bus" Value ="2X2NABUS"></asp:ListItem>
                          <asp:ListItem Text="3X2 AC Bus" Value ="3X2ABUS"></asp:ListItem>
                          <asp:ListItem Text="5 Sitter AC Car" Value ="5ACAR "></asp:ListItem>
                          <asp:ListItem Text="5 Sitter Non AC Car" Value ="5NACAR"></asp:ListItem>
                          <asp:ListItem Text="7 Sitter AC Car" Value ="7ACAR"></asp:ListItem>
                          <asp:ListItem Text="7 Sitter Non AC Car" Value ="7NACAR"></asp:ListItem>
                      </asp:CheckBoxList>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label12" runat="server" Text="Tour_Type"></asp:Label>
                    <asp:DropDownList ID="tourdropdown" runat="server" class="form-control">
                         <asp:ListItem>Selec Tour</asp:ListItem>
                        <asp:ListItem>Family Tour</asp:ListItem>
                        <asp:ListItem>Couple Tour</asp:ListItem>
                        <asp:ListItem>Group Tour</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="tourdropdown"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label13" runat="server" Text="Discription"></asp:Label>
                <asp:TextBox ID="txtdiscription" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtdiscription"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label14" runat="server" Text="Terms & Condition"></asp:Label>
                <asp:TextBox ID="txtterms" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="txtterms"></asp:RequiredFieldValidator>
                </div>  
                </div>
                 <div class ="col-md-4">
                  <div class="form-group">
                      <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                </div>  
                </div>
                </div>

            
             <div class="row">
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label15" runat="server" Text="Schedule"></asp:Label>
                <asp:TextBox ID="txtschedule" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="txtschedule"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4"> <asp:Label ID="Label16" runat="server" Text="Places"></asp:Label>
                <asp:TextBox ID="txtplace" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtplace"></asp:RequiredFieldValidator></div>
                 <div class ="col-md-4"></div>
                  </div>  
        
</contentTemplate>
            </asp:UpdatePanel>

             <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
             <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-info py-3 px-5"/> 
                 &nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Update" class="btn btn-info py-3 px-5"/>
                 <div class ="col-md-4"></div>
                 </div>
                    </div>
        </div> 



       </div>
<script type="text/javascript">
    var foopicker = new FooPicker({
        id: 'txtstart_date',
        dateFormat: 'dd/MM/yyyy'
    });
    var foopicker2 = new FooPicker({
        id: 'txtend_date',
        dateFormat: 'dd/MM/yyyy'
    });
  </script>

    </div> 
     </section> 
        
</asp:Content>

