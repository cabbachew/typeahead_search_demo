# Typeahead Searching with Hotwire

Following [this article](https://thoughtbot.com/blog/hotwire-typeahead-searching) from [Thoughtbot](https://thoughtbot.com/blog), this demo application utilizes an out-of-the-box Rails installation to build a collapsible search-as-you-type text box that expands to show its results in-line while searching, supports keyboard navigation and selection, and only submits requests to our server when there is a search term.

## Filling in the Gaps

The source article states that code samples contained in it "omit the majority of the application's setup." I will attempt to cover some of the missing pieces here.

### The Setup

After generating a Message scaffold, running `bin/rails db:migrate` and declaring `root 'searches#home'` in `routes.rb` enables us to start up the `rails server` and see the application in action. Remember to add a `home` action to the `SearchesController` as well as the corresponding view.

### The `Message.containing` Scope

This was a tricky step to navigate because Rails out-of-the-box comes with SQLite and not PostgreSQL, which means that [ILIKE](https://www.postgresql.org/docs/12/functions-matching.html#FUNCTIONS-LIKE) expressions are not available. Rather than changing the database driver, I opted to use the [LIKE](https://www.sqlitetutorial.net/sqlite-like/) expression, which is case-insensitive in SQLite. The resulting scope is as follows:

```ruby
# app/models/message.rb
class Message < ApplicationRecord
  scope :containing, -> (query) { where("body LIKE ?", "%#{query}%") }
end
```