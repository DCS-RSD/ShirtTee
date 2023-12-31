<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShirtTee.customer.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-h-full bg-white pb-10 pt-5 xl:px-16 lg:px-12 px-8">
        <h1 class="mb-10 ml-20 max-lg:ml-0 text-left text-3xl font-bold">YOUR CART</h1>
        <div class="mx-16 justify-center md:flex max-lg:mx-auto md:space-x-6 xl:px-0">
            <div class="rounded-lg md:w-2/3">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Cart] AS c
INNER JOIN [Product_Details] AS d
ON c.product_details_ID = d.product_details_ID
INNER JOIN [Product] AS p
ON d.product_ID = p.product_ID
INNER JOIN [Color] AS o
ON d.color_ID = o.color_ID
INNER JOIN [Size] AS s
ON d.size_ID = s.size_ID
WHERE user_ID = @user_ID">
                    <SelectParameters>
                        <asp:SessionParameter SessionField="user_ID" Name="user_ID"></asp:SessionParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" EnableViewState="True">
                    <ItemTemplate>
                        <div class="justify-between mb-6 rounded-lg bg-white p-6 shadow-md sm:flex sm:justify-start">
                            <asp:Label runat="server" ID="lblProductID" Text='<%# Eval("product_ID") %>' Visible="False" />
                                           <asp:Label runat="server" ID="lblProductDetailsID" Text='<%# Eval("product_details_ID") %>' Visible="False" />

                            <asp:Image runat="server" ImageUrl='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>'  AlternateText='<%# Eval("product_name") %>' class="w-full rounded-lg sm:w-40 sm:h-40" />
                            <div class="sm:ml-4 sm:flex sm:w-full sm:justify-between">
                                <div class="mt-5 sm:mt-0">
                                    <h2 class="text-lg font-bold text-gray-900"><%# Eval("product_name") %></h2>
                                  
                                    <p class="mt-1 text-base text-gray-700"><%# Eval("color_name") %></p>
                                    <p class="mt-1 text-base text-gray-700"><%# Eval("size_name") %></p>
                                     <p class="mt-1 text-base text-gray-700">RM <asp:Label runat="server" ID="lblPrice" Text="" /></p>
                                    <asp:Label runat="server" ID="lblLowStock" Visible="false" Text="Only left " class="mt-1 text-red-500 text-base italic font-semibold"><p class="inline-flex"><%# Eval("stock_available") %> stock</p> </asp:Label>
                                </div>
                                <div class="mt-4 flex justify-between sm:space-y-6 sm:mt-0 sm:block sm:space-x-6">
                                    <asp:DropDownList ID="ddlQty" runat="server" OnSelectedIndexChanged="ddlQty_SelectedIndexChanged" class="ml-8 max-w-full rounded-md border border-gray-300 py-1.5 text-base leading-5 font-medium text-gray-700 text-left shadow-sm focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" AutoPostBack="True">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="flex items-center space-x-4">
                                        <p class="text-sm">
                                            RM
                                            <asp:Label ID="lblEachSubtotal" runat="server" Text="" />
                                        </p>
                                        <div id="removeItemDiv" class="remove-item">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-5 w-5 cursor-pointer duration-150 hover:text-red-500">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
                                            </svg>
                                            <asp:Button runat="server" OnClick="btnRemoveItem_Click" ID="btnRemoveItem" class="hidden btnRemoveItem" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- Sub total -->
            <div class="mt-6 h-full rounded-lg border bg-white p-6 shadow-md md:mt-0 md:w-1/3">
                <div class="mb-2 flex justify-between">
                    <p class="text-gray-700 text-xl font-bold">Order Summary</p>

                </div>
                <div class="mb-2 flex justify-between">
                    <p class="text-gray-700"></p>

                </div>
                <div class="mb-2 flex justify-between">
                    <p class="text-gray-700">Subtotal</p>
                    <p class="text-gray-700">
                        RM
                        <asp:Label ID="lblSubtotal" runat="server" Text="0.00" />
                    </p>
                </div>
                <div class="flex justify-between">
                    <p class="text-gray-700">Shipping</p>
                    <p class="text-gray-700">
                        RM
                        <asp:Label ID="lblShipping" runat="server" Text="0.00" />
                    </p>
                </div>
                <div class="flex justify-between">
                    <p class="text-gray-700">Discount</p>
                    <p class="text-gray-700">
                        - RM
                        <asp:Label ID="lblDiscount" runat="server" Text="0.00" />
                    </p>
                </div>
                <div class="flex justify-between">
                    <asp:Label runat="server" ID="lblDisplayVoucher" Visible="false" class="rounded-full pt-1.5 bg-gray-200 text-xs text-gray-600 mt-2 py-1.5 px-3">
                        <asp:Label ID="lblDiscountCode" runat="server" Text="" /></asp:Label>
                </div>


                <hr class="my-4">
                <div class="flex justify-between">
                    <p class="text-lg font-bold">Total</p>
                    <div>
                        <p class="mb-1 text-lg font-bold">
                            RM 
                            <asp:Label ID="lblTotal" runat="server" Text="0.00" />
                        </p>

                    </div>
                </div>
                <div class="flex items-center  pt-5 pb-3">
                    <asp:TextBox ID="txtVoucherCode" runat="server" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" placeholder="Apply Promo Code" />

                </div>
                <div id="applyDiv" class="flex justify-between py-3 px-4 w-full inline-flex items-center gap-x-2 text-sm font-bold rounded-lg border-2 border-gray-300 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                    APPLY
 <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
     <path d="M5 12h14" />
     <path d="m12 5 7 7-7 7" />
 </svg>
                    <asp:Button runat="server" class="hidden" ID="btnApply" OnClick="btnApply_Click" />
                </div>
                <div runat="server" id="successDiv" style="display: none" class="mt-4  bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-gray-800 dark:border-gray-700" role="alert">
                    <div class="flex p-4">
                        <div class="flex-shrink-0">
                            <svg class="flex-shrink-0 h-4 w-4 text-teal-500 mt-0.5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                            </svg>
                        </div>
                        <div class="ms-3">
                            <asp:Label runat="server" ID="lblVoucherMsg" class="text-sm text-gray-700 dark:text-gray-400 font-semibold" Text="" />
                        </div>
                    </div>
                </div>
                <div runat="server" id="failedDiv" style="display: none" class="mt-4  bg-white border border-gray-200 rounded-xl shadow-lg dark:bg-gray-800 dark:border-gray-700" role="alert">
                    <div class="flex p-4">
                        <div class="flex-shrink-0">
                            <svg class="flex-shrink-0 h-4 w-4 text-red-500 mt-0.5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
                            </svg>
                        </div>
                        <div class="ms-3">
                            <asp:Label runat="server" ID="lblErrorMsg" class="text-sm text-gray-700 dark:text-gray-400 font-semibold" Text="" />

                        </div>
                    </div>
                </div>
                <div class="mt-6">
                    <asp:Button runat="server" Visible="true" ID="btnCheckout"  OnClick="btnCheckout_Click" class="w-full bg-gray-900 border border-transparent rounded-md shadow-sm py-3 px-4 text-base font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-gray-500 " Text="CHECKOUT"></asp:Button>
                    <asp:Button runat="server" Visible="false" ID="btnDisabledChkOut" class="w-full bg-indigo-600 border border-transparent rounded-md shadow-sm py-3 px-4 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed" disabled Text="Checkout"></asp:Button>
                </div>
            </div>
        </div>
    </div>



    <script>
        document.getElementById('applyDiv').addEventListener('click', function () {
            document.getElementById('<%= btnApply.ClientID %>').click();
        });
        document.querySelectorAll('.remove-item').forEach(function (removeItemDiv) {
            removeItemDiv.addEventListener('click', function () {
                // Find the associated button within the clicked div
                var btnRemoveItem = removeItemDiv.querySelector('.btnRemoveItem');

                // Trigger the click event of the button
                btnRemoveItem.click();
            });
        });

    </script>
</asp:Content>
