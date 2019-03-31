---
layout: post
title:  "Decorator Pattern in Ruby"
date:   2011-04-19 12:29:52 +0200
categories: ruby
---

Decorators allow us to add behavior to objects without affecting other objects of the same class.
The decorator pattern is a useful alternative to creating sub-classes.

Read more about Decorator Pattern [here](https://en.wikipedia.org/wiki/Decorator_pattern).

Read:
- [Evaluating Alternative Decorator Implementations In Ruby](https://robots.thoughtbot.com/evaluating-alternative-decorator-implementations-in)
- [Decorator Pattern in Ruby](http://nithinbekal.com/posts/ruby-decorators)

You can use [`SimpleDelegator`](https://docs.ruby-lang.org/en/2.3.0/SimpleDelegator.html) for building Decorators in Ruby.

> NOTE: Please read about the Ruby class [`SimpleDelegator`](https://docs.ruby-lang.org/en/2.3.0/SimpleDelegator.html) and its parent class [`Delegator`](https://docs.ruby-lang.org/en/2.3.0/Delegator.html) to understand how it works.

Example:

```ruby
class User
  def initialize(first_name:, last_name:, birthday:)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
  end

  attr_accessor :first_name, :last_name, :birthday
end
```

```ruby
class UserDecorator < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    # 60 * 60 * 24 * 365.25 is 31557600
    # 31557600 is one year in seconds
    ((Time.now - birthday) / 31557600).floor
  end
end
```

```ruby
user = User.new(
  first_name: "Aleksandar",
  last_name: "Popovic",
  birthday: Time.new(1981, 9, 18, 4, 0, "+01:00")
)

user_decorator = UserDecorator.new(user)

user_decorator.class # => UserDecorator
user_decorator.first_name # => "Aleksandar"
user_decorator.last_name # => "Popovic"
user_decorator.full_name # => "Aleksandar Popovic"
user_decorator.birthday # => 1996-06-27 06:00:00 +0300
user_decorator.age # => 20
```