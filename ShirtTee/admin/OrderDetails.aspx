<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ShirtTee.admin.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto">
        <div class="bg-white rounded-xl shadow dark:bg-gray-800 p-8">
            <%--Title--%>

            <div class="px-4 space-y-2 sm:px-0 sm:flex sm:items-baseline sm:justify-between sm:space-y-0">
                <div class="flex sm:items-baseline sm:space-x-4">
                    <h2 class="text-xl font-bold text-gray-800 dark:text-gray-200">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </h2>
                </div>
                <p class="text-sm text-gray-600">
                    Order placed 
                    <asp:Label runat="server" ID="lblOrderDate"
                        class="font-medium text-gray-900"></asp:Label>
                </p>
            </div>

            <!-- Products -->
            <div class="mt-6">

                <div class="space-y-8">
                    <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">

                        <div class=" border-gray-200 py-6 px-4 sm:px-6 lg:p-8">
                            <%--                            <p class="text-sm font-medium text-gray-900">Preparing to ship on <time datetime="2021-03-24">March 24, 2021</time></p>--%>
                            <div class="mt-6" aria-hidden="true">
                                <div class="bg-gray-200 rounded-full overflow-hidden">
                                    <div runat="server" id="progressBar"
                                        class="h-2 bg-indigo-600 rounded-full"></div>
                                </div>
                                <div class="hidden sm:grid grid-cols-4 text-sm font-medium text-gray-600 mt-6">
                                    <div class="text-indigo-600">Order placed</div>
                                    <div class="text-center text-indigo-600">Processing</div>
                                    <div class="text-center">Shipped</div>
                                    <div class="text-right">Delivered</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">
                        <div class="px-4 py-4 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Customer Information</h3>
                        </div>
                        <div class="border-t border-gray-200 px-4 py-5 sm:px-6">
                            <div class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2">
                                <div class="sm:col-span-1">
                                    <h1 class="text-sm font-medium text-gray-500">ID</h1>
                                    <asp:Label runat="server" ID="lblCustId"
                                        class="mt-1 text-sm text-gray-900"></asp:Label>
                                </div>
                                <div class="sm:col-span-1">
                                    <h1 class="text-sm font-medium text-gray-500">Name</h1>
                                    <asp:Label runat="server" ID="lblCustName"
                                        class="mt-1 text-sm text-gray-900"></asp:Label>
                                </div>
                                <div class="sm:col-span-1">
                                    <h1 class="text-sm font-medium text-gray-500">Email address</h1>
                                    <asp:HyperLink runat="server" ID="hypCustEmail"
                                        class="mt-1 text-sm text-gray-900 underline"></asp:HyperLink>
                                </div>
                                <div class="sm:col-span-1">
                                    <h1 class="text-sm font-medium text-gray-500">Contact Number</h1>
                                    <asp:HyperLink runat="server" ID="hypContactNo"
                                        class="mt-1 text-sm text-gray-900 underline"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">
                        <div class="px-4 py-4 sm:px-6">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">Order List</h3>
                        </div>
                        <div class="border-t border-gray-200">
                            <asp:ListView runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div class="py-6 px-4 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
                                        <div class="sm:flex lg:col-span-7">
                                            <div class="flex-shrink-0 w-full aspect-w-1 aspect-h-1 rounded-lg overflow-hidden sm:aspect-none sm:w-40 sm:h-40">
                                                <img src='<%# ResolveUrl(Eval("image").ToString()) %>' alt="" class="w-full h-full object-center object-cover sm:w-full sm:h-full">
                                            </div>

                                            <div class="mt-6 sm:mt-0 sm:ml-6">
                                                <h3 class="text-base font-medium text-gray-900">
                                                    <a href="#"><%# Eval("product_name") %></a>
                                                </h3>
                                                <p class="mt-2 text-sm font-medium text-gray-900">RM <%# Eval("price") %></p>
                                                <p class="mt-3 text-sm text-gray-500"><%# Eval("description") %></p>
                                                <p class="mt-3 text-sm font-bold text-gray-900">Total: RM <%# Eval("total") %></p>
                                            </div>
                                        </div>

                                        <div class="mt-6 lg:mt-0 lg:col-span-5">
                                            <dl class="grid grid-cols-2 gap-x-6 text-sm">
                                                <div>
                                                    <dt class="font-medium text-gray-900">Quantity</dt>
                                                    <dd class="mt-3 text-gray-500">
                                                        <span class="block">
                                                            <%# Eval("quantity") %>
                                                        </span>
                                                    </dd>
                                                </div>
                                                <div>
                                                    <dt class="font-medium text-gray-900">Size / Color</dt>
                                                    <dd class="mt-3 text-gray-500 space-y-3">
                                                        <p><%# Eval("size_name") %></p>
                                                        <p><%# Eval("color_name") %></p>
                                                    </dd>
                                                </div>
                                            </dl>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:ListView>
                        </div>



                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Order] AS o
