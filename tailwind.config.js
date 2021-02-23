const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  purge: ['./app/views/**/*.html.erb'],
  darkMode: false,
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require('@tailwindcss/forms')],
};
