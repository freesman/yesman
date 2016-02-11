var webpack = require('webpack');
var mode = process.env.mode || 'development';
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: path.join(__dirname, 'app'),
  entry: {
    common: './common',
    home: './home'
  },
  resolve:{
    extensions: ['', '.web.coffee', '.web.js', '.coffee', '.js'],
  },

  output: {
    path: mode == 'development' ? path.join(__dirname, 'dist') : path.join(__dirname, 'public'),
    publicPath: path.join('D:/yesman-builder/dist/'),
  	filename: '[name].js',
    library: '[name]'
  },

  module:{
    loaders: [
      {test: /\.coffee$/, loader: 'coffee'},
      {test: /\.jade$/, loader: 'jade'},
      {test: /\.css$/, loader: ExtractTextPlugin.extract('css!autoprefixer?browsers=last 2 versions')},
      {test: /\.styl$/, loader: ExtractTextPlugin.extract('css!autoprefixer?browsers=last 2 versions!stylus?resolve url')},
      {test: /\.(png|jpg|svg)$/, loader: 'url?name=[path][name].[ext]&limit=4096'}
    ]
  },

  watch: mode == 'development',

  watchOptions: {
    aggregateTimeout: 100
  },

  devtool: mode == 'development' ? 'eval' : null,

  //noParse: /jquery\/jquery.js/,
  noParse: wrapRegexp(/\/node_modules\/(jquery)/),

  plugins: [
    new webpack.NoErrorsPlugin(),
    new ExtractTextPlugin('[name].css', {allChunks: true}),
    new webpack.optimize.CommonsChunkPlugin({
      name: 'common',
      chunks: ['home', 'about']
    }),
    new webpack.DefinePlugin({
      mode: JSON.stringify(mode)
    })
  ]
};

function wrapRegexp(regexp, label){
  regexp.test = function(path) {
    console.log(label, path);
    return RegExp.prototype.test.call(this, path);
  };
  return regexp;
}

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