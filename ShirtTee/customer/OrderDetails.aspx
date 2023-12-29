<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ShirtTee.customer.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        function showSuccessToast() {
            var status = '<%= Session["OrderStatusUpdated"] %>';
            console.log(status);
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Order cancelled successfully.");
                } else {
                    toastr["error"]("Something went wrong.");
                }
            }
        <% Session.Remove("OrderStatusUpdated"); %>
        }
    </script>
    <div class="bg-gray-50">
        <div class=" mx-auto pt-8 pb-12 px-8 lg:max-w-7xl lg:px-12">
            <div class="px-4 space-y-2 sm:px-0 sm:flex sm:items-baseline sm:justify-between sm:space-y-0">
                <div class="flex sm:items-baseline sm:space-x-4">
                    <h1 class="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">Order #<asp:Label runat="server" ID="lblOrderID" Text="" /></h1>
                </div>
                <p class="text-sm text-gray-600">
                    Order Date:
                    <asp:Label runat="server" ID="lblOrderDate" class="font-medium text-gray-900" Text=""></asp:Label>
                </p>
                <a href="#" class="text-sm font-medium text-indigo-600 hover:text-indigo-500 sm:hidden">View invoice<span aria-hidden="true"> &rarr;</span></a>
            </div>

            <!-- Products -->
            <div class="mt-6">
                <h2 class="sr-only">Products purchased</h2>

                <div class="space-y-8">
                    <div class="bg-white border-gray-200 shadow-sm border rounded-lg">

                        <div class=" border-gray-200 py-6 px-4 sm:px-6 lg:p-8">
                            <h4 class="sr-only">Status</h4>
                            <p class="text-sm font-medium text-gray-900">
                                <asp:Label runat="server" ID="lblOrderStatusDetails" Text="" class="" />
                                <asp:Label runat="server" ID="lblRefundInfo" Visible="false" Text="Refund process will be notified via email." class="block mt-2" />
                            </p>
                            <div class="mt-6" aria-hidden="true">
                                <div class="bg-gray-200 rounded-full overflow-hidden">
                                    <div runat="server" id="progressBar" class="h-2 rounded-full"></div>
                                </div>
                                <div class="hidden sm:grid grid-cols-4 text-sm font-medium text-gray-600 mt-6">
                                    <div class="">Order placed</div>
                                    <div class="text-center ">Processing</div>
                                    <div class="text-center">Shipped</div>
                                    <div class="text-right">Delivered</div>
                                </div>
                            </div>
                            <div class="mt-8 flex flex-row justify-end gap-x-4">
                                <div>
                                    <asp:Button data-hs-overlay="#hs-modal-cancel" OnClientClick="return false"
                                        ID="btnCancel" Visible="false" runat="server" Text="Cancel" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                    <div class="hs-tooltip">
                                        <asp:Button
                                            ID="btnCancelDisabled" Visible="false" runat="server" Text="Cancel" disabled class="hs-tooltip-toggle w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 disabled:cursor-not-allowed dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                        <span class="hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700 hidden" role="tooltip" style="position: fixed; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(814.4px, -472.8px, 0px);" data-popper-placement="top">Order cancelled or start processing cannot be cancelled.
                                        </span>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Order_Details] AS od
