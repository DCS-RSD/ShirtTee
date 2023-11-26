/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./ShirtTee/*.{aspx,Master}"],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}

