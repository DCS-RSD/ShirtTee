<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ShirtTee.customer.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form class="space-y-8 divide-y divide-gray-200 ">

        <div class="space-y-8 divide-y divide-gray-200 sm:space-y-5 mx-12 lg:mx-40 mt-4 mb-8">

            <div>

                <div>
                    <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4">Profile</h3>
                </div>

                <div class="bg-white  border-gray-200 shadow-sm border rounded-lg">

                    <div class=" border-gray-200 p-5">
                        <div class="grid grid-cols-2 text-sm font-medium text-gray-600">
                            <div class="flex text-sm font-medium text-gray-900">
                                Membership Level
                                <div class=" text-center">
                                    <div class="hs-tooltip">
                                        <div type="button" class="hs-tooltip-toggle w-5 h-5 inline-flex justify-center items-center gap-2 rounded-full bg-gray-50 border border-gray-200 text-gray-600 hover:bg-blue-50 hover:border-blue-200 hover:text-blue-600 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-white/[.05] dark:hover:border-white/[.1] dark:hover:text-white ml-2">

                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-question" viewBox="0 0 16 16">
                                                <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94" />
                                            </svg>
                                            <span class="hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700 hidden" role="tooltip" style="position: fixed; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(814.4px, -472.8px, 0px);" data-popper-placement="top">Level 1 Benefits: Free delivery for all your purchases.
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="text-right">653 points</div>
                        </div>
                        <div class="mt-4" aria-hidden="true">
                            <div class="bg-gray-200 rounded-full overflow-hidden">
                                <div class="h-2 bg-indigo-600 rounded-full" style="width: calc((1 * 2 + 1) / 8 * 100%)"></div>
                            </div>
                            <div class="grid grid-cols-2 text-sm font-medium text-gray-600 mt-4">
                                <div class="text-indigo-600">Level 1</div>
                                <div class="text-right">Level 2</div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="mt-6 sm:mt-5 space-y-6 sm:space-y-5">
                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="email" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Email address </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server" id="email" autocomplete="email" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md"/>
                        </div>
                    </div>



                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-center sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="photo" class="block text-sm font-medium text-gray-700">Photo </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <div class="flex items-center">
                                <span class="h-12 w-12 rounded-full overflow-hidden bg-gray-100">
                                    <svg class="h-full w-full text-gray-300" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z"></path>
                                    </svg>
                                </span>
                                <asp:Button runat="server" Text="Change" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
               

                                </asp:Button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="pt-8 space-y-6 sm:pt-10 sm:space-y-5">
                <div>
                    <h3 class="text-lg leading-6 font-medium text-gray-900">Personal Information</h3>
                </div>
                <div class="space-y-6 sm:space-y-5">
                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="first_name" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">First name </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server" id="first_name" autocomplete="given-name" class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md"/>
                        </div>
                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="last_name" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Last name </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server"  id="last_name" autocomplete="family-name" class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md"/>
                        </div>
                    </div>



                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="country" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Gender</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:DropDownList runat="server" autocomplete="country-name" class="max-w-lg block focus:ring-indigo-500 focus:border-indigo-500 w-full shadow-sm sm:max-w-xs sm:text-sm border-gray-300 rounded-md">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="street-address" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Date of birth</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">

                            <div class="relative max-w-sm">
                                <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"></path>
                                    </svg>
                                </div>
                                <asp:TextBox runat="server" datepicker="" datepicker-autohide="" type="text" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block ps-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 datepicker-input" placeholder="Select date"/>
                            </div>
                        </div>
                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="city" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Phone</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server" id="city" autocomplete="address-level2" class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md"/>
                        </div>
                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="region" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Password</label>
                        <div class="mt-1 sm:mt-0 flex">
                            <asp:TextBox runat="server" autocomplete="address-level1" class="max-w-lg block shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" TextMode="Password" />
                            <div class="ml-5 bg-white py-2.5 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" data-hs-overlay="#hs-change-password">Change</div>
                        </div>
                    </div>

                </div>

            </div>
            <div class="pt-8 space-y-6 sm:pt-10 sm:space-y-5">
                <div>
                    <h3 class="text-lg leading-6 font-medium text-gray-900">Existing Vouchers</h3>
                </div>
                <div class="space-y-6 sm:space-y-5">

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5 mb-8">
                        <label for="region" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Redeem Vouchers</label>
                        <div class="mt-1 sm:mt-0 flex">
                            <asp:TextBox runat="server"  id="region" autocomplete="address-level1" class="max-w-lg block shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md"/>
                            <asp:Button runat="server" Text="Redeem" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
             

                            </asp:Button>
                        </div>

                    </div>

                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Repeat this card block for each card -->
                    <div class="flex flex-col bg-white border shadow-sm rounded-xl dark:bg-slate-900 dark:border-gray-700 dark:shadow-slate-700/[.7]">
                        <div class="p-4 md:p-5">
                            <h3 class="text-lg font-bold text-gray-800 dark:text-white">Pay Day 20% Off</h3>
                            <p class="mt-2 text-gray-500 dark:text-gray-400">Get 20% discount on your order with minimum spend RM150.</p>
                            <input type="hidden" id="hs-clipboard-tooltip-on-hover" value="PAYDAY20">

                            <div class="js-clipboard [--is-toggle-tooltip:false] hs-tooltip relative mt-3 py-2 px-4 inline-flex justify-center items-center gap-x-2 text-md font-mono rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                data-clipboard-target="#hs-clipboard-tooltip-on-hover"
                                data-clipboard-action="copy"
                                data-clipboard-success-text="Copied">
                                PAYDAY20
  <span class="border-s ps-3.5 dark:border-gray-700">
      <svg class="js-clipboard-default w-4 h-4 group-hover:rotate-6 transition" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <rect width="8" height="4" x="8" y="2" rx="1" ry="1" />
          <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2" />
      </svg>

      <svg class="js-clipboard-success hidden w-4 h-4 text-blue-600 rotate-6" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <polyline points="20 6 9 17 4 12" />
      </svg>
  </span>

                                <span class="hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity hidden invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded-lg shadow-sm dark:bg-slate-700" role="tooltip">
                                    <span class="js-clipboard-success-text">Copy</span>
                                </span>
                            </div>
                        </div>
                        <div class="bg-gray-100 border-t rounded-b-xl py-3 px-4 md:py-4 md:px-5 dark:bg-slate-900 dark:border-gray-700">
                            <p class="mt-1 text-sm text-gray-500 dark:text-gray-500">Used By 12 December 2023</p>
                        </div>
                    </div>
                    <!-- End of card block -->
                    <!-- Repeat the card blocks for the desired number of cards -->
                </div>

            </div>


        </div>

        <div class=" pb-5">
            <div class="mx-12 lg:mx-64 flex justify-center ">
                <asp:Button runat="server" class="bg-white w-full py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" Text="Cancel"></asp:Button>
                <asp:Button runat="server" class="ml-3 w-full inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" Text="Save"></asp:Button>
            </div>
        </div>

    </form>

    <div id="hs-change-password" class="flex justify-center items-center hs-overlay w-full h-full fixed top-0 start-0 z-[60] overflow-x-hidden overflow-y-auto open hidden" aria-overlay="true" tabindex="-1">
        <div class="hs-overlay-open:opacity-100 hs-overlay-open:duration-500 opacity-0 ease-out transition-all max-w-lg w-full mx-auto my-auto">
            <div class="relative bg-white border border-gray-200 rounded-xl shadow-sm dark:bg-gray-800 dark:border-gray-700">
                <div class="absolute top-2 end-2 z-[10]">
                    <div class="inline-flex justify-center items-center w-8 h-8 text-sm font-semibold rounded-lg border border-transparent bg-white/10 text-black hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" data-hs-overlay="#hs-change-password">
                        <span class="sr-only">Close</span>
                        <svg class="flex-shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>
                    </div>
                </div>
                <div class="p-4 sm:p-7">
                    <div class="text-center">
                        <h2 class="block text-2xl font-bold text-gray-800 dark:text-gray-200">Change Password</h2>

                    </div>

                    <div class="mt-5">




                        <!-- Form -->

                        <div class="grid gap-y-4">
                            <!-- Form Group -->
                            <div>
                                <label for="email" class="block text-sm mb-2 dark:text-white">Original Password</label>
                                <div class="relative">
                                    <asp:TextBox runat="server"  id="ori_pwd"  class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" required="" aria-describedby="email-error"/>
                                    <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                        <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                        </svg>
                                    </div>
                                </div>
                                <p class="hidden text-xs text-red-600 mt-2" id="email-error">Invalid Original Password</p>
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div>
                                <label for="password" class="block text-sm mb-2 dark:text-white">New Password</label>
                                <div class="relative">
                                    <asp:TextBox runat="server" id="new_pwd" class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" required="" aria-describedby="password-error"/>
                                    <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                        <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                        </svg>
                                    </div>
                                </div>
                                <p class="hidden text-xs text-red-600 mt-2" id="password-error">8+ characters required</p>
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div>
                                <label for="confirm-password" class="block text-sm mb-2 dark:text-white">Confirm New Password</label>
                                <div class="relative">
                                    <asp:TextBox runat="server" id="con_pwd"  class="py-3 px-4 block w-full border-gray-200 rounded-lg text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-gray-400 dark:focus:ring-gray-600" required="" aria-describedby="confirm-password-error"/>
                                    <div class="hidden absolute inset-y-0 end-0 flex items-center pointer-events-none pe-3">
                                        <svg class="h-5 w-5 text-red-500" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" aria-hidden="true">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                        </svg>
                                    </div>
                                </div>
                                <p class="hidden text-xs text-red-600 mt-2" id="confirm-password-error">Password does not match the new password</p>
                            </div>
                            <!-- End Form Group -->

                            <!-- Checkbox -->

                            <!-- End Checkbox -->

                            <asp:Button runat="server" class="mt-2 w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-lg border border-transparent bg-blue-600 text-white hover:bg-blue-700 disabled:opacity-50 disabled:pointer-events-none dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600" Text="Change"></asp:Button>
                        </div>

                        <!-- End Form -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // INITIALIZATION OF CLIPBOARD
        // =======================================================
        (function () {
            window.addEventListener('load', () => {
                const $clipboards = document.querySelectorAll('.js-clipboard');
                $clipboards.forEach((el) => {
                    const isToggleTooltip = HSStaticMethods.getClassProperty(el, '--is-toggle-tooltip') === 'false' ? false : true;
                    const clipboard = new ClipboardJS(el, {
                        text: (trigger) => {
                            const clipboardText = trigger.dataset.clipboardText;

                            if (clipboardText) return clipboardText;

                            const clipboardTarget = trigger.dataset.clipboardTarget;
                            const $element = document.querySelector(clipboardTarget);

                            if (
                                $element.tagName === 'SELECT'
                                || $element.tagName === 'INPUT'
                                || $element.tagName === 'TEXTAREA'
                            ) return $element.value
                            else return $element.textContent;
                        }
                    });
                    clipboard.on('success', () => {
                        const $default = el.querySelector('.js-clipboard-default');
                        const $success = el.querySelector('.js-clipboard-success');
                        const $successText = el.querySelector('.js-clipboard-success-text');
                        const successText = el.dataset.clipboardSuccessText || '';
                        const tooltip = el.closest('.hs-tooltip');
                        const $tooltip = HSTooltip.getInstance(tooltip, true);
                        let oldSuccessText;

                        if ($successText) {
                            oldSuccessText = $successText.textContent
                            $successText.textContent = successText
                        }
                        if ($default && $success) {
                            $default.style.display = 'none'
                            $success.style.display = 'block'
                        }
                        if (tooltip && isToggleTooltip) HSTooltip.show(tooltip);
                        if (tooltip && !isToggleTooltip) $tooltip.element.popperInstance.update();

                        setTimeout(function () {
                            if ($successText && oldSuccessText) $successText.textContent = oldSuccessText;
                            if (tooltip && isToggleTooltip) HSTooltip.hide(tooltip);
                            if (tooltip && !isToggleTooltip) $tooltip.element.popperInstance.update();
                            if ($default && $success) {
                                $success.style.display = '';
                                $default.style.display = '';
                            }
                        }, 800);
                    });
                });
            })
        })()
    </script>
</asp:Content>
