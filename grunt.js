module.exports = function(grunt){
  grunt.initConfig({
    coffee: {
      dist: {
        dir: 'coffee/',
        dest: 'js/'
      }
    },
    handlebars: {
      dist: {
        dir: 'templates/*.handlebars'
      }
    },
    watch: {
      /*
      coffee: {
        files: 'coffee/*.coffee',
        tasks: 'coffee:dist ok'
      },
      */
      handlebars: {
        files: '<config:handlebars.dist.dir>',
        tasks: 'handlebars:dist ok'
      }
    }
  });

  grunt.loadTasks('tasks');
  grunt.registerTask('default', 'coffee handlebars watch');
};