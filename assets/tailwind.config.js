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
        "card-grey": "#26262C",
        "body-grey": "#16161A",
        "accent-green": "#3DFDAF",
        "accent-purple": "#6b4cff",
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
