<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MainAdmin.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ShirtTee.admin.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Toast --%>
    <script>
        function showSuccessToast() {
            var status = '<%= Session["OrderStatusUpdated"] %>';
            console.log(status);
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Product added successfully.");
                } else {
                    toastr["error"]("Something went wrong.");
                }
            }
        <% Session.Remove("OrderStatusUpdated"); %>
        }
    </script>

    <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
    <asp:Panel ID="Panel1" runat="server">
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
                        <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg dark:bg-transparent dark:border-transparent">

                            <div class=" border-gray-200 py-6 px-4 sm:px-6 lg:p-8">
                                <div class="mt-6" aria-hidden="true">
                                    <div class="bg-gray-200 rounded-full overflow-hidden">
                                        <div runat="server" id="progressBar"
                                            class="h-2 bg-indigo-600 rounded-full">
                                        </div>
                                    </div>
                                    <div class="hidden sm:grid grid-cols-4 text-sm font-medium text-gray-600 mt-6">
                                        <div class="">Order placed</div>
                                        <div class="text-center">Preparing</div>
                                        <div class="text-center">Shipped</div>
                                        <div class="text-right">Delivered</div>
                                    </div>
                                </div>
                                <div class="mt-8 flex flex-row justify-end gap-x-4">
                                    <div>
                                        <asp:Button data-hs-overlay="#hs-modal-proceed" OnClientClick="return false"
                                            ID="btnNext" runat="server" Text="Proceed" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                    </div>
                                    <div>
                                        <asp:Button data-hs-overlay="#hs-modal-cancel" OnClientClick="return false"
                                            ID="btnCancel" runat="server" Text="Cancel" class="w-full justify-center py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-red-600 text-white hover:bg-red-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
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
                                                    <img src='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>' alt="" class="w-full h-full object-center object-cover sm:w-full sm:h-full">
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
INNER JOIN [Product_Details] AS s ON s.product_details_ID= od.product_details_ID
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


        <%-- Modal --%>
        <div id="hs-modal-proceed" class="hs-overlay hidden w-full h-full fixed top-0 start-0 z-[100] overflow-x-hidden overflow-y-auto">
            <div class="hs-overlay-open:mt-7 hs-overlay-open:opacity-100 hs-overlay-open:duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto">
                <div class="bg-white border border-gray-200 rounded-xl shadow-sm dark:bg-gray-800 dark:border-gray-700 ">
                    <div class="p-4 sm:p-7">
                        <div class="text-center">
                            <h2 class="block text-2xl font-bold text-gray-800 dark:text-gray-200">Proceed Order
                            </h2>
                            <p class="mt-2 text-sm text-gray-600 dark:text-gray-400">
                                Update To Next Order Status
                            </p>
                        </div>

                        <%-- Form --%>
                        <div class="mt-5">
                            <div class="grid gap-y-4">
                                <div>
                                    <label for="txtUpdateStatusDesc" class="block text-sm mb-2 dark:text-white">Description <i class="font-light">*visible to customer</i></label>
                                    <div class="relative">
                                        <asp:TextBox runat="server"
                                            ID="txtUpdateStatusDesc"
                                            class="cInput"
                                            TextMode="MultiLine"
                                            Rows="3" />
                                    </div>
                                </div>
                                <div class="flex justify-end items-center gap-x-2 py-3 px-2">
                                    <asp:Button runat="server"
                                        Text="Update Status"
                                        ID="btnSubmitNewStatus" OnClick="btnSubmitNewStatus_Click"
                                        class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"></asp:Button>
                                    <button type="button" class="py-2 px-3 inline-flex items-center gap-x-2 text-sm font-medium rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                        data-hs-overlay="#hs-modal-proceed">
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- End of Modal --%>


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
    </asp:Panel>
</asp:Content>
