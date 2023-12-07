<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="ShirtTee.customer.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-gray-50">
  <div class=" mx-auto pt-8 pb-12 px-8 lg:max-w-7xl lg:px-12">
    <div class="px-4 space-y-2 sm:px-0 sm:flex sm:items-baseline sm:justify-between sm:space-y-0">
      <div class="flex sm:items-baseline sm:space-x-4">
        <h1 class="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">Order #54879</h1>
      </div>
      <p class="text-sm text-gray-600">Order placed <time datetime="2021-03-22" class="font-medium text-gray-900">March 22, 2021</time></p>
      <a href="#" class="text-sm font-medium text-indigo-600 hover:text-indigo-500 sm:hidden">View invoice<span aria-hidden="true"> &rarr;</span></a>
    </div>

    <!-- Products -->
    <div class="mt-6">
      <h2 class="sr-only">Products purchased</h2>

      <div class="space-y-8">
        <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">

          <div class=" border-gray-200 py-6 px-4 sm:px-6 lg:p-8">
            <h4 class="sr-only">Status</h4>
            <p class="text-sm font-medium text-gray-900">Preparing to ship on <time datetime="2021-03-24">March 24, 2021</time></p>
            <div class="mt-6" aria-hidden="true">
              <div class="bg-gray-200 rounded-full overflow-hidden">
                <div class="h-2 bg-indigo-600 rounded-full" style="width: calc((1 * 2 + 1) / 8 * 100%)"></div>
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
          <div class="py-6 px-4 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
            <div class="sm:flex lg:col-span-7">
              <div class="flex-shrink-0 w-full aspect-w-1 aspect-h-1 rounded-lg overflow-hidden sm:aspect-none sm:w-40 sm:h-40">
                <img src="https://tailwindui.com/img/ecommerce-images/confirmation-page-03-product-02.jpg" alt="Arm modeling wristwatch with black leather band, white watch face, thin watch hands, and fine time markings." class="w-full h-full object-center object-cover sm:w-full sm:h-full">
              </div>

              <div class="mt-6 sm:mt-0 sm:ml-6">
                <h3 class="text-base font-medium text-gray-900">
                  <a href="#">Minimalist Wristwatch</a>
                </h3>
                <p class="mt-2 text-sm font-medium text-gray-900">$149.00</p>
                <p class="mt-3 text-sm text-gray-500">This contemporary wristwatch has a clean, minimalist look and high quality components.</p>
<p class="mt-3 text-sm font-bold text-gray-900">Total: RM 300.00</p>
              </div>
            </div>

            <div class="mt-6 lg:mt-0 lg:col-span-5">
              <dl class="grid grid-cols-2 gap-x-6 text-sm">
                <div>
                  <dt class="font-medium text-gray-900">Quantity</dt>
                  <dd class="mt-3 text-gray-500">
                    
                    
                    <span class="block">1</span>
                  </dd>
                </div>
                <div>
                  <dt class="font-medium text-gray-900">Size / Color</dt>
                  <dd class="mt-3 text-gray-500 space-y-3">
                    <p>XL</p>
                    <p>BLACK</p>
                    
                  </dd>
                </div>
              </dl>
            </div>
          </div>

        </div>
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
              <span class="block">Floyd Miles</span>
              <span class="block mt-1">7363 Cynthia Pass</span>
              <span class="block mt-1">Toronto, ON N3Y 4H8</span>
            </dd>
          </div>
          <div>
            <dt class="font-medium text-gray-900">Payment Information</dt>
<div class="mt-3">
              <dd class="mt-3 text-gray-500">
              <span class="block">pm_1OJetpFglGOSlsymMYxrw976</span>
              <span class="block mt-1">Online Banking</span>
              <span class="block mt-1">23-11-2019 03:32</span>
            </dd>
            </div>          </div>
        </dl>

<dl class="mt-8 divide-y divide-gray-200 text-sm lg:mt-0 lg:col-span-5">
          <div class="pb-4 flex items-center justify-between">
            <dt class="text-gray-600">Subtotal</dt>
            <dd class="font-medium text-gray-900">$72</dd>
          </div>
          <div class="py-4 flex items-center justify-between">
            <dt class="text-gray-600">Shipping</dt>
            <dd class="font-medium text-gray-900">$5</dd>
          </div>
          <div class="py-4 flex items-center justify-between">
            <dt class="text-gray-600">Discount (STUDENT50)</dt>
            <dd class="font-medium text-gray-900">- RM6.16</dd>
          </div>
          <div class="py-4 flex items-center justify-between">
            <dt class="text-gray-600">Member Point Earned</dt>
            <dd class="font-medium text-gray-900">134</dd>
          </div><div class="pt-4 flex items-center justify-between">
            <dt class="font-medium text-gray-900">Order total</dt>
            <dd class="font-medium text-indigo-600">$83.16</dd>
          </div>
          
        </dl>
      </div>
    </div>
  </div>
</div>


</asp:Content>
