<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShirtTee.customer.Checkout" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://js.stripe.com/v3/"></script>

    <div class="grid sm:px-10 lg:grid-cols-2 lg:px-20 xl:px-32">
        <div class="px-4 pt-4">
            <p class="text-xl font-medium">Order Summary</p>

            <div class="mt-5 space-y-3 rounded-lg border bg-white px-2 py-4 sm:px-6">
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
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                    <ItemTemplate>
                        <div class="flex flex-row rounded-lg bg-white ">
                            <img class="m-2 h-24 w-28 rounded-md border object-cover object-center" src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>' alt="<%# Eval("product_name") %>">
                            <div class="flex w-full flex-col px-4 py-4">
                                <span class="font-semibold"><%# Eval("product_name") %></span>
                                <span class="float-right text-gray-400"><%# Eval("size_name") %> - <%# Eval("color_name") %></span>
                                <span class="float-right text-gray-400">Price: RM
                                    <asp:Label ID="lblPrice" runat="server" Text="" /></span>
                                <span class="float-right text-gray-400">Quantity: <%# Eval("quantity") %>
                                    <asp:Label runat="server" class="text-red-500 italic font-semibold" ID="lblLowStock" Text="Insufficient Stock" Visible="false" /></span>
                                <p class="text-lg font-bold">
                                    RM
                                    <asp:Label ID="lblEachSubtotal" runat="server" Text="" />
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>

            <p class="mt-8 text-lg font-medium">Payment Methods</p>
            <div class="mt-5 grid gap-6 mb-10">
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
            </div>
        </div>
        <form id="form2">
            <div class="mt-10 mb-8 mx-4 rounded bg-gray-50 px-6 pt-6 lg:mt-0 " style="max-height: 795px;">
                <p class="text-xl font-medium">Shipping Details</p>
                <p class="text-gray-400">Complete your order by providing your shipping details.</p>
                <div class="">

                    <label for="addressLine1" class="mt-4 mb-2 block text-sm font-medium">Address Line 1</label><div class="relative">
                        <asp:TextBox runat="server" ID="txtAddressLine1" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Address Line 1" />
                        <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">

                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-geo-alt text-gray-400" viewBox="0 0 16 16">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                            </svg>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvAddressLine1" ValidationGroup="CheckOutValidation" ControlToValidate="txtAddressLine1" class="text-sm italic" runat="server" ErrorMessage="Please fill in your address line 1." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>


                    <label for="addressLine2" class="mt-4 mb-2 block text-sm font-medium">Address Line 2 (optional)</label>
                    <div class="relative">
                        <asp:TextBox runat="server" ID="txtAddressLine2" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm  shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Address Line 2" />

                        <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-geo-alt text-gray-400" viewBox="0 0 16 16">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                            </svg>
                        </div>
                    </div>



                    <label for="city/postalCode" class="mt-4 mb-2 block text-sm font-medium">City</label>
                    <div class="relative">
                        <asp:TextBox runat="server" ID="txtCity" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm  shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="City" />

                        <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-geo-alt text-gray-400" viewBox="0 0 16 16">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                            </svg>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="CheckOutValidation" ControlToValidate="txtCity" class="text-sm italic" runat="server" ErrorMessage="Please fill in your city." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>




                    <label for="city/postalCode" class="mt-4 mb-2 block text-sm font-medium">Postal Code</label>
                    <div class="relative">
                        <asp:TextBox runat="server" ID="txtPostalCode" TextMode="Number" class="w-full rounded-md border border-gray-200 px-4 py-3 pl-11 text-sm  shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500" placeholder="Postal Code" />

                        <div class="pointer-events-none absolute inset-y-0 left-0 inline-flex items-center px-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-geo-alt text-gray-400" viewBox="0 0 16 16">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"></path>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"></path>
                            </svg>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="CheckOutValidation" ControlToValidate="txtPostalCode" class="text-sm italic" runat="server" ErrorMessage="Please fill in your postal code." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexValidator" runat="server"
    ControlToValidate="txtPostalCode"
    ErrorMessage="Please enter correct postal code."
    ValidationExpression="^(?!00000)\d{5}$"
    Display="Dynamic" ForeColor="Red" CssClass="text-sm italic" ValidationGroup="CheckOutValidation">
