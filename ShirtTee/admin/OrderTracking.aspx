<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="OrderTracking.aspx.cs" Inherits="ShirtTee.admin.OrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Table Section -->
    <div class="max-w-[85rem] mx-auto">
        <!-- Card -->
        <div class="flex flex-col">
            <div class="-m-1.5 overflow-x-auto">
                <div class="p-1.5 min-w-full inline-block align-middle">
                    <div class="bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden dark:bg-slate-900 dark:border-gray-700">
                        <div class="mt-8 mb-4 mx-8 sm:flex sm:items-center">
                            <div class="sm:flex-auto">
                                <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Order List
                                </h1>
                            </div>
                        </div>

                        <!-- Header -->
                        <div class="px-6 py-4 grid gap-3 md:flex md:justify-between md:items-center border-b border-gray-200 dark:border-gray-700">
                            <%--Title--%>
                            <!-- Search -->
                            <div class="sm:col-span-1">
                                <label for="txtSearch" class="sr-only">Search</label>
                                <div class="relative">
                                    <asp:TextBox runat="server" placeholder="Search order ID" ID="txtSearch"
                                        AutoPostBack="true"
                                        class="py-2 px-3 ps-11 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600">
                                    </asp:TextBox>
                                    <div class="absolute inset-y-0 start-0 flex items-center pointer-events-none ps-4">
                                        <svg class="h-4 w-4 text-gray-400" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                            <!-- End Search -->

                            <div class="sm:col-span-2 md:grow">
                                <div class="flex justify-end gap-x-2">
                                    <asp:DropDownList runat="server" ID="ddlCategory" 
                                        class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                        AutoPostBack="True">
                                        <asp:ListItem Value="">All</asp:ListItem>
                                        <asp:ListItem Value="Order Placed">Order Placed</asp:ListItem>
                                        <asp:ListItem Value="Preparing">Preparing</asp:ListItem>
                                        <asp:ListItem Value="Shipped">Shipped</asp:ListItem>
                                        <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!-- End Header -->

                        <!-- Table -->
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand='SELECT s.order_status_ID, o.order_ID, s.status, o.order_date, MAX(s.update_date) AS latest_update_date
FROM "Order" AS o
INNER JOIN [Order_Status] AS s ON s.order_ID = o.order_ID
GROUP BY s.order_status_ID, o.order_ID, s.status, o.order_date
HAVING MAX(s.update_date) = (
  SELECT MAX(update_date)
  FROM [Order_Status] WHERE order_ID = o.order_ID
)
'></asp:SqlDataSource>

                        <asp:ListView ID="ListView1" DataSourceID="SqlDataSource1" runat="server" DataKeyNames="order_ID">
                            <EmptyDataTemplate>
                                <table runat="server" class="table-auto min-w-full divide-y divide-gray-200 dark:divide-gray-700 ">
                                    <tr class="text-center whitespace-nowrap border-y border-gray-200 dark:border-gray-700 text-gray-800 dark:text-gray-200">
                                        <td class="py-8">Empty!</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>

                            <ItemTemplate>
                                <tr onclick='<%# Eval("order_ID", "window.location.href = \"OrderDetails.aspx?order_id={0}\";") %>'
                                    class="border-y border-gray-200 dark:border-gray-700 bg-white hover:bg-gray-50 dark:bg-slate-900 dark:hover:bg-slate-800 cursor-pointer">
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("order_ID") %>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <span class="inline-flex items-center gap-x-1.5 py-1.5 px-3 rounded-full text-xs font-medium border <%# GetStatusClass(Eval("status").ToString()) %>  bg-white shadow-sm dark:bg-slate-900 dark:text-white">
                                            <%# Eval("status") %>
                                        </span>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("order_date") %>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("latest_update_date") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>

                                <table id="itemPlaceholderContainer" runat="server" class="table-auto min-w-full divide-y divide-gray-200 dark:divide-gray-700 ">
                                    <tr runat="server" class="bg-gray-50 dark:bg-slate-800">
                                        <th runat="server" scope="col" class="px-6 py-3 text-start">
                                            <div class="flex items-center gap-x-2">
                                                <asp:LinkButton ID="sortTitle" runat="server"
                                                    class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="order_ID">
                              ID
                                                </asp:LinkButton>
                                            </div>
                                        </th>
                                        <th runat="server" scope="col" class="px-6 py-3 text-start">
                                            <div class="flex items-center gap-x-2">
                                                <asp:LinkButton ID="sortDate" runat="server"
                                                    class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="status">
                              Status
                                                </asp:LinkButton>
                                            </div>
                                        </th>
                                        <th runat="server" scope="col" class="px-6 py-3 text-start">
                                            <div class="flex items-center gap-x-2">
                                                <asp:LinkButton ID="LinkButton1" runat="server"
                                                    class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="order_date">
                              Order At
                                                </asp:LinkButton>
                                            </div>
                                        </th>
                                        <th runat="server" scope="col" class="px-6 py-3 text-start">
                                            <div class="flex items-center gap-x-2">
                                                <asp:LinkButton ID="LinkButton2" runat="server"
                                                    class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="latest_update_date">
                              Updated At
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
                            <div class="inline-flex gap-x-2">
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
                        </div>
                        <!-- End Footer -->

                    </div>
                </div>
            </div>
        </div>
        <!-- End Card -->
    </div>
    <!-- End Table Section -->
</asp:Content>
