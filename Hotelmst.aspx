<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Hotelmst.aspx.vb" Inherits="Hotelmst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>Hotel Registration</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />


            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text=" Enter Hotel Name"></asp:Label>
                <asp:TextBox ID="txtnm" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtnm"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label>
                <asp:TextBox ID="txtadrss" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtadrss"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Country"></asp:Label>
                    <asp:DropDownList ID="country" runat="server" class="form-control">                      
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="country"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="State"></asp:Label>
                         <asp:DropDownList ID="state" runat="server" class="form-control" >
                             
                         </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="state"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>
                      <asp:DropDownList ID="city" runat="server" class="form-control">
                      </asp:DropDownList>     
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="city"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="Check In"></asp:Label>
                <asp:TextBox ID="txtcheckin" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtcheckin"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


            <div class="row">
                <div class ="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="Check Out"></asp:Label>
                <asp:TextBox ID="txtcheckout" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtcheckout"></asp:RequiredFieldValidator>
                </div>
                </div>
                <div class ="col-md-4">
                  <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Rooms"></asp:Label>
                <asp:TextBox ID="txtroom" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtroom"></asp:RequiredFieldValidator>
                </div>  
                </div>
                <div class ="col-md-4">
                <div class="form-group">
                <asp:Label ID="Label9" runat="server" Text="Rate"></asp:Label>
                <asp:TextBox ID="txtrate" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtrate"></asp:RequiredFieldValidator>
                </div>  
            </div>
                </div>


            <div class="row">
                
                <div class="col-md-4">
                     <div class="form-group">
                <asp:Label ID="Label10" runat="server" Text="Facility"></asp:Label>
                         <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                             <asp:ListItem>Free wifi</asp:ListItem>
                             <asp:ListItem>Break Fast </asp:ListItem>
                             <asp:ListItem>Meal</asp:ListItem>
                             <asp:ListItem>Gym</asp:ListItem>
                             <asp:ListItem>Game Zone</asp:ListItem>
                             <asp:ListItem>Simming Pool</asp:ListItem>
                         </asp:CheckBoxList>
                </div>
                </div>
                <div class ="col-md-4">
                    <asp:FileUpload ID="FileUpload1" runat="server" /></div>
                <div class ="col-md-4"></div>
                </div>


             <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
             <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary py-3 px-5"/>
                 <div class ="col-md-4"></div>
                 </div>
                    </div>
        </div> 
        </div> 
        </section> 
</asp:Content>

