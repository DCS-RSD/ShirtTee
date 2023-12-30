<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="ShirtTee.customer.Review" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bg-gray-50 dark:bg-slate-900">

        <main id="content" role="main">
            <div class="bg-white">
                <div class="max-w-7xl mx-auto sm:px-2 lg:px-8 pt-2">
                    <div class="px-16 space-y-8 sm:px-8">
                        <h2 class="text-2xl text-gray-800 font-bold sm:text-3xl dark:text-white">My Reviews</h2>
                    </div>
                </div>

                <div class="pb-14">
                    <div class="mt-8">
                        <h2 class="sr-only">Recent orders</h2>

                        <div class="max-w-7xl mx-auto sm:px-2 lg:px-8">
                            <div class="px-16 space-y-8 sm:px-8">

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Review] AS r
INNER JOIN [Product_Details] AS pd ON r.product_details_ID = pd.product_details_ID
INNER JOIN [Product] AS p ON pd.product_ID = p.product_ID 
INNER JOIN [Color] AS c ON pd.color_ID = c.color_ID
INNER JOIN [Size] AS s ON pd.size_ID = s.size_ID
WHERE r.user_ID = @user_ID AND
review_date =  (SELECT MAX(review_date) FROM [Review] WHERE order_ID = r.order_ID AND product_details_ID = r.product_details_ID)
ORDER BY review_date DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="user_ID" Name="user_ID"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="bg-white border-t border-b border-gray-200 shadow-sm rounded-lg border">

                                            <div class="flex items-center p-4 border-b border-gray-200 sm:p-6 sm:grid sm:grid-cols-4 sm:gap-x-6">
                                                <dl class="flex-1 grid grid-cols-2 gap-x-6 text-sm sm:col-span-3 sm:grid-cols-3 lg:col-span-2">
                                                    <div>
                                                        <dt class="font-medium text-gray-900">Order number</dt>
                                                        <dd class="mt-1 text-gray-500"><%# Eval("order_ID") %></dd>
                                                        <asp:Label runat="server" Text='<%# Eval("order_ID") %>' ID="lblOrderID" Visible="false" />
                                                        <asp:Label runat="server" Visible="false" ID="lblProductDetailsID" Text='<%# Eval("product_details_ID") %>' />

                                                    </div>
                                                </dl>

                                                <div class="relative flex justify-end lg:hidden">
                                                    <div class="flex items-center">
                                                        <button type="button" class="-m-2 p-2 flex items-center text-gray-400 hover:text-gray-500" id="menu-0-button" aria-expanded="false" aria-haspopup="true">
                                                            <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                                                            </svg>
                                                        </button>
                                                    </div>

                                                    <div class="hidden origin-bottom-right absolute right-0 mt-2 w-40 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="menu-0-button" tabindex="-1">
                                                        <div class="py-1" role="none">
                                                            <asp:Button runat="server" ID="btnEditReview" Visible="false" OnClick="btnEditReview_Click" class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" TabIndex="-1" Text="Edit Review"></asp:Button>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="hidden lg:col-span-2 lg:flex lg:items-center lg:justify-end lg:space-x-4">

                                                    <asp:Button runat="server" ID="btnEditReview2" Visible="false" OnClick="btnEditReview_Click" class="flex items-center justify-center bg-white py-2 px-2.5 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" Text="Edit Review"></asp:Button>
                                                </div>
                                            </div>

                                            <!-- Products -->
                                            <h4 class="sr-only">Items</h4>
                                            <ul role="list" class="divide-y divide-gray-200">
                                                <li class="p-4 sm:p-6">
                                                    <div class="flex items-center sm:items-start">
                                                        <div class="flex-shrink-0 w-20 h-20 bg-gray-200 rounded-lg overflow-hidden sm:w-40 sm:h-40">
                                                            <img src='<%# "data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("thumbnail")) %>' alt='<%# Eval("product_name") %>' class="w-full h-full object-center object-cover">
                                                        </div>
                                                        <div class="flex-1 ml-6 text-sm">
                                                            <div class="font-medium text-gray-900 sm:flex sm:justify-between">
                                                                <h5><%# Eval("product_name") %></h5>
                                                                <p class="mt-2 sm:mt-0">RM <%# Eval("price") %></p>
                                                            </div>
                                                            <p class="mt-2 text-gray-500 ">
                                                                Quantity:
                                                                <asp:Label runat="server" ID="lblQuantity" Text="" />
                                                            </p>
                                                            <p class="mt-1 text-gray-500"><%# Eval("color_name") %> / <%# Eval("size_name") %></p>
                                                            <p class="mt-3 text-sm font-bold text-gray-900">
                                                                Total: RM
                                                                <asp:Label runat="server" ID="lblTotal" Text="" />
                                                            </p>
                                                        </div>
                                                    </div>

                                                    <div class="mt-6 sm:flex sm:justify-between">
                                                        <div class="flex items-center">
                                                            <!-- Heroicon name: solid/check-circle -->
                                                            <svg class="w-5 h-5 text-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                                            </svg>
                                                            <asp:Label runat="server" ID="lblReviewDate" class="ml-2 text-sm font-medium text-gray-500" Text=""></asp:Label>
                                                        </div>
                                                        <!--
                                                <div class="mt-6 border-t border-gray-200 pt-4 flex items-center space-x-4 divide-x divide-gray-200 text-sm font-medium sm:mt-0 sm:ml-4 sm:border-none sm:pt-0">
                                                    
                                                    <div class="flex-1 flex justify-center">
                                                        <asp:Button runat="server" ID="btnWriteReview" class="text-indigo-600 whitespace-nowrap hover:text-indigo-500" Text="Write Review"></asp:Button>
                                                    </div>
                                                    
                                                    <div class="flex-1 pl-4 flex justify-center">
                                                        <a href="#" class="text-indigo-600 whitespace-nowrap hover:text-indigo-500">Buy Again</a>
                                                    </div>
                                                      
                                                </div>
                                                      -->
                                                    </div>
                                                </li>
                                                <li class="p-4 sm:p-6">
                                                    <div class="bg-white">
                                                        <div>

                                                            <div>
                                                                <div class="flex">
                                                                    <div class="">
                                                                        <div class="flex items-center">
                                                                            <div id="ratingStars" runat="server" class="flex items-center">
                                                                            </div>

                                                                        </div>

                                                                        <div class="mt-4">


                                                                            <div class=" space-y-6 text-sm text-gray-500">

                                                                                <asp:Label runat="server" ID="lblReviewDesc" Text='' />
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>




    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get the dropdown button and menu
            const dropdownButton = document.getElementById('menu-0-button');
            const dropdownMenu = document.querySelector('.origin-bottom-right');

            // Add click event listener to the dropdown button
            dropdownButton.addEventListener('click', function () {
                // Toggle the 'hidden' class on the dropdown menu
                dropdownMenu.classList.toggle('hidden');

                // If the dropdown menu is visible, add the transition classes
                if (!dropdownMenu.classList.contains('hidden')) {
                    dropdownMenu.classList.add('transition', 'ease-out', 'duration-100', 'transform', 'opacity-100', 'scale-100');
                    dropdownMenu.classList.remove('ease-in', 'duration-75', 'opacity-0', 'scale-95');
                } else {
                    // If the dropdown menu is hidden, add the transition classes
                    dropdownMenu.classList.add('transition', 'ease-in', 'duration-75', 'opacity-0', 'scale-95');
                    dropdownMenu.classList.remove('ease-out', 'duration-100', 'opacity-100', 'scale-100');
                }
            });
        });
    </script>



</asp:Content>
