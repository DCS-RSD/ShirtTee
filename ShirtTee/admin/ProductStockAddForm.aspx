<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ProductStockAddForm.aspx.cs" Inherits="ShirtTee.admin.StockAddForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>
            <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
                <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Add Stock
                    </h2>
                    <asp:HyperLink ID="hypProduct" runat="server"
                        class="text-sm font-medium text-indigo-600 hover:text-indigo-500 hover:cursor-pointer hover:underline">
                    </asp:HyperLink>
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
                        <asp:DropDownList ID="ddlSize" CssClass="cInput" runat="server" DataSourceID="SqlDataSource1" DataTextField="size_name" DataValueField="size_ID" AutoPostBack="True" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Size]" />
                    </div>

                    <%--Color--%>

                    <div class="col-span-1">
                        <label for="ddlColor" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Color
                        </label>
                    </div>

                    <div class="col-span-3">
                        <asp:DropDownList ID="ddlColor" CssClass="cInput" runat="server" DataSourceID="SqlDataSource2" DataTextField="color_name" DataValueField="color_ID" />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * 
FROM Color
WHERE color_ID NOT IN 
(
SELECT color_ID 
FROM Product_Details 
WHERE product_ID = @product_ID
AND size_ID = @size_ID
)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="product_id" Name="product_ID"></asp:QueryStringParameter>
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

                    <div class="col-span-1">
                        <label for="txtQty" class="inline-block text-sm text-gray-800 mt-2.5 dark:text-gray-200">
                            Image
                        </label>
                    </div>

                    <div class="col-span-3">
                        <asp:Image class="my-2" ID="Image1" runat="server" ClientIDMode="Static" />
                        <asp:FileUpload class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                            onchange="loadFile(event)"
                            ID="fileImage" runat="server" />
                    </div>

                    <div class="col-start-3 col-span-2 sm:col-start-4 sm:col-span-1">
                        <div class="hs-tooltip flex items-center">
                            <asp:CheckBox ID="chkOnSales" runat="server" ClientIDMode="Static" />
                            <label for="chkOnSales" class="text-sm text-gray-500 ms-3 dark:text-gray-400">Activate Sales</label>
                            <div class="hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700" role="tooltip">
                                Start Selling This Product.
                            </div>
                        </div>
                    </div>


                    <div class="col-start-3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Confirm" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" OnClick="btnSubmit_Click"></asp:Button>
                    </div>
                    <div class="col-span-1">
                        <input type="reset" value="Reset" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <script>
        var loadFile = function (event) {
            var input = event.target;
            var file = input.files[0];
            var type = file.type;
            var output = document.getElementById('Image1');

            output.src = URL.createObjectURL(event.target.files[0]);

            output.onload = function () {
                URL.revokeObjectURL(output.src) // free memory
            }
            output.classList.add("w-24");
            output.classList.add("h-24");


        };


        var checkbox = document.getElementById('chkOnSales');
        checkbox.classList.add('hs-tooltip-toggle', 'relative', 'w-[3.25rem]', 'h-7', 'p-px', 'bg-gray-100', 'border-transparent', 'text-transparent', 'rounded-full', 'cursor-pointer', 'transition-colors', 'ease-in-out', 'duration-200', 'focus:ring-blue-600', 'disabled:opacity-50', 'disabled:pointer-events-none', 'checked:bg-none', 'checked:text-blue-600', 'checked:border-blue-600', 'focus:checked:border-blue-600', 'dark:bg-gray-800', 'dark:border-gray-700', 'dark:checked:bg-blue-500', 'dark:checked:border-blue-500', 'dark:focus:ring-offset-gray-600', 'before:inline-block', 'before:w-6', 'before:h-6', 'before:bg-white', 'checked:before:bg-blue-200', 'before:translate-x-0', 'checked:before:translate-x-full', 'before:rounded-full', 'before:shadow', 'before:transform', 'before:ring-0', 'before:transition', 'before:ease-in-out', 'before:duration-200', 'dark:before:bg-gray-400', 'dark:checked:before:bg-blue-200');
    </script>

</asp:Content>
