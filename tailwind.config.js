const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  // future: {
  //   removeDeprecatedGapUtilities: true,
  //   purgeLayersByDefault: true,
  // },
  purge: [
    './index.html',
    './src/**/*.{vue,js,ts,jsx,tsx}',
    './app/**/*.html',
    './app/**/*.erb',
    './app/**/*.vue',
    './app/**/*.jsx',],
  darkMode: false, // or 'media' or 'class'
  
  theme: {
    extend: {
      minHeight: {
        "screen-75": "75vh",
      },
      fontSize: {
        "55": "55rem",
      },
      opacity: {
        "80": ".8",
      },
      zIndex: {
        "2": 2,
        "3": 3,
      },
      inset: {
        "-100": "-100%",
        "-225-px": "-225px",
        "-160-px": "-160px",
        "-150-px": "-150px",
        "-94-px": "-94px",
        "-50-px": "-50px",
        "-29-px": "-29px",
        "-20-px": "-20px",
        "25-px": "25px",
        "40-px": "40px",
        "95-px": "95px",
        "145-px": "145px",
        "195-px": "195px",
        "210-px": "210px",
        "260-px": "260px",
      },
      height: {
        "95-px": "95px",
        "70-px": "70px",
        "350-px": "350px",
        "500-px": "500px",
        "600-px": "600px",
      },
      maxHeight: {
        "860-px": "860px",
      },
      maxWidth: {
        "100-px": "100px",
        "120-px": "120px",
        "150-px": "150px",
        "180-px": "180px",
        "200-px": "200px",
        "210-px": "210px",
        "580-px": "580px",
      },
      minWidth: {
        "140-px": "140px",
        "48": "12rem",
      },
      backgroundSize: {
        full: "100$",
      },
      fontFamily: {
        sans: ['Public Sans', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: {
          'dark-blue': 'hsl(233, 26%, 24%)',
          'lime-green': 'hsl(136, 65%, 51%)',
          'bright-cyan': 'hsl(192, 70%, 51%)',
        },
        neutral: {
          'grayish-blue': 'hsl(233, 8%, 62%)',
          'light-grayish-blue': 'hsl(220, 16%, 96%)',
          'very-light-gray': 'hsl(0, 0%, 98%)',
          white: 'hsl(0, 0%, 100%)',
        },
      },
      backgroundImage: (theme) => ({
       
      }),
      backgroundSize: {
        'custom-mobile-header-size': '100% 50%',
        'custom-mobile-mockup-size': 'auto 60%',
      },
      container: {
        center: true,
        padding: {
          DEFAULT: '1.25rem',
          sm: '2rem',
          lg: '3rem',
          xl: '4rem',
          '2xl': '5rem',
        },
      },
      inset: {
        '-42.6%': '-42.6%',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require('@tailwindcss/aspect-ratio')],
}
