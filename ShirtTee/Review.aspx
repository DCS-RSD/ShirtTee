<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="ShirtTee.Review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="bg-gray-50">
          
  <div class="max-w-2xl mx-auto pt-4 pb-8 sm:px-6 lg:max-w-7xl lg:px-8">
    
    <div class="px-4 space-y-2 sm:px-0 sm:flex sm:items-baseline sm:justify-between sm:space-y-0">
      <div class="flex sm:items-baseline sm:space-x-4">
        <h1 class="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">Reviews &amp; Rating</h1>
        
      </div>
      
      
    </div>
    <!-- Products -->
    <div class="mt-6">
      <h2 class="sr-only">Products purchased</h2>

      <div class="space-y-8">
        <div class="bg-white border-t border-b border-gray-200 shadow-sm sm:border sm:rounded-lg">
          <div class="py-6 px-4 sm:px-6 lg:grid lg:grid-cols-12 lg:gap-x-8 lg:p-8">
            <div class="sm:flex lg:col-span-7">
              <div class="flex-shrink-0 w-full aspect-w-1 aspect-h-1 rounded-lg overflow-hidden sm:aspect-none sm:w-40 sm:h-40">
                <img src="https://tailwindui.com/img/ecommerce-images/confirmation-page-03-product-01.jpg" alt="Insulated bottle with white base and black snap lid." class="w-full h-full object-center object-cover sm:w-full sm:h-full">
              </div>

              <div class="mt-6 sm:mt-0 sm:ml-6">
                <h3 class="text-base font-medium text-gray-900">
                  <a href="#">Nomad Tumbler</a>
                </h3>
                <p class="mt-2 text-sm font-medium text-gray-900">$35.00</p>
                <p class="mt-3 text-sm text-gray-500">This durable and portable insulated tumbler will keep your beverage at the perfect temperature during your next adventure.</p>
              </div>
            </div>

            
          </div>

          
        </div>

        

        <!-- More products... -->
      </div>
    </div>

    <!-- Billing -->
    
  </div>
</div>
<div class="bg-white">
  <div class="max-w-2xl mx-auto pt-8 pb-12 px-8 lg:max-w-7xl lg:grid lg:grid-cols-12 lg:gap-x-8">
    <div class="lg:col-span-4">
      

      <div class=" flex items-center">
        <div>
          <div class="flex items-center">
            <!--
              Heroicon name: solid/star

              Active: "text-yellow-400", Default: "text-gray-300"
            -->
            <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>

            <!-- Heroicon name: solid/star -->
            <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>

            <!-- Heroicon name: solid/star -->
            <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>

            <!-- Heroicon name: solid/star -->
            <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>

            <!-- Heroicon name: solid/star -->
            <svg class="flex-shrink-0 h-5 w-5 text-gray-300" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
          </div>
          <p class="sr-only">4 out of 5 stars</p>
        </div>
        <p class="ml-2 text-sm text-gray-900">Based on 1624 reviews</p>
      </div>

      <div class="mt-6">
        <h3 class="sr-only">Review data</h3>

        <dl class="space-y-3">
          <div class="flex items-center text-sm">
            <dt class="flex-1 flex items-center">
              <p class="w-3 font-medium text-gray-900">5<span class="sr-only"> star reviews</span></p>
              <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                <!-- Heroicon name: solid/star -->
                <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>

                <div class="ml-3 relative flex-1">
                  <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                  <div style="width: calc(1019 / 1624 * 100%)" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                </div>
              </div>
            </dt>
            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">63%</dd>
          </div>

          <div class="flex items-center text-sm">
            <dt class="flex-1 flex items-center">
              <p class="w-3 font-medium text-gray-900">4<span class="sr-only"> star reviews</span></p>
              <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                <!-- Heroicon name: solid/star -->
                <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>

                <div class="ml-3 relative flex-1">
                  <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                  <div style="width: calc(162 / 1624 * 100%)" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                </div>
              </div>
            </dt>
            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">10%</dd>
          </div>

          <div class="flex items-center text-sm">
            <dt class="flex-1 flex items-center">
              <p class="w-3 font-medium text-gray-900">3<span class="sr-only"> star reviews</span></p>
              <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                <!-- Heroicon name: solid/star -->
                <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>

                <div class="ml-3 relative flex-1">
                  <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                  <div style="width: calc(97 / 1624 * 100%)" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                </div>
              </div>
            </dt>
            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">6%</dd>
          </div>

          <div class="flex items-center text-sm">
            <dt class="flex-1 flex items-center">
              <p class="w-3 font-medium text-gray-900">2<span class="sr-only"> star reviews</span></p>
              <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                <!-- Heroicon name: solid/star -->
                <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>

                <div class="ml-3 relative flex-1">
                  <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                  <div style="width: calc(199 / 1624 * 100%)" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                </div>
              </div>
            </dt>
            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">12%</dd>
          </div>

          <div class="flex items-center text-sm">
            <dt class="flex-1 flex items-center">
              <p class="w-3 font-medium text-gray-900">1<span class="sr-only"> star reviews</span></p>
              <div aria-hidden="true" class="ml-1 flex-1 flex items-center">
                <!-- Heroicon name: solid/star -->
                <svg class="flex-shrink-0 h-5 w-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>

                <div class="ml-3 relative flex-1">
                  <div class="h-3 bg-gray-100 border border-gray-200 rounded-full"></div>

                  <div style="width: calc(147 / 1624 * 100%)" class="absolute inset-y-0 bg-yellow-400 border border-yellow-400 rounded-full"></div>
                </div>
              </div>
            </dt>
            <dd class="ml-3 w-10 text-right tabular-nums text-sm text-gray-900">9%</dd>
          </div>
        </dl>
      </div>

      
    </div>

    <div class=" mt-12 lg:mt-0 lg:col-start-6 lg:col-span-7">
      <h3 class="sr-only">Recent reviews</h3>

      <div class="flow-root">
        <div class="my-12 divide-y divide-gray-200">
          <div class="py-4 border-t border-b">
            <div class="flex items-center">
              
              <div class="">
                <h4 class="text-sm font-bold text-gray-900">Emily Selman</h4>
                <div class="mt-1 flex items-center">
                  <!--
                    Heroicon name: solid/star

                    Active: "text-yellow-400", Default: "text-gray-300"
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
                <p class="sr-only">5 out of 5 stars</p>
              </div>
            </div>

            <div class="mt-4 space-y-6 text-base italic text-gray-600">
              <p>This is the bag of my dreams. I took it on my last vacation and was able to fit an absurd amount of snacks for the many long and hungry flights.</p>
                  <p>XL | BLACK</p>
            </div>
          </div>

          <!-- More reviews... -->
        </div>
      </div>
    </div>
  </div>
</div>

</asp:Content>
