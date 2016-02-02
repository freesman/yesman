var webpack = require('webpack');

module.exports = {
  entry: './home.coffee',
  resolve:{
    extensions: ['', '.web.coffee', '.web.js', '.js', '.coffee']
  },
  output: {
    path: __dirname + '/dist',
  	filename: 'build.js',
    library: 'home'
  },
  modules:{
    loaders: [{test: /\.coffee$/, loader: 'coffee'}]
  }
}