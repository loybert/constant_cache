contant_cache
=============
[![Build Status](https://travis-ci.org/loybert/constant_cache.svg?branch=rails-plugin)](https://travis-ci.org/loybert/constant_cache)

a clone of "http://rubygems.org/gems/constant_cache", to provide this nice functionality on rails 4 and above

Planned Features
================
- stable Rails 4 Support
- unobstrusive additive updating of cached Table on demand (won't break on duplicate keys)
- optional warning, if chosen attribute isn't defined as unique column
- generating constant-stubs for code-completion on demand
- use concerns instead of mixins
- ...

Feel free to suppose more Features. :)


New Features
============
- moved constant_name into Helper, instead of extending String Class
- custom rule how to name the constant (e.g. `key_value: 'ConstantCache'` => `CONSTANT_CACHE` instead of `CONSTANTCACHE`)




Legacy Readme =>>>>>>>>>

= Constant Cache

When your database has tables that store lookup data, there is a tendency 
to provide those values as constants in the model.  If you have an
account_statuses table with a corresponding model, your constants may look
like this:

  class AccountStatus
    ACTIVE   = 1
    PENDING  = 2
    DISABLED = 3
  end

There are a couple of problems with this approach:

As you add more lookup data to the table, you need to ensure that you're 
updating your models along with the data.  

The constants are stored as integer values and need to match up exactly 
with the data that's in the table (not necessarily a bad thing), but this
solution forces you to write code like this:

  Account.new(:username => 'preagan', :status => AccountStatus.find(AccountStatus::PENDING))

This requires multiple calls to find and obfuscates the code a bit.  Since classes
in Ruby are executable code, we can cache the objects from the database at runtime
and use them in your application.

== Installation

This code is packaged as a gem, so simply use the `gem` command to install:

  gem install constant_cache

== Example

"Out of the box," the constant_cache gem assumes that you want to use the 'name' column to generate
constants from a column called 'name' in your database table.  Assuming this schema:

  create_table :account_statuses do |t|
    t.string :name, :description
  end

  AccountStatus.create!(:name => 'Active',   :description => 'Active user account')
  AccountStatus.create!(:name => 'Pending',  :description => 'Pending user account')
  AccountStatus.create!(:name => 'Disabled', :description => 'Disabled user account')

We can use the plugin to cache the data in the table:

  class AccountStatus
    caches_constants
  end

Now you can write code that's a little cleaner and not use multiple unnecessary find calls:

  Account.new(:username => 'preagan', :status => AccountStatus::PENDING)

If the column you want to use as the constant isn't 'name', you can set that in the model. If
we have :name, :slug, and :description, we can use 'slug' instead:

  class AccountStatus
    caches_constants :key => :slug
  end
  
The value for the constant is truncated at 64 characters by default, but you can adjust this as
well:

  class AccountStatus
    caches_constants :limit => 16
  end

== Acknowlegements

Thanks to Dave Thomas for inspiring me to write this during his Metaprogramming talk at a Rails Edge 
conference in early 2007.

Copyright (c) 2007 Patrick Reagan of Viget Labs (mailto:patrick.reagan@viget.com), released under the MIT license
