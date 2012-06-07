module.exports = function(grunt){
	
	var log = grunt.log;

	function handleResult(from, dest, err, stdout, code, done) {
		if(err){
			grunt.helper('growl', 'HANDLEBARS COMPILING GOT ERROR', stdout);
			log.writeln(from + ': failed to compile to ' + dest + '.');
			log.writeln(stdout);
			done(false);
		}else{
			log.writeln(from + ': compiled to ' + dest + '.');
			done(true);
		}
	}

	grunt.registerHelper('handlebars_file_to_file', function(filePath, newFilePath, done) {
		var args = {
			cmd: 'handlebars',
			args: [ filePath, '-m', '-f', newFilePath ]
		};

		grunt.helper('exec', args, function(err, stdout, code){
			handleResult(filePath, newFilePath, err, stdout, code, done);
		});
	});

	grunt.registerMultiTask('handlebars', 'precompile handlebars templates', function() {

		var done = this.async();
		//var files = this.data.files;
		var dir = this.data.dir;
		var dest = this.data.dest;

		if(dir) {
			
			// if destination was not defined, compile to same dir
			if(!dest) {
				dest = dir;
			}

			var files = grunt.file.expandFiles(dir);

			files.forEach(function(filePath) {
				var newFilePath = filePath.replace('.handlebars', '.js')

				grunt.helper('handlebars_file_to_file', filePath, newFilePath, done);
			});

			return;
		}
	});
};