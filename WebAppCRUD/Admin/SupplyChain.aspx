<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SupplyChain.aspx.cs" Inherits="WebAppCRUD.Admin.SupplyChain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Active Suppliers</h1>


    <asp:Repeater ID="SupplierSUmmaryRepeater" runat="server" DataSourceID="SupplierSummaryDataSource" ItemType="WestWindSystem.ReadModels.SupplierSummary">
        <ItemTemplate>
            <div>
                <%# Item.Company %>

                <asp:Repeater ID="ProductRepeater" runat="server" DataSource="<%# Item.Products %>" ItemType="WestWindSystem.ReadModels.SupplierProduct">
                    <ItemTemplate>
                        <div>
                            <blockquote>
                            <%# Item.Name %>
                            </blockquote>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ItemTemplate>
    </asp:Repeater >
    

    <asp:ObjectDataSource runat="server" ID="SupplierSummaryDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSupplierSummaries" TypeName="WestWindSystem.BLL.SupplyChainManagement"></asp:ObjectDataSource>

</asp:Content>
