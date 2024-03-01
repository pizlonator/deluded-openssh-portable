#!/usr/bin/env ruby

Dir.glob("**/*.[ch]") {
    | filename |
    contents = IO::read(filename)
    #contents.gsub!(/OPENSSL_zalloc\(sizeof\(\*([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc_zero(typeof(*#{$1}), 1)"
    #}
    #contents.gsub!(/OPENSSL_zalloc\(sizeof\(([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc_zero(#{$1}, 1)"
    #}
    #contents.gsub!(/OPENSSL_malloc\(sizeof\(\*([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$1}), 1)"
    #}
    #contents.gsub!(/zalloc_zero/) {
    #    | match |
    #    "zalloc"
    #}
    #contents.gsub!(/zalloc_flex_zero/) {
    #    | match |
    #    "zalloc_flex"
    #}
    #contents.gsub!(/zalloc_clone/) {
    #    | match |
    #    "zalloc_like"
    #}
    #contents.gsub!(/xcalloc\(([^\n]+), sizeof\(\*([a-zA-Z0-9_>]+)\)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$2}), #{$1})"
    #}
    #contents.gsub!(/calloc\(([^\n]+), sizeof\(\*([a-zA-Z0-9_]+)\)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$2}), #{$1})"
    #}
    #contents.gsub!(/calloc\(sizeof\(\*([a-zA-Z0-9_]+)\), ([^\n]+)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$1}), #{$2})"
    #}
    contents.gsub!(/xzalloc/) { | match | "zalloc" }
    #contents.gsub!(/xrecallocarray\(([^\n]+),\s+([^\n]+),\s+([^\n]+),\s+sizeof\(([a-zA-Z0-9_*]+)\)\)/) {
    #    | match |
    #    "zrealloc(zrestrict(#{$1}, typeof(#{$4}), #{$2}), typeof(#{$4}), #{$3})"
    #}
    #contents.gsub!(/recallocarray\(([^\n]+),\s+([^\n]+),\s+([^\n]+),\s+sizeof\(([a-zA-Z0-9_*]+)\)\)/) {
    #    | match |
    #    "zrealloc(zrestrict(#{$1}, typeof(#{$4}), #{$2}), typeof(#{$4}), #{$3})"
    #}
    #contents.gsub!(/recallocarray\(([^\n]+),\s+([^\n]+),\s+([^\n]+),\s+sizeof\(([a-zA-Z0-9_*>-]+)\)\)/) {
    #    | match |
    #    "zrealloc(zrestrict(#{$1}, typeof(#{$4}), #{$2}), typeof(#{$4}), #{$3})"
    #}
    #contents.gsub!(/xzrealloc/) { | match | "zrealloc" }
    #contents.gsub!(/calloc\(([^\n]+), sizeof\(([a-zA-Z0-9_ *]+)\)\)/) {
    #    | match |
    #    "zalloc(#{$2}, #{$1})"
    #}
    #contents.gsub!(/xcalloc\(([^\n]+), sizeof\(\*([a-zA-Z0-9_>-]+)\)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$2}), #{$1})"
    #}
    #contents.gsub!(/calloc\(([^\n]+), sizeof\(\*([a-zA-Z0-9_>-]+)\)\)/) {
    #    | match |
    #    "zalloc(typeof(*#{$2}), #{$1})"
    #}
    #contents.gsub!(/xreallocarray\(([^\n]+),\s+([^\n]+),\s+sizeof\(([a-zA-Z0-9_*]+)\)\)/) {
    #    | match |
    #    "zrealloc(#{$1}, typeof(#{$3}), #{$2})"
    #}
    #contents.gsub!(/xrecallocarray\(\s*([^\n]+),\s+([^\n]+),\s+([^\n]+),\s+sizeof\(([a-zA-Z0-9_*>-]+)\)\)/) {
    #    | match |
    #    "zrealloc(zrestrict(#{$1}, typeof(#{$4}), #{$2}), typeof(#{$4}), #{$3})"
    #}
    contents.gsub!(/xcalloc\(\s*([^\n]+),\s+sizeof\(([a-zA-Z0-9_*>-]+)\)\)/) {
        | match |
        "zalloc(typeof(#{$2}), #{$1})"
    }
    IO::write(filename, contents)
}
