<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ProductStockAddForm.aspx.cs" Inherits="ShirtTee.admin.StockAddForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <div class="mb-8">
                <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Product
                </h2>
                <p class="text-sm text-gray-600 dark:text-gray-400">
                    Add stock to this product.
                </p>
            </div>
            <%--End Title--%>

            <div class="grid grid-cols-4 gap-6">


                <%--Size--%>

                <div class="col-span-1">
                    <label for="ddlSize" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Size
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:DropDownList ID="ddlSize" CssClass="cInput" runat="server" DataSourceID="SqlDataSource1" DataTextField="size_name" DataValueField="size_ID" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Size]" />
                </div>

                <%--Color--%>

                <div class="col-span-1">
                    <label for="ddlColor" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Color
                    </label>
                </div>

                <div class="col-span-3">
                    <asp:DropDownList ID="ddlColor" CssClass="cInput" runat="server" DataSourceID="SqlDataSource2" DataTextField="color_name" DataValueField="color_ID"/>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * 
FROM Color
WHERE color_ID NOT IN 
(
SELECT s.color_ID 
FROM Product_Details AS s
INNER JOIN Color AS c 
ON c.color_ID = s.color_ID
WHERE size_ID = @size_ID
)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSize" PropertyName="SelectedValue" Name="size_ID"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>

                <%--Quantity--%>

                <div class="col-span-1">
                    <label for="txtQty" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                        Stock Quantity
                    </label>
                </div>

                <div class="col-span-3">
                    <div class="flex">
                        <asp:TextBox ID="txtQty" runat="server"
                            placeholder="Enter stock quantity"
                            class="cInput" TextMode="Number">
                        </asp:TextBox>
                    </div>

                </div>



                <div class="col-start-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                </div>
                <div class="col-span-1">
                    <input type="reset" value="Reset" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
