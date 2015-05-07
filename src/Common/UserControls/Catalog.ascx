<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Catalog.ascx.cs" Inherits="Common_UserControls_Catalog" %>
<div>
    <table>
        <tr>
            <td>
<asp:DropDownList ID="ddlFirstCategory" runat="server" AutoPostBack="True" 
                CssClass="CategorySelection" DataSourceID="odsCategory" DataTextField="NameUy" 
                DataValueField="ID" ondatabound="ddlFirstCategory_DataBound" 
                onselectedindexchanged="ddlFirstCategory_SelectedIndexChanged"></asp:DropDownList>
            
            <asp:ObjectDataSource ID="odsCategory" runat="server" 
                SelectMethod="getFirstCategories" 
                TypeName="net.UyghurDev.Library.CategoryHelper"></asp:ObjectDataSource>
            
            </td>
             <td>
<asp:DropDownList ID="ddlSecondCategory" runat="server" AutoPostBack="True" 
                CssClass="CategorySelection" DataSourceID="odsSecondCategory" 
                DataTextField="NameUy" DataValueField="ID" 
                ondatabound="ddlSecondCategory_DataBound" 
                onselectedindexchanged="ddlSecondCategory_SelectedIndexChanged"></asp:DropDownList>
           
            <asp:ObjectDataSource ID="odsSecondCategory" runat="server" 
                SelectMethod="getSecondCategories" 
                TypeName="net.UyghurDev.Library.CategoryHelper">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlFirstCategory" DefaultValue="0" 
                        Name="FirstCategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </td>
             <td>
<asp:DropDownList ID="ddlThirdCategory" runat="server" CssClass="CategorySelection" 
                DataSourceID="odsThirdCategory" DataTextField="NameEn" DataValueField="ID" 
                onselectedindexchanged="ddlThirdCategory_SelectedIndexChanged" 
                AutoPostBack="True" ondatabound="ddlThirdCategory_DataBound"></asp:DropDownList>
            <asp:ObjectDataSource ID="odsThirdCategory" runat="server" 
                SelectMethod="getThirdCategories" 
                TypeName="net.UyghurDev.Library.CategoryHelper">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlSecondCategory" DefaultValue="0" 
                        Name="SecondCategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
        
      
        
           
      
        
    

</div>