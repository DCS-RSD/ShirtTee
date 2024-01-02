<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="Analyze.aspx.cs" Inherits="ShirtTee.admin.Analyze" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../dist/apexcharts.css">
    <script src="../dist/lodash.min.js"></script>
    <script src="../dist/apexcharts.min.js"></script>
    <script src="https://preline.co/assets/js/hs-apexcharts-helpers.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Card Section -->
    <div class="max-w-[85rem] mx-auto">
        <!-- Grid -->
        <div class="grid lg:grid-cols-3 gap-4 sm:gap-6">
            <!-- Card -->
            <div class="flex flex-col bg-white border shadow-sm rounded-xl dark:bg-slate-900 dark:border-gray-800">
                <div class="p-4 md:p-5 flex justify-between gap-x-3">
                    <div>
                        <p class="text-xs uppercase tracking-wide text-gray-500">
                            Order Received 
                        <span class="font-bold"><%= DateTime.Now.ToString("yyyy/MM") %></span>
                        </p>
                        <div class="mt-1 flex items-center gap-x-2">
                            <asp:Label ID="lblTotalOrder" runat="server" Text="0"
                                class="mt-1 text-xl font-medium text-gray-800 dark:text-gray-200">
                            </asp:Label>
                        </div>
                    </div>
                    <div class="flex-shrink-0 flex justify-center items-center w-[46px] h-[46px] bg-blue-600 text-white rounded-full dark:bg-blue-900 dark:text-blue-200">
                        <svg class="flex-shrink-0 w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21.9844 10C21.9473 8.68893 21.8226 7.85305 21.4026 7.13974C20.8052 6.12523 19.7294 5.56066 17.5777 4.43152L15.5777 3.38197C13.8221 2.46066 12.9443 2 12 2C11.0557 2 10.1779 2.46066 8.42229 3.38197L6.42229 4.43152C4.27063 5.56066 3.19479 6.12523 2.5974 7.13974C2 8.15425 2 9.41667 2 11.9415V12.0585C2 14.5833 2 15.8458 2.5974 16.8603C3.19479 17.8748 4.27063 18.4393 6.42229 19.5685L8.42229 20.618C10.1779 21.5393 11.0557 22 12 22C12.9443 22 13.8221 21.5393 15.5777 20.618L17.5777 19.5685C19.7294 18.4393 20.8052 17.8748 21.4026 16.8603C21.8226 16.1469 21.9473 15.3111 21.9844 14" />
                            <path d="M21 7.5L17 9.5M12 12L3 7.5M12 12V21.5M12 12C12 12 14.7426 10.6287 16.5 9.75C16.6953 9.65237 17 9.5 17 9.5M17 9.5V13M17 9.5L7.5 4.5" />
                        </svg>
                    </div>
                </div>

                <a class="flex-1 py-3 px-4 md:px-5 inline-flex justify-between items-center text-sm text-gray-600 border-t border-gray-200 hover:bg-gray-50 rounded-b-xl dark:border-gray-700 dark:text-gray-400 dark:hover:bg-slate-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                    href="AnalyzeProduct.aspx">Which product is top seller?
                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </a>
            </div>
            <!-- End Card -->

            <!-- Card -->
            <div class="flex flex-col bg-white border shadow-sm rounded-xl dark:bg-slate-900 dark:border-gray-800">
                <div class="p-4 md:p-5 flex justify-between gap-x-3">
                    <div>
                        <p class="text-xs uppercase tracking-wide text-gray-500">
                            New Users
                        <span class="font-bold"><%= DateTime.Now.ToString("yyyy/MM") %></span>

                        </p>
                        <div class="mt-1 flex items-center gap-x-2">
                            <asp:Label ID="lblTotalUser" runat="server" Text="0"
                                class="mt-1 text-xl font-medium text-gray-800 dark:text-gray-200">
                            </asp:Label>
                        </div>
                    </div>
                    <div class="flex-shrink-0 flex justify-center items-center w-[46px] h-[46px] bg-blue-600 text-white rounded-full dark:bg-blue-900 dark:text-blue-200">
                        <svg class="flex-shrink-0 w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                            <circle cx="9" cy="7" r="4" />
                            <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
                            <path d="M16 3.13a4 4 0 0 1 0 7.75" />
                        </svg>
                    </div>
                </div>

                <a class="flex-1 py-3 px-4 md:px-5 inline-flex justify-between items-center text-sm text-gray-600 border-t border-gray-200 hover:bg-gray-50 rounded-b-xl dark:border-gray-700 dark:text-gray-400 dark:hover:bg-slate-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                    href="AnalyzeCustomer.aspx">Who are the top customers in terms of product purchases?
                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </a>
            </div>
            <!-- End Card -->

            <!-- Card -->
            <div class="flex flex-col bg-white border shadow-sm rounded-xl dark:bg-slate-900 dark:border-gray-800">
                <div class="p-4 md:p-5 flex justify-between gap-x-3">
                    <div>
                        <p class="text-xs uppercase tracking-wide text-gray-500">
                            Sales (RM) 
                        <span class="font-bold"><%= DateTime.Now.ToString("yyyy/MM") %></span>

                        </p>
                        <div class="mt-1 flex items-center gap-x-2">
                            <asp:Label ID="lblTotalSales" runat="server" Text="0"
                                class="mt-1 text-xl font-medium text-gray-800 dark:text-gray-200">
                            </asp:Label>
                        </div>
                    </div>
                    <div class="flex-shrink-0 flex justify-center items-center w-[46px] h-[46px] bg-blue-600 text-white rounded-full dark:bg-blue-900 dark:text-blue-200">
                        <svg class="flex-shrink-0 w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" />
                        </svg>
                    </div>
                </div>

                <button type="button" data-hs-overlay="#hs-scroll-inside-body-modal"
                    class="flex-1 py-3 px-4 md:px-5 inline-flex justify-between items-center text-sm text-gray-600 border-t border-gray-200 hover:bg-gray-50 rounded-b-xl dark:border-gray-700 dark:text-gray-400 dark:hover:bg-slate-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                    How are the product sales performing?
                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="m9 18 6-6-6-6" />
                    </svg>
                </button>
                <%-- Modal --%>
                <div id="hs-scroll-inside-body-modal" class="hs-overlay hidden w-full h-full fixed top-0 start-0 z-[100] overflow-x-hidden overflow-y-auto">
                    <div class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto h-[calc(100%-3.5rem)]">
                        <div class="max-h-full overflow-hidden flex flex-col bg-white border shadow-sm rounded-xl pointer-events-auto dark:bg-gray-800 dark:border-gray-700 dark:shadow-slate-700/[.7]">
                            <div class="flex justify-between items-center py-3 px-4 border-b dark:border-gray-700">
                                <h3 class="font-bold text-gray-800 dark:text-white">Monthly Income
                                    <asp:Label ID="lblModalTitle" runat="server"></asp:Label>
                                </h3>
                                <button type="button" class="flex justify-center items-center w-7 h-7 text-sm font-semibold rounded-full border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:hover:bg-gray-700 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" data-hs-overlay="#hs-scroll-inside-body-modal">
                                    <span class="sr-only">Close</span>
                                    <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M18 6 6 18" />
                                        <path d="m6 6 12 12" />
                                    </svg>
                                </button>
                            </div>

                            <div class="py-2 px-8 overflow-y-auto">
                                <div class=" grid grid-cols-3">
                                    <div class="col-span-2 flex-col">
                                        <h1 class="text-m py-2 flex-1 font-bold border-b dark:text-white">Month</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">January</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">February</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">March</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">April</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">May</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">June</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">July</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">August</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">September</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">October</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">November</h1>
                                        <h1 class="text-m py-2 flex-1 font-semi-bold dark:text-white">December</h1>
                                        <h1 class="text-m py-2 flex-1 border-t font-bold dark:text-white">Total Sales</h1>
                                    </div>
                                    <div class="col-span-1 flex-col">
                                        <h1 class="text-m py-2 flex-1 font-bold text-right border-b dark:text-white">Income (RM)</h1>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <h1 class="text-m flex-1 py-2 text-right font-semi-bold dark:text-white"><%#Eval("sales") %></h1>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="WITH Months AS (
  SELECT DISTINCT MonthNumber
  FROM (
    SELECT 1 AS MonthNumber
    UNION SELECT 2
    UNION SELECT 3
    UNION SELECT 4
    UNION SELECT 5
    UNION SELECT 6
    UNION SELECT 7
    UNION SELECT 8
    UNION SELECT 9
    UNION SELECT 10
    UNION SELECT 11
    UNION SELECT 12
  ) AS AllMonths
)

