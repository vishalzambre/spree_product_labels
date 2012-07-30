SpreeProductLabels
==================

Extension for creating and adding labels to products.

Labels may be shown for every product so you can expand the information. For example "Offer!", or "Just received".

Since every view for the product may be different for every Spree store, the gem currently has no views for the product view in the store, just the administration links.

Labels are suppossed to be created with CSS in the product view, that's why they are stored with a shape, a color and a text.

Installation
============

Add the gem to your Gemfile:

```ruby
gem 'spree_product_labels', :git => 'git://github.com/eltercero/spree_product_labels'
```

And then run the installer with the migrations.

```bash
rails g spree_product_labels:install
```

How to use
==========


Copyright (c) 2012 eltercero, released under the New BSD License
