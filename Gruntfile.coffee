module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),
    uglify:
      build:
        src: 'build/**/*.js',
        dest: 'build/scripts.min.js'
    coffee:
      app:
        expand: true
        flatten: true
        join: true
        separator: '---------------------'
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'build/scripts'
        ext: '.js'
    compass:
      # dist:
      dev:
        options:
          sassDir: 'src'
          cssDir: 'build/styles'
    cssmin:
      combine:
        files:
          'build/styles.min.css': ['build/**/*.css'],
    watch:
      options:
        livereload: true
      coffeescripts:
        files: ['src/**/*.coffee']
        tasks: ['coffee']
      sass:
        files: ['src/**/*.scss']
        tasks: ['compass']






# Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  # Default task(s).
  grunt.registerTask('default', ['uglify', 'coffee', 'compass', 'cssmin', 'watch'])

