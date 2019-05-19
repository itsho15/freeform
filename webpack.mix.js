const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css');

mix.styles([
    'public/css/bootstrap.css',
    'public/css/bootstrap-theme.css',
    'public/css/font-awesome.css',
    'public/css/fonts.css',
    'public/css/owl.carousel.css',
    'public/css/animate.css',
    'public/css/sidebar.css',
    'public/css/nprogress.css',
    'public/css/jquery.fancybox.css',
    'public/css/style.css',
    'public/css/mobile.css',
], 'public/css/all.css');

mix.scripts([
    'resources/js/assets/jquery-1.11.0.min.js',
    'resources/js/assets/bootstrap.js',
    'resources/js/assets/bootstrap-carousel.js',
    'resources/js/assets/owl.carousel.js',
    'resources/js/assets/wow.min.js',
    'resources/js/assets/nprogress.js',
    'resources/js/assets/jquery.fancybox.js',
    'resources/js/assets/java.js',

], 'public/js/all.js');