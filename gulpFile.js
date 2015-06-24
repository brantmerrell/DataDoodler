var gulp = require('gulp');
var jshint = require('gulp-jshint');
var jscs = require('gulp-jscs');
var gulpprint = require('gulp-print');
var gulpif = require('gulp-if');
var args = require('yargs').argv;

gulp.task('vet', function () {
    'use strict';
        return gulp
		  .src([
            './src/**/*.js',
			'./*.js'])
		.pipe(gulpif(args.verbose, gulpprint()))
		.pipe(jscs())
		.pipe(jshint())
		.pipe(jshint.reporter('jshint-stylish', {verbose: true}));
});
