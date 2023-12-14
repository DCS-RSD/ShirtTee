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
                                <div class="bg-white border-t border-b border-gray-200 shadow-sm rounded-lg border">
                                    <h3 class="sr-only">Order placed on <time datetime="2021-07-06">Jul 6, 2021</time></h3>

                                    <div class="flex items-center p-4 border-b border-gray-200 sm:p-6 sm:grid sm:grid-cols-4 sm:gap-x-6">
                                        <dl class="flex-1 grid grid-cols-2 gap-x-6 text-sm sm:col-span-3 sm:grid-cols-3 lg:col-span-2">
                                            <div>
                                                <dt class="font-medium text-gray-900">Order number</dt>
                                                <dd class="mt-1 text-gray-500">WU88191111</dd>
                                            </div>
                                        </dl>

                                        <div class="relative flex justify-end lg:hidden">
                                            <div class="flex items-center">
                                                <button type="button" class="-m-2 p-2 flex items-center text-gray-400 hover:text-gray-500" id="menu-0-button" aria-expanded="false" aria-haspopup="true">
                                                    <span class="sr-only">Options for order WU88191111</span>
                                                    <!-- Heroicon name: outline/dots-vertical -->
                                                    <svg class="w-6 h-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
                                                    </svg>
                                                </button>
                                            </div>

                                            <!--
                  Dropdown menu, show/hide based on menu state.

                  Entering: "transition ease-out duration-100"
                    From: "transform opacity-0 scale-95"
                    To: "transform opacity-100 scale-100"
                  Leaving: "transition ease-in duration-75"
                    From: "transform opacity-100 scale-100"
                    To: "transform opacity-0 scale-95"
                -->
                                            <div class="hidden origin-bottom-right absolute right-0 mt-2 w-40 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="menu-0-button" tabindex="-1">
                                                <div class="py-1" role="none">
                                                    <!-- Active: "bg-gray-100 text-gray-900", Not Active: "text-gray-700" -->
                                                    <asp:Button runat="server" ID="btnViewOrder" class="text-gray-700 block px-4 py-2 text-sm" role="menuitem" TabIndex="-1" Text="Delete Review"></asp:Button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="hidden lg:col-span-2 lg:flex lg:items-center lg:justify-end lg:space-x-4">

                                            <asp:Button runat="server" ID="btnViewOrder2" class="flex items-center justify-center bg-white py-2 px-2.5 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" Text="Delete Review"></asp:Button>
                                        </div>
                                    </div>

                                    <!-- Products -->
                                    <h4 class="sr-only">Items</h4>
                                    <ul role="list" class="divide-y divide-gray-200">
                                        <li class="p-4 sm:p-6">
                                            <div class="flex items-center sm:items-start">
                                                <div class="flex-shrink-0 w-20 h-20 bg-gray-200 rounded-lg overflow-hidden sm:w-40 sm:h-40">
                                                    <img src="https://tailwindui.com/img/ecommerce-images/order-history-page-03-product-01.jpg" alt="Moss green canvas compact backpack with double top zipper, zipper front pouch, and matching carry handle and backpack straps." class="w-full h-full object-center object-cover">
                                                </div>
                                                <div class="flex-1 ml-6 text-sm">
                                                    <div class="font-medium text-gray-900 sm:flex sm:justify-between">
                                                        <h5>Micro Backpack</h5>
                                                        <p class="mt-2 sm:mt-0">$70.00</p>
                                                    </div>
                                                    <p class="mt-2 text-gray-500 ">Quantity: 1</p>
                                                    <p class="mt-1 text-gray-500">XL / BLACK</p>
                                                    <p class="mt-3 text-sm font-bold text-gray-900">Total: RM 300.00</p>
                                                </div>
                                            </div>

                                            <div class="mt-6 sm:flex sm:justify-between">
                                                <div class="flex items-center">
                                                    <!-- Heroicon name: solid/check-circle -->
                                                    <svg class="w-5 h-5 text-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                                    </svg>
                                                    <p class="ml-2 text-sm font-medium text-gray-500">Reviewed on <time datetime="2021-07-12">26-10-2023 17:04</time></p>
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
                                                                    <div class="flex items-center">
                                                                        <!--
                Heroicon name: solid/star

                Active: "text-yellow-400", Inactive: "text-gray-200"
              -->
                                                                        <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                                        </svg>

                                                                        <!-- Heroicon name: solid/star -->
                                                                        <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                                        </svg>

                                                                        <!-- Heroicon name: solid/star -->
                                                                        <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                                        </svg>

                                                                        <!-- Heroicon name: solid/star -->
                                                                        <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                                        </svg>

                                                                        <!-- Heroicon name: solid/star -->
                                                                        <svg class="text-yellow-400 h-5 w-5 flex-shrink-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                                                                        </svg>
                                                                    </div>
                                                                    <p class="ml-3 text-sm text-gray-700">5<span class="sr-only"> out of 5 stars</span></p>
                                                                </div>

                                                                <div class="mt-4">


                                                                    <div class=" space-y-6 text-sm text-gray-500">

                                                                        <p>The product quality is amazing, it looks and feel even better than I had anticipated. Brilliant stuff! I would gladly recommend this store to my friends. And, now that I think of it... I actually have, many times!</p>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        </div>

                                                        <!-- More reviews... -->
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- More products... -->
                                    </ul>
                                </div>

                                <!-- More orders... -->
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
