<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="registrationpg.aspx.vb" Inherits="registrationpg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section class="ftco-section contact-section ftco-degree-bg">
    	<div class="container">
            <div class="row">
                <div class ="col-md-4"></div>
                <div class ="col-md-4">
                    <h1>Registration</h1>
                </div>
                <div class ="col-md-4"></div>
            </div>
            <br />
           <div class="row">
              <div class="col-md-4 ">   
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
                </div>
             </div>
             <div class="col-md-4 ">
                <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label><br />
                <asp:RadioButton ID="rbMale" runat="server"  GroupName="gender" Text="Male" Checked="true"  /> 
                <asp:RadioButton ID="rbFemale" runat="server" GroupName="gender" Text="Female"/>
              </div>
              <div class="col-md-4 ">   
                 <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 ">
        <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="txtCity" runat="server" class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                    </div>
                <div class="col-md-4 ">
        <asp:Label ID="Label5" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="txtState" runat="server" class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtState"></asp:RequiredFieldValidator>
                    </div>
                <div class="col-md-4 ">
         <asp:Label ID="Label6" runat="server" Text="Country"></asp:Label>
        <asp:TextBox ID="txtCountry" runat="server" class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtCountry"></asp:RequiredFieldValidator>
   </div>
                </div>
            <div class="row">
                 <div class="col-md-4 ">
        <asp:Label ID="Label7" runat="server" Text="Contact No" ></asp:Label></>
        <asp:TextBox ID="txtContactNo" runat="server" class="form-control"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtContactNo"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Valid Expression" ValidationExpression="^([0-9]{10})$" ControlToValidate="txtContactNo"></asp:RegularExpressionValidator>
                     </div>
                 <div class="col-md-4 ">
        <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label></>
        <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Valid Email Id" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                     </div>
 <div class="col-md-4 ">    
        <asp:Label ID="Label9" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
     </div>
                </div>
            <div class="row">
                 <div class="col-md-4 ">
        <asp:Label ID="Label10" runat="server" Text="ReEnter Password"></asp:Label>
        <asp:TextBox ID="txtPasswordRe" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Valid Expression" ControlToCompare="txtPassword" ControlToValidate="txtPasswordRe"></asp:CompareValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                 </div>
     <div class="col-md-4 ">
        <asp:Label ID="Label11" runat="server" Text="Upload Photo"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" /> 
        </div>
                 <div class="col-md-4 ">
        
   
   </div>
   </div><br />
             
            <div class="row block-9">
                <div class="col-md-3"></div>
                <div class="col-md-7">
                    <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary py-3 px-5"/>
        <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-primary py-3 px-5"/>
   </div>
                </div>
                <div class="col-md-2"></div>
            </div>

            </div>
     </section>
    
    
    
    
</asp:Content>