</asp:RegularExpressionValidator>

                    <label for="state/country" class="mt-4 mb-2 block text-sm font-medium">State / Country</label>
                    <div class="flex flex-col sm:flex-row items-center sm:space-y-0 sm:space-x-4">
                        <asp:DropDownList OnSelectedIndexChanged="ddlState_SelectedIndexChanged" ID="ddlState" runat="server" class="w-full sm:w-1/2 rounded-md border border-gray-200 px-4 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500">
                            <asp:ListItem>Johor</asp:ListItem>
                            <asp:ListItem>Kedah</asp:ListItem>
                            <asp:ListItem>Kelantan</asp:ListItem>
                            <asp:ListItem>Kuala Lumpur</asp:ListItem>
                            <asp:ListItem>Labuan</asp:ListItem>
                            <asp:ListItem>Melaka</asp:ListItem>
                            <asp:ListItem>Negeri Sembilan</asp:ListItem>
                            <asp:ListItem>Pahang</asp:ListItem>
                            <asp:ListItem>Perak</asp:ListItem>
                            <asp:ListItem>Perlis</asp:ListItem>
                            <asp:ListItem>Pulau Pinang</asp:ListItem>
                            <asp:ListItem>Putrajaya</asp:ListItem>
                            <asp:ListItem>Sabah</asp:ListItem>
                            <asp:ListItem>Sarawak</asp:ListItem>
                            <asp:ListItem>Selangor</asp:ListItem>
                            <asp:ListItem>Terengganu</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox runat="server" ID="txtCountry" Text="Malaysia" disabled class="disabled:cursor-not-allowed w-full sm:w-1/2 sm:mt-0 mt-2 rounded-md border border-gray-200 px-4 py-3 text-sm shadow-sm outline-none focus:z-10 focus:border-blue-500 focus:ring-blue-500 sm:self-stretch" placeholder="Country" />
                    </div>
                    <asp:Label runat="server" ID="errState" Text="" class="italic text-red-500"></asp:Label>
                    
                    <!-- Total -->
                    <div class="mt-6 border-t border-b py-2">
                        <div class="flex items-center justify-between">
                            <p class="text-sm font-medium text-gray-900">Subtotal</p>
                            <p class="font-semibold text-gray-900">
                                RM
                            <asp:Label ID="lblSubtotal" runat="server" Text="" />
                            </p>
                        </div>

                        <div class="flex items-center justify-between">
                            <p class="text-sm font-medium text-gray-900">Shipping</p>
                            <p class="font-semibold text-gray-900">
                                RM
                            <asp:Label ID="lblShipping" runat="server" Text="" />
                            </p>
                        </div>
                        <div class="flex items-center justify-between">
                            <p class="text-sm font-medium text-gray-900">
                                Discount
                                <asp:Label ID="lblVoucherCode" runat="server" Text="" />
                            </p>
                            <p class="font-semibold text-gray-900">
                                - RM
                            <asp:Label ID="lblDiscount" runat="server" Text="" />
                            </p>
                        </div>
                    </div>
                    <div class="mt-6 flex items-center justify-between">
                        <p class="text-sm font-medium text-gray-900">Total</p>
                        <p class="text-2xl font-semibold text-gray-900">
                            RM
                        <asp:Label ID="lblTotal" runat="server" Text="" />
                        </p>
                    </div>
                </div>
                <asp:Button ID="btnPlaceOrder" ValidationGroup="CheckOutValidation" CausesValidation="true" runat="server" class="mt-4 mb-4 w-full rounded-md hover:bg-gray-700 bg-gray-900 px-6 py-3 font-medium text-white" Text="PLACE ORDER" OnClick="btnPlaceOrder_Click" />
                <div class="text-center mb-4">
                    <asp:Label ID="lblWarning" runat="server" class="italic font-semibold text-lg text-red-500 mt-2" Visible="false" Text="Cannot proceed due to insufficient stock."></asp:Label>

                </div>

            </div>
        </form>

    </div>



    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>



    <script>
        
        function isFPXChecked() {
            var radFPX = document.getElementById("radio_1");
            return radFPX.checked;
        }

        function submitAPI() {
            if (isFPXChecked()) {
                
                Page_ClientValidate();


                console.log("hi");
                if (Page_IsValid) {
                    //e.preventDefault();
                    console.log("vlaid");
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
                    console.log("error");
                }

            }

            else {
                return;
            }
        };

    </script>

</asp:Content>
