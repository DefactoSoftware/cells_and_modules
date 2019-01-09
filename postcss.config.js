// const fs = require("fs-extra");
const path = require("path");
const md5 = require("md5");

module.exports = {
  ident: "postcss",
  plugins: {
    "postcss-modules": {
      generateScopedName: function(name, filename, css) {
        const relativeFileName = path.relative(process.cwd(), filename);
        const directories = path.dirname(filename).split("/");
        const directory = directories.slice(-1);
        const hash = md5(relativeFileName).substring(0, 5);

        return "_" + directory + "_" + hash + "__" + name;
      }
      // getJSON: function(cssFileName, json) {
      //   fs.outputJsonSync(cssFileName + ".json", json);
      //
      //   return json;
      // }
    }
  }
};
