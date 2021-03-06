module.exports = {
  purge: [
    "../lib/**/*.ex",
    "../lib/**/*.leex",
    "../lib/**/*.eex",
    "./js/**/*.js",
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        "card-grey": "#1F1F24",
        "body-grey": "#16161A",
        "accent-green": "#3DFDAF",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
