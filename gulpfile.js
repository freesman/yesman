var gulp = require('gulp');
var jade = require('gulp-jade');
var coffee = require('gulp-coffee');
var shell = require('gulp-shell');


gulp.task('default', ['jade', 'scripts'], function() {
});

gulp.task('jade', function() {
  return gulp.src('app/*.jade')
    .pipe(jade({pretty: true}))
    .pipe(gulp.dest('tmp'))
});

gulp.task('scripts', () => {
  return gulp.src('app/scripts/**/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('tmp/scripts'));
});