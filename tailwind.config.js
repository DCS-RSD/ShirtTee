/** @type {import('tailwindcss').Config} */
module.exports = {
darkMode: 'class',
    content: ["./ShirtTee/*.{aspx,Master}",
        'node_modules/preline/dist/*.js',
 		"./ShirtTee/admin/*.{aspx,aspx.*,Master,Master.*}",
        "./ShirtTee/customer/*.{aspx,aspx.*,Master,Master.*}",
        "./node_modules/flowbite/**/*.js"],
    theme: {
        extend: {
            gridTemplateRows: {
                '[auto,auto,1fr]': 'auto auto 1fr',
            },
        },
    },
    plugins: [
        require('preline/plugin'),
        require('@tailwindcss/forms'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/typography'),
        require('flowbite/plugin'),
    ],
}

