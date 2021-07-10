module.exports = {
    devServer: {
      disableHostCheck: true,
      port: 4002,
      public: '0.0.0.0:4002'
  },
    publicPath: "/",
    "transpileDependencies": [
      "vuetify",
    ],
    configureWebpack: {
      devtool: 'source-map',
    },
    chainWebpack: (config) => {
      config
        .plugin('html')
        .tap((args) => {
          args[0].title = 'finalProject';
          return args;
        });
    },  
  }
  