const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
        lato: ["Lato", ...defaultTheme.fontFamily.serif],
      },
      colors: {
        "site-gray": "#2c2d2e",
      },
      backgroundImage: {
        service: "url('service.jpg')",
        "engine-repair": "url('engine-repair.jpg')",
        brake: "url('brake.jpg')",
        accident: "url('accident.jpg')",
        "oil-change": "url('oil-change.jpg')",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
