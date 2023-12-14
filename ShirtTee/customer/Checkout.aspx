<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShirtTee.customer.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="grid sm:px-10 lg:grid-cols-2 lg:px-20 xl:px-32">
        <div class="px-4 pt-4">
            <p class="text-xl font-medium">Order Summary</p>

            <div class="mt-5 space-y-3 rounded-lg border bg-white px-2 py-4 sm:px-6">
                <div class="flex flex-row rounded-lg bg-white ">
                    <img class="m-2 h-24 w-28 rounded-md border object-cover object-center" src="https://images.unsplash.com/flagged/photo-1556637640-2c80d3201be8?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c25lYWtlcnxlbnwwfHwwfHw%3D&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60" alt="">
                    <div class="flex w-full flex-col px-4 py-4">
                        <span class="font-semibold">Nike Air Max Pro 8888 - Super Light</span>
                        <span class="float-right text-gray-400">XL - BLUE</span>
                        <span class="float-right text-gray-400">Quantity: 1</span>
                        <p class="text-lg font-bold">RM 138.99</p>
                    </div>
                </div>
                <div class="flex flex-row rounded-lg bg-white ">
                    <img class="m-2 h-24 w-28 rounded-md border object-cover object-center" src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c25lYWtlcnxlbnwwfHwwfHw%3D&amp;auto=format&amp;fit=crop&amp;w=500&amp;q=60" alt="">
                    <div class="flex w-full flex-col px-4 py-4">
                        <span class="font-semibold">Nike Air Max Pro 8888 - Super Light</span>
                        <span class="float-right text-gray-400">L</span>
                        <span class="float-right text-gray-400">Quantity: 1</span>
                        <p class="mt-auto text-lg font-bold">$238.99</p>
                    </div>
                </div>
            </div>

            <p class="mt-8 text-lg font-medium">Payment Methods</p>
            <div class="mt-5 grid gap-6">
                <div class="relative">
                    <!--css reason use html input and label, will use another asp:Label to pass value when submit the form-->
                    <input class="peer hidden" id="radio_1" type="radio" name="radio" checked="">
                    <span class="peer-checked:border-gray-700 absolute right-4 top-1/2 box-content block h-3 w-3 -translate-y-1/2 rounded-full border-8 border-gray-300 bg-white"></span>
                    <label class="peer-checked:border-2 peer-checked:border-gray-700 peer-checked:bg-gray-50 flex cursor-pointer select-none rounded-lg border border-gray-300 p-4" for="radio_1">
                        <img class="w-14 object-contain" src="../Image/fpxlogo.png" alt="">
                        <div class="ml-5">
                            <span class="mt-2 font-semibold">Online Banking</span>
                            <p class="text-slate-500 text-sm leading-6">FPX, GrabPay, Credit/Debit Card etc.</p>
                        </div>
                    </label>
                </div>
                <div class="relative">
                    <input class="peer hidden" id="radio_2" type="radio" name="radio" checked="">
                    <span class="peer-checked:border-gray-700 absolute right-4 top-1/2 box-content block h-3 w-3 -translate-y-1/2 rounded-full border-8 border-gray-300 bg-white"></span>
                    <label class="peer-checked:border-2 peer-checked:border-gray-700 peer-checked:bg-gray-50 flex cursor-pointer select-none rounded-lg border border-gray-300 p-4" for="radio_2">
                        <img class="w-14 object-contain" src="../Image/paypal.png" alt="">
                        <div class="ml-5">
                            <span class="mt-2 font-semibold">PayPal</span>
                            <p class="text-slate-500 text-sm leading-6">Credit/Debit Card</p>
                        </div>
                    </label>
                </div>
            </div>
        </div>

        <div class="mt-10 mx-4 rounded bg-gray-50 px-6 pt-6 lg:mt-0">
            <p class="text-xl font-medium">Shipping Details</p>
            <p class="text-gray-400">Complete your order by providing your shipping details.</p>
            <div class="">
                <label for="email" class="mt-4 mb-2 block text-sm font-medium">Email</label>
                <div class="relative">
                    <asp:TextBox id="email" runat="server" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="your.email@gmail.com" TextMode="Email" />
                    <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                        </svg>
                    </div>
                </div>
                <label for="name" class="mt-4 mb-2 block text-sm font-medium">Name</label>

                <div class="relative">
                    <asp:TextBox runat="server" id="name" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm uppercase shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Your full name here"/>
                    <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z"></path>
                        </svg>
                    </div>
                </div>
                <label for="addressLine1" class="mt-4 mb-2 block text-sm font-medium">Address Line 1</label><div class="relative">
                    <asp:TextBox runat="server" id="addressLine1" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm uppercase shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Address Line 1"/>
                    <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">

                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-geo-alt text-gray-400" viewBox="0 0 16 16">
                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                        </svg>
                    </div>
                </div>
                <label for="addressLine2" class="mt-4 mb-2 block text-sm font-medium">Address Line 2 (optional)</label>
                <div class="relative">
                    <asp:TextBox runat="server" id="addressLine2" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm uppercase shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Address Line 2"/>
                    <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-geo-alt text-gray-400" viewBox="0 0 16 16">
                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                        </svg>
                    </div>
                </div>


                <label for="city/postalCode" class="mt-4 mb-2 block text-sm font-medium">City / Postal Code</label>
                <div class="flex flex-col sm:flex-row items-center sm:space-y-0 sm:space-x-4">


                    <asp:TextBox runat="server" class="w-full sm:w-1/2 sm:mt-0 mt-2 rounded-md border border-gray-200 px-4 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500 sm:self-stretch" placeholder="City"/>
                    <asp:TextBox runat="server" class="w-full sm:w-1/2 sm:mt-0 mt-2 rounded-md border border-gray-200 px-4 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500 sm:self-stretch" placeholder="Postal Code"/>
                </div>
                <label for="state/country" class="mt-4 mb-2 block text-sm font-medium">State / Country</label>
                <div class="flex flex-col sm:flex-row items-center sm:space-y-0 sm:space-x-4">
                    <asp:DropDownList runat="server"  class="w-full sm:w-1/2 rounded-md border border-gray-200 px-4 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" >
                        <asp:ListItem>State</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox runat="server" class="w-full sm:w-1/2 sm:mt-0 mt-2 rounded-md border border-gray-200 px-4 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500 sm:self-stretch" placeholder="Country"/>
                </div>

                <!-- Total -->
                <div class="mt-6 border-t border-b py-2">
                    <div class="flex items-center justify-between">
                        <p class="text-sm font-medium text-gray-900">Subtotal</p>
                        <p class="font-semibold text-gray-900">RM 399.00</p>
                    </div>

                    <div class="flex items-center justify-between">
                        <p class="text-sm font-medium text-gray-900">Shipping</p>
                        <p class="font-semibold text-gray-900">RM 8.00</p>
                    </div>
                    <div class="flex items-center justify-between">
                        <p class="text-sm font-medium text-gray-900">Discount</p>
                        <p class="font-semibold text-gray-900">- RM 8.00</p>
                    </div>
                </div>
                <div class="mt-6 flex items-center justify-between">
                    <p class="text-sm font-medium text-gray-900">Total</p>
                    <p class="text-2xl font-semibold text-gray-900">RM 408.00</p>
                </div>
            </div>
            <asp:Button ID="btnHidden" runat="server" CssClass="hidden" OnClick="btnHidden_Click" Visible="False" />
            <asp:Button ID="btnPlaceOrder" runat="server" class="mt-4 mb-8 w-full rounded-md hover:bg-gray-700 bg-gray-900 px-6 py-3 font-medium text-white" Text="PLACE ORDER" OnClick="btnPlaceOrder_Click" />
        </div>


    </div>

    <script>
        function isFPXChecked() {
            var radFPX = document.getElementById("radio_1");
            return radFPX.checked;
        }
        document.addEventListener('DOMContentLoaded', function () {
            var form = document.getElementById("form1");
            form.addEventListener('submit', function (e) {
                if (isFPXChecked()) {
                    e.preventDefault();

                    // Make an AJAX request to your server handler to get the Stripe public key
                    fetch('/StripePublicKeyHandler.ashx', {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                            // Include any necessary authentication headers if required
                        },
                    })
                        .then(response => response.json())
                        .then(data => {
                            var stripe = Stripe(data.stripePublicKey);
                            stripe.redirectToCheckout({
                                sessionId: "<%= sessionId %>"
                            });
                        })
                        .catch(error => console.error('Error fetching Stripe public key:', error));
                }
                else {
                    return;
                }
            });
        });

    </script>


</asp:Content>
