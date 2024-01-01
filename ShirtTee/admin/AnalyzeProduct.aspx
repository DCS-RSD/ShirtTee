<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="AnalyzeProduct.aspx.cs" Inherits="ShirtTee.admin.AnalyzeProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Table Section -->
    <div class="max-w-[85rem] mx-auto">
        <!-- Card -->
        <asp:Panel ID="panelContent" runat="server">
            <div class="flex flex-col">
                <div class="-m-1.5 overflow-x-auto">
                    <div class="p-1.5 min-w-full inline-block align-middle">
                        <div class="bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden dark:bg-slate-900 dark:border-gray-700">
                            <div class="mt-8 mb-4 mx-8 sm:flex sm:items-center">
                                <div class="sm:flex-auto">
                                    <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Product Performance Report
                                    </h1>
                                </div>
                                <div class="sm:self-end">
                                    <p class="text-sm text-gray-500 dark:text-gray-200">
                                        Generated at: <%= DateTime.Now.ToString() %>
                                    </p>
                                </div>
                            </div>

                            <!-- Header -->
                            <div class="px-6 py-4 grid gap-3 md:flex md:justify-end md:items-center border-b border-gray-200 dark:border-gray-700">
                                <div class="">
                                    <div class="flex justify-start gap-x-2">
                                        <div class="hs-dropdown relative inline-block [--placement:bottom-right]">
                                            <button id="hs-as-table-table-export-dropdown" type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                                                <svg class="flex-shrink-0 w-3 h-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z" />
                                                    <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
                                                </svg>
                                                Export
                                            </button>
                                            <div class="hs-dropdown-menu transition-[opacity,margin] duration hs-dropdown-open:opacity-100 opacity-0 hidden mt-2 divide-y divide-gray-200 min-w-[12rem] z-10 bg-white shadow-md rounded-lg p-2 mt-2 dark:divide-gray-700 dark:bg-gray-800 dark:border dark:border-gray-700" aria-labelledby="hs-as-table-table-export-dropdown">
                                                <div class="py-2 first:pt-0 last:pb-0">
                                                    <span class="block py-2 px-3 text-xs font-medium uppercase text-gray-400 dark:text-gray-600">Options
                                                    </span>
                                                    <div class="flex items-center gap-x-3 py-2 px-3 rounded-lg text-sm text-gray-800 hover:bg-gray-100 focus:ring-2 focus:ring-blue-500 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                                                        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                                            <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                                                            <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
                                                        </svg>
                                                        <asp:Button
                                                            class="w-full text-left cursor-pointer"
                                                            UseSubmitBehavior="false"
                                                            Text="Print"
                                                            ID="btnPrint"
                                                            OnClick="btnPrint_Click"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                                <div class="py-2 first:pt-0 last:pb-0">
                                                    <span class="block py-2 px-3 text-xs font-medium uppercase text-gray-400 dark:text-gray-600">Download options
                                                    </span>
                                                    <div class="flex items-center gap-x-3 py-2 px-3 rounded-lg text-sm text-gray-800 hover:bg-gray-100 focus:ring-2 focus:ring-blue-500 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" href="#">
                                                        <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                                            <path d="M5.884 6.68a.5.5 0 1 0-.768.64L7.349 10l-2.233 2.68a.5.5 0 0 0 .768.64L8 10.781l2.116 2.54a.5.5 0 0 0 .768-.641L8.651 10l2.233-2.68a.5.5 0 0 0-.768-.64L8 9.219l-2.116-2.54z" />
                                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
                                                        </svg>
                                                        <asp:Button
                                                            class="w-full text-left cursor-pointer"
                                                            UseSubmitBehavior="false"
                                                            Text="Excel"
                                                            ID="btnExcel"
                                                            OnClick="btnExcel_Click"
                                                            runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Title--%>
                                <div class="">
                                    <div class="flex gap-x-2">
                                        <asp:DropDownList runat="server" ID="ddlYear"
                                            class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" AutoPostBack="True">
                                            <asp:ListItem Text="All Year" Value="" />
                                            <asp:ListItem>2024</asp:ListItem>
                                            <asp:ListItem>2023</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="">
                                    <div class="flex gap-x-2">
                                        <asp:DropDownList runat="server" ID="ddlMonth"
                                            class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" AutoPostBack="True">
                                            <asp:ListItem Text="All Month" Value="" />
                                            <asp:ListItem Value="1">January</asp:ListItem>
                                            <asp:ListItem Value="2">February</asp:ListItem>
                                            <asp:ListItem Value="3">March</asp:ListItem>
                                            <asp:ListItem Value="4">April</asp:ListItem>
                                            <asp:ListItem Value="5">May</asp:ListItem>
                                            <asp:ListItem Value="6">June</asp:ListItem>
                                            <asp:ListItem Value="7">July</asp:ListItem>
                                            <asp:ListItem Value="8">August</asp:ListItem>
                                            <asp:ListItem Value="9">September</asp:ListItem>
                                            <asp:ListItem Value="10">October</asp:ListItem>
                                            <asp:ListItem Value="11">November</asp:ListItem>
                                            <asp:ListItem Value="12">December</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!-- End Header -->

                            <!-- Table -->


                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