SELECT COALESCE(SUM(o.order_total), 0) AS sales, m.MonthNumber AS month
FROM Months m
LEFT JOIN [Order] o ON m.MonthNumber = MONTH(o.order_date) AND YEAR(o.order_date) = @year
GROUP BY m.MonthNumber
ORDER BY m.MonthNumber;
">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlYear" PropertyName="SelectedValue" Name="year"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:Label
                                            runat="server"
                                            ID="lblModalTotalSales"
                                            Text="0.00"
                                            class="block text-m flex-1 py-2 text-right border-t dark:text-violet-300 text-indigo-600 font-bold"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="flex justify-end items-center gap-x-2 py-3 px-4 border-t dark:border-gray-700">
                                <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" data-hs-overlay="#hs-scroll-inside-body-modal">
                                    Close
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Card -->
        </div>
        <!-- End Grid -->
    </div>
    <!-- End Card Section -->
    <div class="my-4 mx-8 flex sm:justify-end">
        <div>
            <asp:DropDownList runat="server" ID="ddlYear"
                class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" AutoPostBack="True">
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <%-- line chart --%>
    <div class="max-w-[85rem]">
        <div class="bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden dark:bg-slate-900 dark:border-gray-700">
            <div class="mt-8 mb-4 mx-8 sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Sales Line Chart
                    </h1>
                    <p class="text-sm text-gray-800 dark:text-gray-200">
                        Overview of yearly sales.
                    </p>
                </div>
            </div>
            <div class="p-4" id="hs-single-area-chart"></div>
        </div>
    </div>
    <%-- End Line CHart --%>

    <%-- Bar Chart --%>
    <div class="flex mt-4 gap-x-4">
        <div class="flex-1 bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden dark:bg-slate-900 dark:border-gray-700">
            <div class="mt-8 mb-4 mx-8 sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Category Group Sales Chart
                    </h1>
                    <p class="text-sm text-gray-800 dark:text-gray-200">
                        Overview of men, women, kids products sold.
                    </p>
                </div>
            </div>
            <div class="p-4 flex flex-col justify-center items-center">
                <div id="hs-doughnut-chart"></div>

                <!-- Legend Indicator -->
                <div class="flex justify-center sm:justify-end items-center gap-x-4 mt-3 sm:mt-6">
                    <div class="inline-flex items-center">
                        <span class="w-2.5 h-2.5 inline-block bg-blue-600 rounded-sm me-2"></span>
                        <span class="text-[13px] text-gray-600 dark:text-neutral-400">Men
                        </span>
                    </div>
                    <div class="inline-flex items-center">
                        <span class="w-2.5 h-2.5 inline-block bg-cyan-500 rounded-sm me-2"></span>
                        <span class="text-[13px] text-gray-600 dark:text-neutral-400">Women
                        </span>
                    </div>
                    <div class="inline-flex items-center">
                        <span class="w-2.5 h-2.5 inline-block bg-gray-300 rounded-sm me-2"></span>
                        <span class="text-[13px] text-gray-600 dark:text-neutral-400">Kids
                        </span>
                    </div>
                </div>
                <!-- End Legend Indicator -->
            </div>
        </div>
        <div class="flex-1 bg-white border border-gray-200 rounded-xl shadow-sm overflow-hidden dark:bg-slate-900 dark:border-gray-700">
            <div class="mt-8 mb-4 mx-8 sm:flex sm:items-center">
                <div class="sm:flex-auto">
                    <h1 class="text-xl font-bold text-gray-800 dark:text-gray-200">Product Category Sales Bar Chart
                    </h1>
                    <p class="text-sm text-gray-800 dark:text-gray-200">
                        Items sold based on product category group.
                    </p>
                </div>
                <div class="self-end">
                    <asp:DropDownList runat="server" ID="ddlCategory"
                        class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" AutoPostBack="True">
                        <asp:ListItem Value="men">Men</asp:ListItem>
                        <asp:ListItem Value="women">Women</asp:ListItem>
                        <asp:ListItem Value="kids">Kids</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="p-6" id="hs-single-bar-chart"></div>
        </div>
    </div>


    <script>
        var arrSales;
        function setArrSales(value) {
            arrSales = value;
        }

        var groupSales;
        function setGroupSales(value) {
            groupSales = value;
        }


        var productCategory;
        function setCategory(value) {
            productCategory = value;
            console.log(productCategory);
        }

        var categorySales;
        function setCategorySales(value) {
            categorySales = value;
            console.log(categorySales);
        }
    </script>

    <%-- Line Chart --%>
    <script>
        window.addEventListener('load', () => {
            (function () {
                buildChart('#hs-single-area-chart', (mode) => ({
                    chart: {
                        height: 300,
                        type: 'area',
                        toolbar: {
                            show: true
                        },
                        zoom: {
                            enabled: false
                        }
                    },
                    series: [
                        {
                            name: 'Sales',
                            data: arrSales
                        }
                    ],
                    legend: {
                        show: false
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        curve: 'straight',
                        width: 2
                    },
                    grid: {
                        strokeDashArray: 2
                    },
                    fill: {
                        type: 'gradient',
                        gradient: {
                            type: 'vertical',
                            shadeIntensity: 1,
                            opacityFrom: 0.1,
                            opacityTo: 0.8
                        }
                    },
                    xaxis: {
                        type: 'category',
                        tickPlacement: 'on',
                        categories: [
                            ' January ',
                            ' February ',
                            ' March ',
                            ' April ',
                            ' May ',
                            ' June ',
                            ' July ',
                            ' August ',
                            ' September ',
                            ' October ',
                            ' November ',
                            ' December ',
                        ],
                        axisBorder: {
                            show: false
                        },
                        axisTicks: {
                            show: false
                        },
                        crosshairs: {
                            stroke: {
                                dashArray: 0
                            },
                            dropShadow: {
                                show: false
                            }
                        },
                        tooltip: {
                            enabled: false
                        },
                        labels: {
                            style: {
                                colors: '#9ca3af',
                                fontSize: '13px',
                                fontFamily: 'Inter, ui-sans-serif',
                                fontWeight: 400
                            },
                            formatter: (title) => {
                                let t = title;

                                if (t) {
                                    const newT = t.split(' ');
                                    t = `${newT[0]} ${newT[1].slice(0, 3)}`;
                                }

                                return t;
                            }
                        }
                    },
                    yaxis: {
                        labels: {
                            align: 'left',
                            minWidth: 0,
                            maxWidth: 140,
                            style: {
                                colors: '#9ca3af',
                                fontSize: '13px',
                                fontFamily: 'Inter, ui-sans-serif',
                                fontWeight: 400
                            },
                            formatter: (value) => value >= 1000 ? `${value / 1000}k` : value
                        }
                    },
                    tooltip: {
                        x: {
                            format: 'MMMM'
                        },
                        y: {
                            formatter: (value) => `${value >= 1000 ? `${value / 1000}k` : value}`
                        },
                    },
                    responsive: [{
                        breakpoint: 568,
                        options: {
                            chart: {
                                height: 300
                            },
                            labels: {
                                style: {
                                    colors: '#9ca3af',
                                    fontSize: '11px',
                                    fontFamily: 'Inter, ui-sans-serif',
                                    fontWeight: 400
                                },
                                offsetX: -2,
                                formatter: (title) => title.slice(0, 3)
                            },
                            yaxis: {
                                labels: {
                                    align: 'left',
                                    minWidth: 0,
                                    maxWidth: 140,
                                    style: {
                                        colors: '#9ca3af',
                                        fontSize: '11px',
                                        fontFamily: 'Inter, ui-sans-serif',
                                        fontWeight: 400
                                    },
                                    formatter: (value) => value >= 1000 ? `${value / 1000}k` : value
                                }
                            },
                        },
                    }]
                }), {
                    colors: ['#2563eb', '#9333ea'],
                    fill: {
                        gradient: {
                            stops: [0, 90, 100]
                        }
                    },
                    grid: {
                        borderColor: '#e5e7eb'
                    }
                }, {
                    colors: ['#3b82f6', '#a855f7'],
                    fill: {
                        gradient: {
                            stops: [100, 90, 0]
                        }
                    },
                    grid: {
                        borderColor: '#374151'
                    }
                });
            })();
        });

    </script>

    <%-- Doughnut chart --%>
    <script>
        window.addEventListener('load', () => {
            (function () {
                buildChart('#hs-doughnut-chart', () => ({
                    chart: {
                        height: 230,
                        width: 230,
                        type: 'donut',
                        zoom: {
                            enabled: false
                        },
                        toolbar: {
                            show: true
                        },
                    },
                    plotOptions: {
                        pie: {
                            donut: {
                                size: '76%'
                            }
                        }
                    },
                    series: groupSales,
                    labels: ['Men', 'Women', 'Kids'],
                    legend: {
                        show: false
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        width: 5
                    },
                    grid: {
                        padding: {
                            top: -12,
                            bottom: -11,
                            left: -12,
                            right: -12
                        }
                    },
                    states: {
                        hover: {
                            filter: {
                                type: 'none'
                            }
                        }
                    }
                }), {
                    colors: ['#3b82f6', '#22d3ee', '#6b7280'],
                    stroke: {
                        colors: ['rgb(255, 255, 255)']
                    }
                }, {
                    colors: ['#e5e7eb', '#3b82f6', '#22d3ee'],
                    stroke: {
                        colors: ['rgb(38, 38, 38)']
                    }
                });
            })();
        });
    </script>

    <%-- Bar chart --%>
    <script>
        window.addEventListener('load', () => {
            (function () {
                buildChart('#hs-single-bar-chart', (mode) => ({
                    chart: {
                        type: 'bar',
                        height: 300,
                        toolbar: {
                            show: true
                        },
                        zoom: {
                            enabled: false
                        }
                    },
                    series: [
                        {
                            name: 'Quantity Sold',
                            data: categorySales
                        }
                    ],
                    plotOptions: {
                        bar: {
                            horizontal: false,
                            columnWidth: '16px',
                            borderRadius: 0
                        }
                    },
                    legend: {
                        show: false
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        show: true,
                        width: 8,
                        colors: ['transparent']
                    },
                    xaxis: {
                        categories: productCategory,
                        axisBorder: {
                            show: false
                        },
                        axisTicks: {
                            show: false
                        },
                        crosshairs: {
                            show: false
                        },
                        labels: {
                            style: {
                                colors: '#9ca3af',
                                fontSize: '13px',
                                fontFamily: 'Inter, ui-sans-serif',
                                fontWeight: 400
                            },
                        }
                    },
                    yaxis: {
                        labels: {
                            align: 'left',
                            minWidth: 0,
                            maxWidth: 140,
                            style: {
                                colors: '#9ca3af',
                                fontSize: '13px',
                                fontFamily: 'Inter, ui-sans-serif',
                                fontWeight: 400
                            },
                        }
                    },
                    states: {
                        hover: {
                            filter: {
                                type: 'darken',
                                value: 0.9
                            }
                        }
                    },
                    tooltip: {
                    },
                    responsive: [{
                        breakpoint: 568,
                        options: {
                            chart: {
                                height: 300
                            },
                            plotOptions: {
                                bar: {
                                    columnWidth: '14px'
                                }
                            },
                            stroke: {
                                width: 8
                            },
                            labels: {
                                style: {
                                    colors: '#9ca3af',
                                    fontSize: '11px',
                                    fontFamily: 'Inter, ui-sans-serif',
                                    fontWeight: 400
                                },
                                offsetX: -2,
                                formatter: (title) => title.slice(0, 3)
                            },
                            yaxis: {
                                labels: {
                                    align: 'left',
                                    minWidth: 0,
                                    maxWidth: 140,
                                    style: {
                                        colors: '#9ca3af',
                                        fontSize: '11px',
                                        fontFamily: 'Inter, ui-sans-serif',
                                        fontWeight: 400
                                    },
                                    formatter: (value) => value >= 1000 ? `${value / 1000}k` : value
                                }
                            },
                        },
                    }]
                }), {
                    colors: ['#2563eb', '#d1d5db'],
                    grid: {
                        borderColor: '#e5e7eb'
                    }
                }, {
                    colors: ['#3b82f6', '#2563eb'],
                    grid: {
                        borderColor: '#374151'
                    }
                });
            })();
        });
    </script>
</asp:Content>
