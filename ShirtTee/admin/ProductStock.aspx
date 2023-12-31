<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="ProductStock.aspx.cs" Inherits="ShirtTee.admin.ProductStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Toast --%>
    <script>

        function showSuccessToast() {
            var status = '<%= Session["StockAdded"] %>'; // Enclose the session variable in quotes
            console.log(status)
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Product added successfully.");
                } else {
                    toastr["error"]("Something went wrong.");
                }
            }
            <% Session.Remove("StockAdded"); %>
        }

        function showUpdateSuccessToast() {
            var status = '<%= Session["StockUpdated"] %>'; // Enclose the session variable in quotes
            console.log(status)
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Stock updated successfully.");
                } else {
                    toastr["error"]("Something went wrong.");
                }
            }
            <% Session.Remove("StockUpdated"); %>
        }
    </script>
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
                <%--Stock--%>
                <div class=" sm:flex sm:items-center">
                    <div class="sm:flex-auto">
                        <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">Stock List
                        </h2>
                        <asp:HyperLink ID="hypProduct" runat="server"
                            class="text-sm font-medium text-indigo-600 hover:text-indigo-500 hover:cursor-pointer hover:underline">
                        </asp:HyperLink>
                    </div>
                    <div class="mt-4 sm:mt-0 sm:ml-16 sm:flex-none">
                        <asp:HyperLink
                            ID="hypAddStock"
                            runat="server" class="justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700  dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                                    Add Stock
                        </asp:HyperLink>
                    </div>
                </div>

                <!-- Header -->
                <div class=" pt-8 pb-4 grid gap-3 md:flex md:justify-end border-b border-gray-200 dark:border-gray-700">
                    <%--Title--%>



                    <div class="">
                        <div class="flex justify-end gap-x-2">
                            <asp:DropDownList runat="server" ID="ddlColor" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged"
                                AppendDataBoundItems="true"
                                class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="color_name" DataValueField="color_ID">
                                <asp:ListItem Text="All Color" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [color_ID], [color_name] FROM [Color]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="">
                        <div class="flex justify-end gap-x-2">
                            <asp:DropDownList runat="server" ID="ddlSize" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged"
                                AppendDataBoundItems="true"
                                class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="size_name" DataValueField="size_ID">
                                <asp:ListItem Text="All Size" Value="" />
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Size]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <!-- End Header -->

                <!-- Table -->

                <div class="shadow ring-1 ring-black ring-opacity-5 md:rounded-lg">
                    <table class="table-auto min-w-full divide-y divide-gray-200 dark:divide-gray-700 ">
                        <thead class="bg-gray-50 dark:bg-slate-800">
                            <tr>

                                <th scope="col" class="px-6 py-3 text-start">
                                    <div class="flex items-center gap-x-2">
                                        <span class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200">Size
                                        </span>
                                    </div>
                                </th>

                                <th scope="col" class="px-6 py-3 text-start">
                                    <div class="flex items-center gap-x-2">
                                        <span class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200">Color
                                        </span>
                                    </div>
                                </th>

                                <th scope="col" class="px-6 py-3 text-start">
                                    <div class="flex items-center gap-x-2">
                                        <span class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200">Quantity
                                        </span>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Product.product_ID,Product.product_name, Product_Details.product_details_ID, Color.color_name, Size.size_name, Product_Details.stock_available, on_sale,image
