<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShirtTee.customer.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="max-h-full bg-white pb-10 pt-5 xl:px-16 lg:px-12 px-8">
        <h1 class="mb-10 ml-20 max-lg:ml-0 text-left text-3xl font-bold">YOUR CART</h1>
        <div class="mx-16 justify-center md:flex max-lg:mx-auto md:space-x-6 xl:px-0">
            <div class="rounded-lg md:w-2/3">
                <div class="justify-between mb-6 rounded-lg bg-white p-6 shadow-md sm:flex sm:justify-start">
                    <img src="https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1170&amp;q=80" alt="product-image" class="w-full rounded-lg sm:w-40">
                    <div class="sm:ml-4 sm:flex sm:w-full sm:justify-between">
                        <div class="mt-5 sm:mt-0">
                            <h2 class="text-lg font-bold text-gray-900">Nike Air Max 2019</h2>

                            <p class="mt-1 text-xs text-gray-700">Blue</p>
                            <p class="mt-1 text-xs text-gray-700">XL</p>
                        </div>
                        <div class="mt-4 flex justify-between sm:space-y-6 sm:mt-0 sm:block sm:space-x-6">
                  <select id="quantity-0" name="quantity-0" class="ml-8 max-w-full rounded-md border border-gray-300 py-1.5 text-base leading-5 font-medium text-gray-700 text-left shadow-sm focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                  </select>
                            <div class="flex items-center space-x-4">
                                <p class="text-sm">RM 159.00</p>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="h-5 w-5 cursor-pointer duration-150 hover:text-red-500">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
                <!--More items-->
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
                    <p class="text-gray-700">RM 129.99</p>
                </div>
                <div class="flex justify-between">
                    <p class="text-gray-700">Shipping</p>
                    <p class="text-gray-700">RM 4.99</p>
                </div>
                                <div class="flex justify-between">
                    <p class="text-gray-700">Discount</p>

                    <p class="text-gray-700">- RM 4.99</p>
                </div>
                                                <div class="flex justify-between">
<span class="rounded-full pt-1.5 bg-gray-200 text-xs text-gray-600 mt-2 py-1.5 px-3">STUDENT50</span>                </div>


                <hr class="my-4">
                <div class="flex justify-between">
                    <p class="text-lg font-bold">Total</p>
                    <div class="">
                        <p class="mb-1 text-lg font-bold">RM 134.99</p>
                    </div>
                </div>
                <div class="flex items-center  pt-5 pb-3">
                    <asp:TextBox runat="server" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" placeholder="Apply Promo Code"/>
                
                </div>
                <div id="applyDiv" class="flex justify-between py-3 px-4 w-full inline-flex items-center gap-x-2 text-sm font-bold rounded-lg border-2 border-gray-300 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
                    APPLY
 <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
     <path d="M5 12h14" />
     <path d="m12 5 7 7-7 7" />
 </svg>
                    <asp:Button runat="server" class="hidden" ID="btnApply"/>
                </div>
<div class="mt-6">
            <asp:Button runat="server" ID="btnCheckout" OnClick="btnCheckout_Click" class="w-full bg-indigo-600 border border-transparent rounded-md shadow-sm py-3 px-4 text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500" Text="Checkout"></asp:Button>
          </div>            </div>
        </div>
    </div>

    <script>
        document.getElementById('applyDiv').addEventListener('click', function () {
            document.getElementById('<%= btnApply.ClientID %>').click();
    });

    </script>
</asp:Content>
