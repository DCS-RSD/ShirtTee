﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ShirtTee.customer.Profile" Culture="en-GB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        function showSuccessToast() {
            var status = '<%= Session["ProfileChanged"] %>';
            console.log(status);
            if (status !== null && status !== undefined) {
                if (status == "success") {
                    toastr["success"]("Profile updated successfully.");
                }
                else if (status == "sameUsername") {
                    toastr["error"]("Username have been used by others.")
                }
                else if (status == "sameDetails") {
                    toastr["error"]("You haven't update your information.")
                }
                else if (status == "duplicateVoucher") {
                    toastr["error"]("You have redeemed / used the voucher before.")
                }
                else if (status == "noSuchVoucher") {
                    toastr["error"]("No such voucher.")
                }
                else if (status == "redeemSuccess") {
                    toastr["success"]("Redeem voucher successfully.")
                }
                else if (status == "changePwdSuccess")
                {
                    toastr["success"]("Change password successfully.")
                }
                else if (status == "changePwdFailed") {
                    toastr["error"]("Change password failed.")
                }
                else {
                    toastr["error"]("Something went wrong.");
                }
            }
        <% Session.Remove("ProfileChanged"); %>
        }
    </script>

    <div class="space-y-8  ">

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
                                            <asp:Label Text="" runat="server" ID="lblMemberInfo" class="text-left hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 py-1 px-2 bg-gray-900 text-xs font-medium text-white rounded shadow-sm dark:bg-slate-700 hidden" role="tooltip" Style="position: fixed; inset: auto auto 0px 0px; margin: 0px; transform: translate3d(814.4px, -472.8px, 0px);" data-popper-placement="top">
                                            </asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="text-right">
                                <asp:Label runat="server" ID="lblMemberPoints" Text="" />
                                points
                            </div>
                        </div>
                        <div class="mt-4" aria-hidden="true">
                            <div class="bg-gray-200 rounded-full overflow-hidden">
                                <div runat="server" id="progressBar" class="h-2 bg-indigo-600 rounded-full"></div>
                            </div>
                            <div class="grid grid-cols-2 text-sm font-medium text-gray-600 mt-4">
                                <div class="text-indigo-600">
                                    <asp:Label runat="server" ID="lblLvNow" Text="" />
                                </div>
                                <div class="text-right">
                                    <asp:Label runat="server" ID="lblLvNext" Text="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="mt-6 sm:mt-5 space-y-6 sm:space-y-5">
                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="email" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Email address </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server" ID="txtEmail" Text="" autocomplete="email" class="block max-w-lg w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm border-gray-300 rounded-md" />

                            <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="ProfileValidation" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter a valid email address" ForeColor="Red" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ValidationGroup="ProfileValidation" CssClass="text-sm italic" />
                            <asp:CustomValidator ID="CustomValidator2" OnServerValidate="CustomValidator2_ServerValidate" runat="server" ErrorMessage="The email is used." ValidationGroup="ProfileValidation" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic"></asp:CustomValidator>

                        </div>
                    </div>



                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-center sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="photo" class="block text-sm font-medium text-gray-700">Photo </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <div class="flex items-center">
                                <span id="divAvatar" runat="server" class="h-12 w-12 rounded-full overflow-hidden bg-gray-100">
                                    <asp:Image ID="Image1" runat="server" ClientIDMode="Static" class="" ImageUrl='' />

                                </span>

                                <asp:Button runat="server" Text="Change" ID="btnChangeAvatar" OnClientClick="triggerFileUploadClick(); return false;" OnClick="btnChangeAvatar_Click" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"></asp:Button>
                                <asp:FileUpload runat="server" ID="fileAvatar" class="hidden" onchange="loadFile(event)" />

                            </div>
                            <div class="mt-2">
                            </div>

                        </div>

                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="email" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Password</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <div class="flex items-center">
                                <asp:Label runat="server" ID="lblPassword" Text="************" class="block focus:ring-indigo-500 focus:border-indigo-500 sm:text-lg font-bold" />
                                <asp:Button runat="server" Text="Change" ID="btnPassword" OnClick="btnPassword_Click" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"></asp:Button>

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
                        <label for="first_name" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Username</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server" ID="txtUsername" Text="" autocomplete="given-name" class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" />
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ValidationGroup="ProfileValidation" ControlToValidate="txtUsername" ErrorMessage="Username is required" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic" />
                            <asp:CustomValidator ID="CustomValidator1" OnServerValidate="CustomValidator1_ServerValidate" runat="server" ErrorMessage="The username is used." ValidationGroup="ProfileValidation" ControlToValidate="txtUsername" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic"></asp:CustomValidator>
                        </div>
                    </div>


                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="country" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Gender</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:DropDownList runat="server" ID="ddlGender" autocomplete="country-name" class="max-w-lg block focus:ring-indigo-500 focus:border-indigo-500 w-full shadow-sm sm:max-w-xs sm:text-sm border-gray-300 rounded-md">
                                <asp:ListItem Value="0">Select gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ProfileValidation" ControlToValidate="ddlGender" ErrorMessage="Gender is required" InitialValue="0" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic" />

                        </div>
                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="street-address" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Date of birth</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">

                            <div class="relative max-w-sm">
                                <div runat="server" id="svgIcon" class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"></path>
                                    </svg>
                                </div>

                                <asp:TextBox runat="server" ID="txtSelectDOB" Text="" datepicker datepicker-format="dd/mm/yyyy" datepicker-autohide CssClass=" bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block ps-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 datepicker-input" />
                                <asp:Label ID="txtDOB" Text="" runat="server" class=" max-w-lg block w-full sm:max-w-xs sm:text-sm"></asp:Label>

                            </div>

                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ValidationGroup="ProfileValidation" ControlToValidate="txtSelectDOB" ErrorMessage="DOB is required" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic" />
                            <asp:CustomValidator ID="CustomValidator3" OnServerValidate="CustomValidator3_ServerValidate" runat="server" ErrorMessage="The DOB must not be greater than today." ValidationGroup="ProfileValidation" ControlToValidate="txtSelectDOB" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic"></asp:CustomValidator>

                        </div>
                    </div>

                    <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="city" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">Phone</label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <asp:TextBox runat="server" ID="txtPhone" placeholder="Eg: +60123456789" Text="" autocomplete="address-level2" class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" />

                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ValidationGroup="ProfileValidation" ControlToValidate="txtPhone" ErrorMessage="Phone number is required" Display="Dynamic" ForeColor="Red" CssClass="text-sm italic" />
                            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhone" ValidationGroup="ProfileValidation"
                                ErrorMessage="Format should be +60123456789" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ForeColor="Red" CssClass="text-sm italic">
                            </asp:RegularExpressionValidator>
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
                            <asp:TextBox runat="server" ID="txtRedeem" Text="" class="max-w-lg block shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md" />
                            <asp:Button runat="server" ID="btnRedeem" OnClick="btnRedeem_Click" Text="Redeem" class="ml-5 bg-white py-2 px-3 border border-gray-300 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"></asp:Button>
                        </div>

                    </div>

                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Voucher_Details] AS vd INNER JOIN [Voucher] AS v ON vd.voucher_ID = v.voucher_ID WHERE user_ID = @user_ID AND used_date IS NULL AND expiry_date > GETDATE() AND deleted_at IS NULL">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="user_ID" Name="user_ID"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <!-- Repeat this card block for each card -->
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">

                        <ItemTemplate>
                            <div class="flex flex-col bg-white dark:bg-slate-900 dark:border-gray-700 dark:shadow-slate-700/[.7]">
                                <div class="p-6 border-t border-l border-r shadow-sm rounded-t-lg ">
                                    <h3 class="text-lg font-bold text-gray-800 dark:text-white">
                                        <asp:Label runat="server" ID="lblVoucher" Text=""></asp:Label></h3>
                                    <div>
                                        <p class="mt-2 text-gray-500 text-justify dark:text-gray-400 text-justify"><%# Eval("voucher_description") %></p>

                                    </div>

                                    <p class="mt-2 text-gray-500 dark:text-gray-400 text-xs">
                                        <asp:Label runat="server" ID="lblMinSpend" Text=""></asp:Label>
                                    </p>
                                    <p class="mt-2 text-gray-500 dark:text-gray-400 text-xs">
                                        <asp:Label runat="server" ID="lblCapAt" Text=""></asp:Label>
                                    </p>
                                    <input type="hidden" id='<%# "hs-clipboard-tooltip-on-hover-" + Container.ItemIndex %>' value='<%# Eval("voucher_name") %>'>
                                    <div class="js-clipboard [--is-toggle-tooltip:false] hs-tooltip relative mt-4 py-2 px-4 inline-flex justify-center items-center gap-x-2 text-md font-mono rounded-lg border border-gray-200 bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none dark:bg-slate-900 dark:border-gray-700 dark:text-white dark:hover:bg-gray-800 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600"
                                        data-clipboard-target='<%# "#hs-clipboard-tooltip-on-hover-" + Container.ItemIndex %>'
                                        data-clipboard-action="copy"
                                        data-clipboard-success-text="Copied">
                                        <%# Eval("voucher_name") %>
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
                                    <p class="mt-1 text-sm text-gray-500 dark:text-gray-500">
                                        Used By
                                        <asp:Label runat="server" ID="lblExpiryDate" Text="" />
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- End of card block -->
                    <!-- Repeat the card blocks for the desired number of cards -->


                </div>

            </div>


        </div>

        <div class=" pb-5">
            <div class="mx-12 lg:mx-64 flex flex-col sm:flex-row justify-center ">
                <!--
                <asp:Button ID="btnCancel" runat="server" class="bg-white w-full py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" Text="Cancel"></asp:Button>
                -->
                <asp:Button runat="server" ValidationGroup="ProfileValidation" ID="btnSave" OnClick="btnSave_Click" class="mt-3 sm:mt-0 sm:ml-3 w-full inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" Text="Save"></asp:Button>
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

    <script type="text/javascript">
        function triggerFileUploadClick() {
            document.getElementById('<%=fileAvatar.ClientID%>').click();
        }
    </script>

    <script>
        var loadFile = function (event) {
            var input = event.target;
            var file = input.files[0];
            var type = file.type;
            var output = document.getElementById('Image1');
            if (file) {
                var allowedTypes = ["image/jpeg", "image/png", "image/jpg"]; // Add allowed file types here

                // Check if the file type is allowed
                if (allowedTypes.includes(type)) {
                    output.src = URL.createObjectURL(event.target.files[0]);

                    output.onload = function () {
                        URL.revokeObjectURL(output.src); // free memory
                    }

                    output.classList.add("w-12");
                    output.classList.add("h-12");

                } else {

                    alert("Invalid file type. Please upload a JPEG, PNG, or JPG file.");
                }
            }
        };
    </script>
</asp:Content>
