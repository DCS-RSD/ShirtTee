/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./ShirtTee/*.{aspx,Master}"],
  theme: {
      extend: {
          gridTemplateRows: {
              '[auto,auto,1fr]': 'auto auto 1fr',
          },
      },
  },
  plugins: [
      require('@tailwindcss/forms'),
      require('@tailwindcss/aspect-ratio'),
  ],
}