FROM Product_Details 
INNER JOIN Product ON Product.product_ID = Product_Details.product_ID 
INNER JOIN Color ON Product_Details.color_ID = Color.color_ID 
INNER JOIN Size ON Product_Details.size_ID = Size.size_ID 
WHERE (Product.product_ID = @product_ID)">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="product_id" Name="product_ID" DefaultValue=""></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                            <asp:ListView DataSourceID="SqlDataSource2" ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                                <ItemTemplate>

                                    <tr class="bg-white hover:bg-gray-50 dark:bg-slate-900 dark:hover:bg-slate-800"
                                        data-hs-overlay='<%# "#hs-modal-stock-details" + Eval("product_details_ID") %>'>
                                        <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                            <%# Eval("size_name") %>
                                            <%# ((bool)Eval("on_sale")) ? "" :
                                     "<div class='hs-tooltip inline-block'>" +
                                    "<span class='py-1 px-2 inline-flex items-center gap-x-1 text-xs bg-gray-100 text-gray-800 rounded-full dark:bg-slate-500/20 dark:text-slate-400'>" +
                                    "  <svg class='flex-shrink-0 w-3 h-3' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'>" +
                                    "    <path d='M18.36 6.64a9 9 0 1 1-12.73 0' />" +
                                    "    <line x1='12' x2='12' y1='2' y2='12' />" +
                                    "  </svg>" +
                                    "   Disabled" +
                                    "</span>"+
                                    "<div class='hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700' role='tooltip'>  "+
                                    "This Stock Is Not Ready For Sales. </div>"+
                                    "</div>" %>
                                        </td>
                                        <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                            <span class="inline-flex items-center gap-x-1.5 py-1.5 px-3 rounded-full text-xs font-medium border border-gray-200 bg-white text-gray-800 shadow-sm dark:bg-slate-900 dark:border-gray-700 dark:text-white">
                                                <%# Eval("color_name") %>
                                            </span>
                                        </td>
                                        <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                            <%#Eval("stock_available") %>
                                        </td>
                                    </tr>
                                    <div id='<%# "hs-modal-stock-details" + Eval("product_details_ID") %>' class="hs-overlay hidden w-full h-full fixed top-0 start-0 z-[61] overflow-x-hidden overflow-y-auto">
                                        <div class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto">
                                            <div class="bg-white border border-gray-200 rounded-xl shadow-sm dark:bg-gray-800 dark:border-gray-700">
                                                <div class="p-4 sm:p-7">
                                                    <div class="text-center">
                                                        <h2 class="block text-2xl font-bold text-gray-800 dark:text-gray-200">Update Stock
                                                        </h2>
                                                        <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                                                            <%# Eval("product_name") %>
                                                        </p>
                                                        <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                                                            <%# Eval("size_name") %> | <%# Eval("color_name") %>
                                                        </p>
                                                    </div>
                                                    <div class="mt-5">
                                                        <div class="grid gap-y-4">
                                                            <!-- Form Group -->
                                                            <div>
                                                                <label class="block text-sm mb-2 dark:text-white">Stock Quantity</label>
                                                                <div class="relative">
                                                                    <asp:TextBox runat="server" ID="txtQty" Text='<%# Eval("stock_available") %>'
                                                                        class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" />
                                                                </div>
                                                            </div>
                                                            <!-- End Form Group -->

                                                            <div>
                                                                <label class="block text-sm mb-2 dark:text-white">Image</label>
                                                                <div class="relative">
                                                                    <asp:Image class="my-2 w-24 h-24" ID="imagePreview" runat="server"
                                                                        ImageUrl='<%# Eval("image") ==DBNull.Value?"": "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("image")) %>' />
                                                                    <asp:FileUpload
                                                                        class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                                                                        onchange='<%# "loadFile(event,"+Container.DataItemIndex+")" %>'
                                                                        ID="fileImage" runat="server" />
                                                                </div>
                                                            </div>
                                                            <!-- End Form Group -->
                                                            <div class="hs-tooltip flex items-center justify-end mt-4 mr-4">
                                                                <asp:CheckBox ID="chkOnSales" runat="server"
                                                                    Checked='<%# Eval("on_sale") %>' />
                                                                <label for="chkOnSales" class="text-sm text-gray-500 ms-3 dark:text-gray-400">Activate Sales</label>
                                                                <div class="hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700" role="tooltip">
                                                                    Start Selling This Product.
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="mt-5">
                                                            <div class="grid gap-y-4">
                                                                <div class="flex justify-end items-center gap-x-2 py-3 px-2">
                                                                    <asp:Button runat="server"
                                                                        Text="Save Changes"
                                                                        ID="btnUpdateStock" CommandName="updateStock"
                                                                        CommandArgument='<%# string.Format("{0}|{1}", Container.DisplayIndex,Eval("product_details_ID") ) %>'
                                                                        class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                                                    <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                                                        data-hs-overlay='<%# "#hs-modal-stock-details" + Eval("product_details_ID") %>'>
                                                                        Close
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>


                </div>

                <!-- End Table -->

            </asp:Panel>
        </div>
    </div>
    <script>
        var loadFile = function (event, previewId) {
            var input = event.target;
            var file = input.files[0];
            var type = file.type;
            var output = document.getElementById("ContentPlaceHolder1_ListView1_imagePreview_" + previewId);

            if (output) {
                output.src = URL.createObjectURL(event.target.files[0]);

                output.onload = function () {
                    URL.revokeObjectURL(output.src); // free memory
                };
            }
        };

        var checkboxes = document.querySelectorAll('[id*="chkOnSales"]');
        checkboxes.forEach(function (checkbox) {
            console.log(checkbox);
            checkbox.classList.add(
                'hs-tooltip-toggle', 'relative', 'w-[3.25rem]', 'h-7', 'p-px', 'bg-gray-100',
                'border-transparent', 'text-transparent', 'rounded-full', 'cursor-pointer',
                'transition-colors', 'ease-in-out', 'duration-200', 'focus:ring-blue-600',
                'disabled:opacity-50', 'disabled:pointer-events-none', 'checked:bg-none',
                'checked:text-blue-600', 'checked:border-blue-600', 'focus:checked:border-blue-600',
                'dark:bg-gray-800', 'dark:border-gray-700', 'dark:checked:bg-blue-500',
                'dark:checked:border-blue-500', 'dark:focus:ring-offset-gray-600', 'before:inline-block',
                'before:w-6', 'before:h-6', 'before:bg-white', 'checked:before:bg-blue-200',
                'before:translate-x-0', 'checked:before:translate-x-full', 'before:rounded-full',
                'before:shadow', 'before:transform', 'before:ring-0', 'before:transition',
                'before:ease-in-out', 'before:duration-200', 'dark:before:bg-gray-400',
                'dark:checked:before:bg-blue-200'
            );
        });
    </script>
</asp:Content>
