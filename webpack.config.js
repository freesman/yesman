var webpack = require('webpack');
var mode = process.env.mode || 'development';

module.exports = {
  context: __dirname + '/app',
  entry: {
    home: 'coffee!./home.coffee',
    about: 'coffee!./about.coffee'
  },
  resolve:{
    extensions: ['', '.web.coffee', '.web.js', '.coffee', '.js']
  },

  output: {
    path: mode == 'development' ? __dirname + '/dist' : __dirname + '/public',
  	filename: '[name].js',
    library: '[name]'
  },

  modules:{
    loaders: [{test: /\.coffee$/, loader: 'coffee'}]
  },

  watch: mode == 'development',

  watchOptions: {
    aggregateTimeout: 100
  },

  devtool: mode == 'development' ? 'eval' : null,

  plugins: [
    new webpack.NoErrorsPlugin(),
    new webpack.optimize.CommonsChunkPlugin({
      name: 'common',
      chunks: ['home', 'about']
    }),
    new webpack.DefinePlugin({
      mode: JSON.stringify(mode)
    })
  ]
};

if (mode != 'development'){
  module.exports.plugins.push(
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false,
        drop_console: true,
        unsafe: true
      }
    })
  );
}