SELECT
    P.product_ID,
    P.product_name,
    COALESCE(SUM(OD.quantity), 0) AS total_quantity_sold,
    COALESCE(SUM(O.order_total), 0) AS total_order_sales
FROM
    Product P
JOIN
    Product_Details PD ON P.product_ID = PD.product_ID
LEFT JOIN
    Order_Details OD ON PD.product_details_ID = OD.product_details_ID
LEFT JOIN
    [Order] O ON OD.order_ID = O.order_ID
GROUP BY
    P.product_ID, P.product_name"></asp:SqlDataSource>
                            <asp:ListView ID="ListView1" DataSourceID="SqlDataSource1" runat="server" DataKeyNames="product_ID">
                                <EmptyDataTemplate>
                                    <table runat="server" class="table-auto min-w-full divide-y divide-gray-200 dark:divide-gray-700 ">
                                        <tr class="text-center whitespace-nowrap border-y border-gray-200 dark:border-gray-700 text-gray-800 dark:text-gray-200">
                                            <td class="py-8">Empty!</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr class="border-y border-gray-200 dark:border-gray-700 bg-white hover:bg-gray-50 dark:bg-slate-900 dark:hover:bg-slate-800">
                                        <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                            <%# Eval("product_name") %>
                                        </td>
                                        <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                            <%# Eval("total_quantity_sold") %>
                                        </td>
                                        <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                            <%# Eval("total_order_sales") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" class="table-auto min-w-full divide-y divide-gray-200 dark:divide-gray-700 ">
                                        <tr runat="server" class="bg-gray-50 dark:bg-slate-800">
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="LinkButton1" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="product_name">
                                                    Product Name
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="LinkButton2" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="total_quantity_sold">
                                                    Total Quantity Sold
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="LinkButton3" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="total_order_sales">
                                                    Total Sales (RM) 
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                        </tr>


                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                            </asp:ListView>

                            <!-- End Table -->

                            <!-- Footer -->
                            <div class="px-6 py-4 flex justify-end items-center">
                                <asp:DataPager ID="DataPager2" runat="server" PagedControlID="ListView1" PageSize="10">
                                    <Fields>
                                        <asp:NextPreviousPagerField
                                            ButtonCssClass="cursor-pointer min-h-[38px] min-w-[38px] py-2 px-2.5 text-sm rounded-lg text-gray-800 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-white/10 dark:focus:bg-white/10"
                                            ButtonType="Button"
                                            ShowFirstPageButton="True"
                                            ShowPreviousPageButton="True"
                                            ShowNextPageButton="False"
                                            ShowLastPageButton="False"
                                            RenderNonBreakingSpacesBetweenControls="false" />
                                        <asp:NumericPagerField
                                            NumericButtonCssClass="cursor-pointer min-h-[38px] min-w-[38px] text-gray-800 hover:bg-gray-100 py-2 px-3 text-sm rounded-lg focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-white/10 dark:focus:bg-white/10"
                                            ButtonType="Button"
                                            CurrentPageLabelCssClass="text-center inline-block min-h-[38px] min-w-[38px] bg-gray-200 text-gray-800 py-2 px-3 text-sm rounded-lg focus:outline-none focus:bg-gray-300 disabled:opacity-50 disabled:pointer-events-none dark:bg-gray-600 dark:text-white dark:focus:bg-gray-500"
                                            ButtonCount="10" />
                                        <asp:NextPreviousPagerField
                                            ButtonCssClass="cursor-pointer  min-h-[38px] min-w-[38px] py-2 px-2.5 text-sm rounded-lg text-gray-800 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-white/10 dark:focus:bg-white/10"
                                            ButtonType="Button"
                                            ShowFirstPageButton="False"
                                            ShowPreviousPageButton="False"
                                            ShowNextPageButton="True"
                                            ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                            <!-- End Footer -->

                        </div>
                    </div>
                </div>
            </div>
            <!-- End Card -->
        </asp:Panel>
    </div>
    <!-- End Table Section -->
    <script>
        function printListView() {
            var panel = document.getElementById("<%=panelContent.ClientID %>");
            var printWindow = window.open('', '_blank', 'height=400,width=800');
            printWindow.document.title = "ShirtTee";
            printWindow.document.write('<html><head>');
            printWindow.document.write('<link href="../dist/output.css" rel="stylesheet" />');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();

            printWindow.onafterprint = function () {
                printWindow.close();
            };

            // Trigger the print operation with additional options
            printWindow.print();
            return false;
        }
    </script>
</asp:Content>
