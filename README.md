# FakeEnum

A gem which define enum classes with constants.

## Installation

Add this line to your application's Gemfile:

    gem 'fake_enum'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_enum

## Usage

To use enum, just create a class which extends fake_enum
```ruby
class Status
    extend FakeEnum

    ACTIVE   = 1
    ARCHIVED = 2
    DELETED  = 3
end
class Task < ActiveRecord::Base
  attr_accessible :status, :name, :description

  validates :name, :description, :presence => true
  validates :status, :inclusion => { :in => Status.to_a, :message => "%{value} is not a valid status" }
end
```

### Translations
fake_enum uses I18n for translations and leverages the namespace of the activerecord:
```yml
en:
  activerecord:
    fake_enums:
      status:
        active: 'Active'
        archived: 'Archived'
        deleted: 'Deleted'
```

### Methods
fake_enum offers some methods to help you:

`Status::ACTIVE` or `Status.from_s 'ACTIVE'` will return `1`

`Status.to_s 2` will return the string which represents the enum 2: `'ARCHIVED'`

`Status.to_sym 3` will return the symbol which represents the enum 3: `:deleted`

`Status.localize 1` will return the translation for enum 1: `'Active'`

`Status.to_a` will return an array of enums: `[1, 2, 3]`

`Status.to_localized_a` will return an array of translated enums: `['Ative', 'Archived', 'Deleted']`

`Status.to_localized_hash` will return a hash with translated enums: `{ "Active" => "1", "Archived" => "2", "Deleted" => "3" }`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
