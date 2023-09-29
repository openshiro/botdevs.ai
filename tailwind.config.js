const defaultTheme = require("tailwindcss/defaultTheme")
const colors = require("tailwindcss/colors")

module.exports = {
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require('@tailwindcss/line-clamp'),
  ],

  content: [
    "./app/assets/**/*.svg",
    "./app/components/**/*.{rb,html,html.erb,yml}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/models/field_error_tag_builder.rb",
    "./app/views/**/*.html.erb",
    "./config/utility_classes.yml"
  ],

  theme: {
    extend: {
      colors: {
        red: colors.rose,
        'green': {
          '50': '#f1fcf4',
          '100': '#dff9e8',
          '200': '#c1f1d2',
          '300': '#90e5af',
          '400': '#58d083',
          '500': '#32b561',
          '600': '#23964d',
          '700': '#1f7640',
          '800': '#1e5d36',
          '900': '#1a4d2e',
          '950': '#092a17',
        },
        'sunshade': {
          '50': '#fff8eb',
          '100': '#ffeac6',
          '200': '#ffd388',
          '300': '#ffb64a',
          '400': '#ff9f29',
          '500': '#f97607',
          '600': '#dd5202',
          '700': '#b73506',
          '800': '#94280c',
          '900': '#7a220d',
          '950': '#460e02',
        },
        'blue': {
          '50': '#f0f7fe',
          '100': '#ddebfc',
          '200': '#c3ddfa',
          '300': '#9ac9f6',
          '400': '#69acf1',
          '500': '#468ceb',
          '600': '#3170df',
          '700': '#285acd',
          '800': '#274aa6',
          '900': '#254183',
          '950': '#213363',
        },
        'chelsea-cucumber': {
          '50': '#f6f8ed',
          '100': '#e9efd8',
          '200': '#d4e0b6',
          '300': '#b8cb8b',
          '400': '#9db665',
          '500': '#8eac50',
          '600': '#637a36',
          '700': '#4c5e2d',
          '800': '#3f4c28',
          '900': '#374225',
          '950': '#1b2310',
        },
        'tacha': {
          '50': '#f9faec',
          '100': '#eff3ce',
          '200': '#e3e8a0',
          '300': '#d9db69',
          '400': '#d3d04f',
          '500': '#c0b632',
          '600': '#a59329',
          '700': '#846e24',
          '800': '#6f5924',
          '900': '#5f4b24',
          '950': '#372811',
        },
      },
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
        serif: ["Merriweather", "serif"],
      },
      animation: {
        "reverse-spin": "reverse-spin 1.5s linear infinite"
      },
      keyframes: {
        "reverse-spin": {
          from: {
            transform: "rotate(360deg)"
          },
        },
      },
    },
  },
}
