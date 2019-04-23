---
layout: post
title:  "Policy object"
date:   2019-04-23 12:29:52 +0200
categories: rails
---

`Policy object pattern`

is the simplest pattern described. Both naming and design rules are very clear and the object itself is very useful, readable and easy to test.

When you have to deal with permissions, roles or policies then you will find this pattern useful in your Rails application.

You can use this pattern each time you have to check if something or someone is allowed to do the action.

You may check permissions of a given user, IP address or any other entity.

Let's have a look at the practical side of this pattern to know how to use it in action.

`Naming`

As I mentioned before, naming rules are very simple. Filename usually has `_policy` suffix applied,
method names are meaningful and always end with the ? character. The following names are valid:

```ruby
RolesPolicy#admin? and RolesPolicy#moderator?
Validators::Email.valid?
PostsPolicy#published?
```

Sometimes it does not make sense to add `_policy` suffix and validators are the perfect example of
such case.

`Design`

If you want to have a pure-policy object, you have to stick to the following set of rules:

`• method has to return a boolean value`

`• inside the method body, we should only call methods on the passed objects, do comparing or any
other calculations`

`• the logic inside the method should be as simple as possible`

The following policy object is a perfect example of our pattern:

```ruby
class UsersPolicy
  def initialize(user)
    @user = user
  end

  def admin?
    confirmed? && @user.role == 'admin'
  end

  def confirmed?
    @user.email.present? && @user.confirmed_at.present?
  end

  def has_debt?
    @user.account.amount < 0
  end
end
```

As you can see we don't touch the database and we limit our actions to calling other methods and
comparing the data. This is the main purpose of policies. They are light, simple pure Ruby objects
used for managing permissions across the whole app. They are easy to test and are a perfect
replacement for the complex conditions.

`Usage`

If talking about the complex conditions, let's take a look at the following piece of code:

```ruby
class PostsController < ApplicationController
  def create
    if @blog.mode == 'live' && @blog.redactors.size > 0 \
      && (current_user.role == 'admin' || \
        (current_user.role == 'moderator' && current_user.verified_email))
      # create post
    end
  end
end
```

Above condition checks, if a post can be created. It is long, ugly and not readable at all. Let's refactor
it using policies pattern:

```ruby
class PostsCreationPolicy
  def live_blog_with_redactors?(blog)
    blog.mode == 'live' && blog.redactors.size > 0
  end

  def user_with_suitable_role?(current_user)
    admin_user?(current_user) ||
    moderator_user_with_verified_email?(current_user)
  end

  private

  def admin_user?(current_user)
    current_user.role == 'admin'
  end

  def moderator_user_with_verified_email?(current_user)
    current_user.role == 'moderator' && current_user.verified_email
  end
end
```
our controller with the policy object used to looks like the following:

```ruby
class PostsController < ApplicationController
  def create
    if creation_policy.live_blog_with_redactors?(@blog) \
      && creation_policy.user_with_suitable_role?(current_user)
      # create post
    end
  end

  private

  def creation_policy
    PostsCreationPolicy.new
  end
end
```
Now, with the refactored version, you can easily tell what conditions have to be satisfied in order to
create a new post without looking at the policy object implementation. Testing controller is a lot easier
because you have to only stub two calls from the policy.

Policies in models

There is also another commonly used way of refactoring complex queries and it's about creating
small policy methods on the model class:

```ruby
class User < ActiveRecord::Base
  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def authorable?
    return true if admin?
    moderator? && verified_email
  end
end
```

and Blog model:

```ruby
class Blog < ActiveRecord::Base
  def live?
    mode == 'live'
  end

  def any_redactors?
    redactors.any?
  end

  def publishable?
    live? && any_redactors?
  end
end
```

now we can drop our policy and refactor controller again:

```ruby
class PostsController < ApplicationController
  def create
    if @blog.publishable? && current_user.authorable?
      # create post
    end
  end
end
```
the final setup is so simple and clear that there is no need to change it more. Main policy methods publishable? and authorable? are less detailed but still give a clue that we are checking if we can
publish a post on a blog and if the given user can be an author.

`Summary`

The policy pattern is a small concept but gives big results. Each time you have to deal with the
complex condition, think about the policy object and make itself explainable thanks to the meaningful
names. When it comes to the testing with RSpec, you don't have to use records in the database. Your
policies are pure-Ruby objects so your tests are going to be very fast.