INNER JOIN [Order_Details] AS od ON od.order_ID = o.order_ID
INNER JOIN [Stock] AS s ON s.stock_ID= od.stock_ID
INNER JOIN [Size] AS sz ON sz.size_ID= s.size_ID
INNER JOIN [Color] AS co ON co.color_ID= s.color_ID
INNER JOIN [Product] AS pd ON pd.product_ID= s.product_ID
INNER JOIN [Category] AS cat ON cat.category_ID= pd.category_ID
 WHERE o.order_ID=@order_id">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="order_id" Name="order_id"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <!-- More products... -->
                </div>
            </div>

            <!-- Billing -->
            <div class="mt-8">

                <div class="bg-gray-100 py-6 px-4 sm:px-6 sm:rounded-lg lg:px-8 lg:py-8 lg:grid lg:grid-cols-12 lg:gap-x-8">
                    <div class="grid md:grid-cols-2 gap-6 text-sm sm:grid-cols-2 md:gap-x-8 lg:col-span-7">
                        <div>
                            <h1 class="font-medium text-gray-900">Delivery Address</h1>
                            <p class="mt-3 text-gray-500">
                                <asp:Label runat="server" CssClass="block" ID="lblDeliveryAddress"></asp:Label>
                            </p>
                        </div>
                        <div>
                            <h1 class="font-medium text-gray-900">Payment Information</h1>
                            <div class="mt-3">
                                <div class="mt-3 text-gray-500">
                                    <asp:Label runat="server" CssClass="block" ID="lblPaymentId"></asp:Label>
                                    <asp:Label runat="server" CssClass="block mt-1" ID="lblPaymentMethod"></asp:Label>
                                    <asp:Label runat="server" CssClass="block mt-1" ID="lblPaymentDate"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-8 divide-y divide-gray-200 text-sm lg:mt-0 lg:col-span-5">
                        <div class="pb-4 flex items-center justify-between">
                            <h1 class="text-gray-600">Subtotal</h1>
                            <asp:Label ID="lblSubtotal" runat="server" class="font-medium text-gray-900"></asp:Label>
                        </div>
                        <div class="py-4 flex items-center justify-between">
                            <h1 class="text-gray-600">Shipping</h1>
                            <asp:Label ID="lblShippingFee" runat="server" class="font-medium text-gray-900"></asp:Label>
                        </div>
                        <div class="py-4 flex items-center justify-between">
                            <h1 class="text-gray-600">Discount (<asp:Label ID="lblVoucher" runat="server"></asp:Label>)</h1>
                            <asp:Label ID="lblDiscount" runat="server" class="font-medium text-gray-900"></asp:Label>
                        </div>
                        <div class="py-4 flex items-center justify-between">
                            <h1 class="font-medium text-gray-900">Order total</h1>
                            <asp:Label ID="lblOrderTotal" runat="server" class="font-medium text-indigo-600"></asp:Label>
                        </div>
                        <div class="pt-4 flex items-center justify-between">
                            <h1 class="text-gray-600">Member Point Earned</h1>
                            <asp:Label ID="lblPoint" runat="server" class="font-medium text-gray-900"></asp:Label>
                        </div>


                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
