const path = require("path");
const glob = require("glob");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const CleanWebpackPlugin = require("clean-webpack-plugin");

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new UglifyJsPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    app: ["./assets/js/app.js"].concat(
      glob.sync("./lib/cells_and_modules_web/views/**/*.js"),
      glob.sync("./lib/cells_and_modules_web/views/**/*.css")
    )
  },
  output: {
    filename: "js/[name].js",
    path: path.resolve(__dirname, "priv/static")
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },
      {
        test: /\.css$/,
        use: [
          "style-loader",
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              importLoaders: 1
            }
          },
          "postcss-loader"
        ]
      }
    ]
  },
  plugins: [
    new CleanWebpackPlugin(["priv/static"]),
    new MiniCssExtractPlugin({ filename: "css/[name].css" }),
    new CopyWebpackPlugin([{ from: "./assets/static/", to: "./" }])
  ]
});
