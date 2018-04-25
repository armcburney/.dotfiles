/**
 * Gruntfile.js
 *
 * Tasks for compiling TypeScript and copying assets to target/ destination
 * folder.
 */

module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({
    copy: {
      build: {
        files: [
          {
            expand: true,
            cwd: "./public",
            src: ["**"],
            dest: "./target/public"
          },
          {
            expand: true,
            cwd: "./views",
            src: ["**"],
            dest: "./target/views"
          }
        ]
      }
    },
    ts: {
      app: {
        files: [{
          src: ["bin/run.ts", "app.ts", "routes/\*\*/\*.ts"],
          dest: "./target"
        }],
        options: {
          module: "commonjs",
          target: "es6",
          sourceMap: false
        }
      }
    }
  });

  // Npm tasks
  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-ts");

  // Register copy and ts tasks
  grunt.registerTask("default", ["copy", "ts"]);
};
