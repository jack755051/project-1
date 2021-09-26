module.exports = {
  purge: ['./src/**/*.{js,jsx,ts,tsx}', './public/index.html'], 
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        gray: {
          100: "#e8e8e8",
          // 遊戲等候室列表背景色
          200: "#f5f5f5",
          // 商品背景色
          300: "#dbebdb",
          // 討論區內文背景色
          700: "#393e4d",
          800: "#2d2d35",
          // Navbar 背景色、會員中心資料背景色、 Footer 背景色
          900: "#000000",
        },
        tomato: {
          500: "#ff0000",
          // LOGO 名字 "B"， Slogan "找"
        },
        navy: {
          300: "#77c6ff",
          // LOGO 名字 "G"， Slogan "桌"
          900: "#091c32",
          // 討論區背景色
        },
        gold: {
          50: "#faffe1",
          // 網頁背景色
          300: "#ffc52c",
          // LOGO 名字 "F"， Slogan "友 "
        },
        orange: {
          400: "#fe721c",
          // 按鈕顏色
          600: "#ff6100",
          // 按鈕 hover 顏色
        },
        cyan: {
          500: "#58699d",
          // 討論區內文表頭背景色
          600: "#52596e",
          // 討論區分類背景色
        },
      },
    },
    minHeight: {
      '0': '0',
      '1/4': '25%',
      '1/2': '50%',
      '3/4': '75%',
      'full': '100%',
     },
  },
  variants: {
    extend: {},
  },
  plugins: [

  ],
};
