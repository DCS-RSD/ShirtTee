<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="AnalyzeCustomer.aspx.cs" Inherits="ShirtTee.admin.AnalyzeCustomer" %>

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
                                <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Customer Report
                                </h1>
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
                                                <a class="flex items-center gap-x-3 py-2 px-3 rounded-lg text-sm text-gray-800 hover:bg-gray-100 focus:ring-2 focus:ring-blue-500 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" href="#">
                                                    <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                                        <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                                                        <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
                                                    </svg>
                                                    Print
                                                </a>
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
                                                <a class="flex items-center gap-x-3 py-2 px-3 rounded-lg text-sm text-gray-800 hover:bg-gray-100 focus:ring-2 focus:ring-blue-500 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" href="#">
                                                    <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M14 4.5V14a2 2 0 0 1-2 2h-1v-1h1a1 1 0 0 0 1-1V4.5h-2A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v9H2V2a2 2 0 0 1 2-2h5.5L14 4.5ZM3.517 14.841a1.13 1.13 0 0 0 .401.823c.13.108.289.192.478.252.19.061.411.091.665.091.338 0 .624-.053.859-.158.236-.105.416-.252.539-.44.125-.189.187-.408.187-.656 0-.224-.045-.41-.134-.56a1.001 1.001 0 0 0-.375-.357 2.027 2.027 0 0 0-.566-.21l-.621-.144a.97.97 0 0 1-.404-.176.37.37 0 0 1-.144-.299c0-.156.062-.284.185-.384.125-.101.296-.152.512-.152.143 0 .266.023.37.068a.624.624 0 0 1 .246.181.56.56 0 0 1 .12.258h.75a1.092 1.092 0 0 0-.2-.566 1.21 1.21 0 0 0-.5-.41 1.813 1.813 0 0 0-.78-.152c-.293 0-.551.05-.776.15-.225.099-.4.24-.527.421-.127.182-.19.395-.19.639 0 .201.04.376.122.524.082.149.2.27.352.367.152.095.332.167.539.213l.618.144c.207.049.361.113.463.193a.387.387 0 0 1 .152.326.505.505 0 0 1-.085.29.559.559 0 0 1-.255.193c-.111.047-.249.07-.413.07-.117 0-.223-.013-.32-.04a.838.838 0 0 1-.248-.115.578.578 0 0 1-.255-.384h-.765ZM.806 13.693c0-.248.034-.46.102-.633a.868.868 0 0 1 .302-.399.814.814 0 0 1 .475-.137c.15 0 .283.032.398.097a.7.7 0 0 1 .272.26.85.85 0 0 1 .12.381h.765v-.072a1.33 1.33 0 0 0-.466-.964 1.441 1.441 0 0 0-.489-.272 1.838 1.838 0 0 0-.606-.097c-.356 0-.66.074-.911.223-.25.148-.44.359-.572.632-.13.274-.196.6-.196.979v.498c0 .379.064.704.193.976.131.271.322.48.572.626.25.145.554.217.914.217.293 0 .554-.055.785-.164.23-.11.414-.26.55-.454a1.27 1.27 0 0 0 .226-.674v-.076h-.764a.799.799 0 0 1-.118.363.7.7 0 0 1-.272.25.874.874 0 0 1-.401.087.845.845 0 0 1-.478-.132.833.833 0 0 1-.299-.392 1.699 1.699 0 0 1-.102-.627v-.495Zm8.239 2.238h-.953l-1.338-3.999h.917l.896 3.138h.038l.888-3.138h.879l-1.327 4Z" />
                                                    </svg>
                                                    .CSV
                                                </a>
                                                <a class="flex items-center gap-x-3 py-2 px-3 rounded-lg text-sm text-gray-800 hover:bg-gray-100 focus:ring-2 focus:ring-blue-500 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-gray-300 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" href="#">
                                                    <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                                        <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
                                                        <path d="M4.603 14.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.697 19.697 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.188-.012.396-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.066.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.712 5.712 0 0 1-.911-.95 11.651 11.651 0 0 0-1.997.406 11.307 11.307 0 0 1-1.02 1.51c-.292.35-.609.656-.927.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.266.266 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.71 12.71 0 0 1 1.01-.193 11.744 11.744 0 0 1-.51-.858 20.801 20.801 0 0 1-.5 1.05zm2.446.45c.15.163.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.876 3.876 0 0 0-.612-.053zM8.078 7.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z" />
                                                    </svg>
                                                    .PDF
                                                </a>
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


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT u.Id AS user_ID, u.Username, u.email, 
       COUNT(o.order_ID) AS total_order, COALESCE(SUM(o.order_total), 0) AS total_amount
FROM [AspNetUsers] AS u
LEFT OUTER JOIN [Order] AS o ON u.Id = o.user_ID
GROUP BY u.Id, u.Username, u.email;
"></asp:SqlDataSource>
                        <asp:ListView ID="ListView1" DataSourceID="SqlDataSource1" runat="server" DataKeyNames="user_ID">
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
                                        <%# Eval("user_id") %>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("Username") %>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("email") %>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("total_order") %>
                                    </td>
                                    <td class="whitespace-nowrap py-4 px-6 text-gray-800 dark:text-gray-200">
                                        <%# Eval("total_amount") %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate runat="server">

                                <table id="itemPlaceholderContainer" runat="server" class="table-auto min-w-full divide-y divide-gray-200 dark:divide-gray-700 ">
                                    <tr runat="server" class="bg-gray-50 dark:bg-slate-800">
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="sortTitle" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="user_ID">
                                                    ID
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="sortDate" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="Username">
                                                    Username
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="LinkButton1" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="email">
                                                    Email
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="LinkButton2" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="total_order">
                                                    Total Order 
                                                    </asp:LinkButton>
                                                </div>
                                            </th>
                                            <th runat="server" scope="col" class="px-6 py-3 text-start">
                                                <div class="flex items-center gap-x-2">
                                                    <asp:LinkButton ID="LinkButton3" runat="server"
                                                        class="text-xs font-semibold uppercase tracking-wide text-gray-800 dark:text-gray-200" CommandName="Sort" CommandArgument="total_amount">
                                                    Total Purchase (RM) 
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
    </div>
    <!-- End Table Section -->
</asp:Content>
