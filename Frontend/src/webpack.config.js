const path = require('path');

module.exports = {
  resolve: {
    fallback: {
      "zlib": require.resolve("browserify-zlib"),
      "querystring": require.resolve("querystring-es3"),
      "path": require.resolve("path-browserify"),
      "crypto": require.resolve("crypto-browserify"),
      "stream": require.resolve("stream-browserify"),
      "buffer": require.resolve("buffer"),
      "util": require.resolve("util/"),
      "fs": false,    // `fs` is not available in the browser, so set it to false
      "url": require.resolve("url/")
    }
  },
  devServer: {
    setupMiddlewares: (middlewares, devServer) => {
      // Before internal middlewares
      devServer.app.get('/some/path', (req, res) => {
        res.json({ custom: 'response' });
      });

      // After internal middlewares
      console.log('After setup middleware');

      return middlewares;
    },
    // ... other devServer options ...
  }
};
