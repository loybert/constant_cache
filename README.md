constant_cache
=============

A clone of "http://rubygems.org/gems/constant_cache", to provide this nice functionality on rails 4 and above. Too sad, there's no repository left to contribute to. 


Planned Features
================
- stable Rails 4 Support
- unobstrusive additive updating of cached Table on demand (won't break on duplicate keys)
- optional warning, if chosen attribute isn't defined as unique column
- generating constant-stubs for code-completion on demand
- custom rule how to name the constant (e.g. `key_value: 'ConstantCache'` => `CONSTANT_CACHE` instead of `CONSTANTCACHE`)
- ...

Feel free to suppose more Features. :)
