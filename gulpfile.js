const { src, dest, watch, series, compile, img} = require('gulp');
const sass = require('gulp-sass')(require('sass'));
const sourcemaps = require('gulp-sourcemaps');
const prefix = require('gulp-autoprefixer');
const minify = require('gulp-clean-css');
const terser = require('gulp-terser');
const rename = require('gulp-rename');
const imagemin = require('gulp-imagemin');
const imagewebp = require('gulp-webp');


//compile, prefix, map and min scss
function compilescss() {
  return src('app/scss/**/*.scss')
// compoile
    .pipe(sass())
    .pipe(prefix('last 2 versions'))
    .pipe(rename({basename: 'main'}))
    .pipe(dest('app/css/'))
// map
    .pipe(sourcemaps.init())
    .pipe(sass())
    .pipe(sourcemaps.write('.'))
    .pipe(dest('app/css/'))
// minify
    .pipe(minify())
    .pipe(rename({basename: 'min-main'}))
    .pipe(dest('app/css/')) 
};


//optimize and move images
function optimizeimg() {
  return src('app/images/src/**/*')
    .pipe(imagemin([
      imagemin.mozjpeg({ quality: 50, progressive: true }),
      imagemin.optipng({ optimizationLevel: 5 }),
    ]))
    .pipe(dest('app/images/dist/')) 
};

//optimize and move images
function webpImage() {
  return src('app/images/dist/**/*.{jpg,png}')
    .pipe(imagewebp())
    .pipe(dest('app/images/dist/webp/')) 
};


// minify js
function jsmin(){
  return src('app/js/src/*.js')
    .pipe(terser())
    .pipe(dest('app/js/dist/')); 
}

//watchtask
function watchTask(){
  //watch('packages/sns_template/Resources/Public/Images/img/**/*', optimizeimg); 
  //watch('packages/sns_template/Resources/Public/Images/gulp-img/**/*.{jpg,png}', webpImage); 
  watch('app/js/src/*.js', jsmin); 
  watch('app/scss/**/*.scss', compilescss); 
}


// Compile Gulp Task
exports.compile =  series(
  compilescss,
  jsmin
);

// IMG Gulp Task
exports.img =  series(
  optimizeimg,
  webpImage
);

// Default Gulp task 
exports.default = series(
  compilescss,
  jsmin,
  watchTask
);