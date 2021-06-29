module.exports = {
  devServer: {
    disableHostCheck: true,
    port: 4001,
    public: '0.0.0.0:4001'
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
