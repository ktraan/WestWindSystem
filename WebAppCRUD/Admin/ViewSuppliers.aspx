<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuppliers.aspx.cs" Inherits="WebAppCRUD.Admin.ViewSuppliers" %>

<%--Register Directive--%>
<%@ Register Src="~/UserControls/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>View Suppliers</h1>
    <uc1:MessageUserControl runat="server" ID="MessageUserControl" />


    <asp:ListView ID="SupplierListView" runat="server" ItemType="WestWindSystem.Entities.Supplier" DataSourceID="SuppliersDataSource" InsertItemPosition="FirstItem"
         DataKeyNames="SupplierID">
        <%--This will account for the supplierID and make count of it, works for GridView and ListView--%>
        <LayoutTemplate>
            <table class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Comapny</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Phone / Fax</th>
                    </tr>
                </thead>
                <tbody>
                    <tr runat="server" id="itemPlaceholder"></tr>
                </tbody>
            </table>
        </LayoutTemplate>
        <%--This will fill the table--%>
        <ItemTemplate>
            <tr>
                <td><asp:LinkButton ID="EditSupplier" runat="server" CssClass="btn btn-info glyphicon glyphicon-pencil" CommandName="Edit">Edit</asp:LinkButton>
                    <asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this supplier?')">Delete</asp:LinkButton>
                </td>
                <td><%# Item.CompanyName %></td>

                <td>
                    <%# Item.ContactName %>
                    &ndash;
                    <br />
                    <%# Item.ContactTitle %>
                    <br />
                    <%# Item.Email %>
                </td>

                <td>
                    <%# Item.Address.Address1 %>
                    <br />
                    <%# Item.Address.City %>
                    <%# Item.Address.Region %>
                    &nbsp;&nbsp;
                    <%# Item.Address.PostalCode %>
                    <br />
                    <%# Item.Address.Country %>

                </td>

                <td>
                    <%# Item.Phone %>
                    <br />
                    <%# Item.Fax %>

                </td>
            </tr>
        </ItemTemplate>

        <InsertItemTemplate>
            <tr class="bg-info">
                <th>
                    <asp:LinkButton ID="AddSupplier" runat="server" CommandName="Insert" CssClass="btn btn-success glyphicon glyphicon-plus">Add</asp:LinkButton>
                    <asp:LinkButton ID="CancelInsert" runat="server" CssClass="btn btn-default" CommandName="Cancel">Clear</asp:LinkButton>
                </th>
                <th><asp:TextBox ID="CompanyName" runat="server" Text="<%# BindItem.CompanyName %>" placeholder="Enter company name" /></th>
                <th>
                    <asp:TextBox ID="Contact" runat="server" Text="<%# BindItem.ContactName %>" placeholder="Contact name" />
                    <br />
                    <asp:TextBox ID="JobTitle" runat="server" Text="<%# BindItem.ContactTitle %>" placeholder="Job title" />
                    <br />
                    <asp:TextBox ID="Email" runat="server" Text="<%# BindItem.Email %>" TextMode="Email" placeholder="Email" />
                </th>
                <th>
                    <asp:DropDownList ID="AddressDropDown" runat="server" AppendDataBoundItems="true" DataSourceID="AddressDataSource1" DataTextField="Address1" DataValueField="AddressID" SelectedValue="<%# BindItem.AddressID %>">
                        <asp:ListItem Value="">[Select Address on file]</asp:ListItem>
                    </asp:DropDownList>
                    
                </th>
                <th>
                    <asp:TextBox ID="Phone" runat="server" Text="<%# BindItem.Phone %>" placeholder="Phone #" />
                    <asp:TextBox ID="Fax" runat="server" Text="<%# BindItem.Fax %>" placeholder="Fax" />
                </th>

        </InsertItemTemplate>

        <EditItemTemplate>
            <tr class="bg-success">
                <th>
                    <asp:LinkButton ID="UpdateSupplier" runat="server" CommandName="Update" CssClass="btn btn-success glyphicon glyphicon-ok">Save</asp:LinkButton>
                    <asp:LinkButton ID="Cancel" runat="server" CssClass="btn btn-default" CommandName="Cancel">Cancel</asp:LinkButton>
                </th>
                <th><asp:TextBox ID="CompanyName" runat="server" Text="<%# BindItem.CompanyName %>" placeholder="Enter company name" /></th>
                <th>
                    <asp:TextBox ID="Contact" runat="server" Text="<%# BindItem.ContactName %>" placeholder="Contact name" />
                    <br />
                    <asp:TextBox ID="JobTitle" runat="server" Text="<%# BindItem.ContactTitle %>" placeholder="Job title" />
                    <br />
                    <asp:TextBox ID="Email" runat="server" Text="<%# BindItem.Email %>" TextMode="Email" placeholder="Email" />
                </th>
                <th>
                    <asp:DropDownList ID="AddressDropDown" runat="server" AppendDataBoundItems="true" DataSourceID="AddressDataSource1" DataTextField="Address1" DataValueField="AddressID" SelectedValue="<%# BindItem.AddressID %>">
                        <asp:ListItem Value="">[Select Address on file]</asp:ListItem>
                    </asp:DropDownList>
                    
                </th>
                <th>
                    <asp:TextBox ID="Phone" runat="server" Text="<%# BindItem.Phone %>" placeholder="Phone #" />
                    <asp:TextBox ID="Fax" runat="server" Text="<%# BindItem.Fax %>" placeholder="Fax" />
                </th>

        </EditItemTemplate>
    </asp:ListView>


    <%--   Repeater example
    <asp:Repeater ID="SupplierRepeater" runat="server">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
               <b> <%# Item.CompanyName %> </b>
                &ndash;
                <%# Item.ContactTitle %>
                &mdash;
                <a href="mailto:<%# Item.ContactName %>">
                <%# Item.Email %></a>
                (<%# Item.Phone %>)
            </li>
        </ItemTemplate>
        <SeparatorTemplate><hr /></SeparatorTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>--%>

    <asp:ObjectDataSource ID="SuppliersDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListSuppliers"
        TypeName="WestWindSystem.BLL.CRUDController" DataObjectTypeName="WestWindSystem.Entities.Supplier" InsertMethod="AddSupllier"
        OnInserted="CheckForExceptions" OnUpdated="CheckForExceptions" OnDeleted="CheckForExceptions"
        UpdateMethod="UpdateSupplier" DeleteMethod="DeleteSupplier"></asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" ID="AddressDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAddressses" 
        TypeName="WestWindSystem.BLL.CRUDController"></asp:ObjectDataSource>
</asp:Content>