INNER JOIN [Product_Details] AS pd
ON od.product_details_ID = pd.product_details_ID
INNER JOIN [Product] AS p
ON pd.product_ID = p.product_ID
INNER JOIN [Color] AS c
ON pd.color_ID = c.color_ID
INNER JOIN [Size] AS s
ON pd.size_ID = s.size_ID
WHERE order_ID = @order_ID">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="order_ID" Name="order_ID"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">
                                <div class="py-6 px-4 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
                                    <div class="sm:flex lg:col-span-7">
                                        <div class="flex-shrink-0 w-full aspect-w-1 aspect-h-1 rounded-lg overflow-hidden sm:aspect-none sm:w-40 sm:h-40">
                                            <img src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>' alt='<%# Eval("product_name") %>' class="w-full h-full object-center object-cover sm:w-full sm:h-full">
                                        </div>

                                        <div class="mt-6 sm:mt-0 sm:ml-6">
                                            <h3 class="text-base font-medium text-gray-900"><%# Eval("product_name") %></h3>
                                            <p class="mt-2 text-sm font-medium text-gray-900">
                                                RM
                                                <asp:Label runat="server" ID="lblPrice" Text="" />
                                            </p>
                                            <p class="mt-3 text-sm text-gray-500"><%# Eval("description") %></p>
                                            <p class="mt-3 text-sm font-bold text-gray-900">
                                                Total: RM
                                                <asp:Label runat="server" ID="lblTotal" Text="" />
                                            </p>
                                        </div>
                                    </div>

                                    <div class="mt-6 lg:mt-0 lg:col-span-5">
                                        <dl class="grid grid-cols-2 gap-x-6 text-sm">
                                            <div>
                                                <dt class="font-medium text-gray-900">Quantity</dt>
                                                <dd class="mt-3 text-gray-500">
                                                    <span class="block"><%# Eval("quantity") %></span>
                                                </dd>
                                            </div>
                                            <div>
                                                <dt class="font-medium text-gray-900">Color / Size</dt>
                                                <dd class="mt-3 text-gray-500 space-y-3">
                                                    <p><%# Eval("color_name") %></p>
                                                    <p><%# Eval("size_name") %></p>

                                                </dd>
                                            </div>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <!-- More products... -->
                </div>
            </div>

            <!-- Billing -->
            <div class="mt-16">
                <h2 class="sr-only">Billing Summary</h2>

                <div class="bg-gray-100 py-6 px-4 sm:px-6 sm:rounded-lg lg:px-8 lg:py-8 lg:grid lg:grid-cols-12 lg:gap-x-8">
                    <dl class="grid md:grid-cols-2 gap-6 text-sm sm:grid-cols-2 md:gap-x-8 lg:col-span-7">
                        <div>
                            <dt class="font-medium text-gray-900">Delivery Address</dt>
                            <dd class="mt-3 text-gray-500">
                                <asp:Label runat="server" ID="lblDeliveryAddress" class="block" Text=""></asp:Label>
                            </dd>
                        </div>
                        <div>
                            <dt class="font-medium text-gray-900">Payment Information</dt>
                            <div class="mt-3">
                                <dd class="mt-3 text-gray-500">
                                    <asp:Label runat="server" ID="lblPaymentID" class="block" Text=""></asp:Label>
                                    <asp:Label runat="server" ID="lblPaymentName" class="block mt-1" Text=""></asp:Label>
                                    <asp:Label runat="server" ID="lblPaymentDate" class="block mt-1" Text=""></asp:Label>
                                </dd>
                            </div>
                        </div>
                    </dl>

                    <dl class="mt-8 divide-y divide-gray-200 text-sm lg:mt-0 lg:col-span-5">
                        <div class="pb-4 flex items-center justify-between">
                            <dt class="text-gray-600">Subtotal</dt>
                            <dd class="font-medium text-gray-900">RM
                                <asp:Label runat="server" ID="lblSubtotal" Text="" /></dd>
                        </div>
                        <div class="py-4 flex items-center justify-between">
                            <dt class="text-gray-600">Shipping</dt>
                            <dd class="font-medium text-gray-900">RM
                                <asp:Label runat="server" ID="lblShippingFee" Text="" /></dd>
                        </div>
                        <div class="py-4 flex items-center justify-between">
                            <dt class="text-gray-600">Discount
                                <asp:Label runat="server" ID="lblVoucherCode" Text="" /></dt>
                            <dd class="font-medium text-gray-900">
                                <asp:Label runat="server" ID="lblDiscount" Text="0.00" /></dd>
                        </div>
                        <div class="py-4 flex items-center justify-between">
                            <dt class="text-gray-600">Member Point Earned</dt>
                            <dd class="font-medium text-gray-900">
                                <asp:Label runat="server" ID="lblMemberPointEarned" Text="" /></dd>
                        </div>
                        <div class="pt-4 flex items-center justify-between">
                            <dt class="font-medium text-gray-900">Order total</dt>
                            <dd class="font-medium text-indigo-600">RM
                                <asp:Label runat="server" ID="lblTotal" Text="" /></dd>
                        </div>

                    </dl>
                </div>
            </div>
        </div>
    </div>

    <div id="hs-modal-cancel" class="hs-overlay hidden w-full h-full fixed top-0 start-0 z-[100] overflow-x-hidden overflow-y-auto">
        <div class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto">
            <div class="bg-white border border-gray-200 rounded-xl shadow-sm dark:bg-gray-800 dark:border-gray-700 ">
                <div class="p-4 sm:p-7">
                    <div class="p-4 text-center overflow-y-auto">
                        <!-- Icon -->
                        <span class="mb-4 inline-flex justify-center items-center w-[62px] h-[62px] rounded-full border-4 border-yellow-50 bg-yellow-100 text-yellow-500 dark:bg-yellow-700 dark:border-yellow-600 dark:text-yellow-100">
                            <svg class="flex-shrink-0 w-5 h-5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                            </svg>
                        </span>
                        <!-- End Icon -->
                        <h3 class="mb-2 text-2xl font-bold text-gray-800 dark:text-gray-200">Cancel Order
                        </h3>
                        <p class="text-gray-500">
                            Are you sure to cancel this order?
                        </p>
                    </div>

                    <%-- Form --%>
                    <div class="mt-5">
                        <div class="grid gap-y-4">
                            <div class="flex justify-end items-center gap-x-2 py-3 px-2">
                                <asp:Button runat="server"
                                    Text="Cancel Order"
                                    ID="btnCancelOrder" OnClick="btnCancelOrder_Click"
                                    class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                    data-hs-overlay="#hs-modal-cancel">
                                    Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
