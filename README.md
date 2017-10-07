# LinkToAddFields
![](https://i.imgur.com/OGnj3Af.gif) 
 
Dynamically add nested fields to your Rails forms.  
When clicked, `link_to_add_fields` will render the association's fields partial 
above it.  
`link_to_remove_fields` will hide the HTML element matching it's 
target css selector. It also sets a truthy value in the hidden input field 
closest to it, name this field `_destroy` to remove models.  

After seeing this idea in a Rails casts episode I ended up using it so often I 
thought it worth making a gem.

## Installation
Make sure you have jQuery installed.  

Add this line to your application's Gemfile:
```ruby
gem 'link_to_add_fields'
```

Then execute:
```bash
$ bundle
```

And require `link_to_add_fields` in application.js, after jQuery.
```javascript
//
//= require jquery
//= require link_to_add_fields
//= require_tree .

```

## Usage
### `link_to_add_fields(name, builder, association, options = {}) => String`
#### Parameters:
 - name (String) -- Name of the link, passed to `link_to`.
 - builder (ActionView::Helpers::FormBuilder) -- Parent form builder object.
 - association (Symbol) -- Child association name (pluralised).
 - options (Hash) (defaults to: {}) -- a customizable set of options.
#### Options Hash (options):
 - :partial (String) -- Path to partial, override the inferred partial. If left 
blank will be inferred form the form's model's name and the association 
(signularised), eg `posts/comment_fields`
 - other options are passed through to `link_to`.

### `link_to_remove_fields(name, target, options = {}) => String`
#### Parameters:
  - name (String) -- Name of the link, passed to `link_to`.
  - target (String) -- Css selector to hide.
  - options (Hash) (defaults to: {}) -- a customizable set of options.
#### Options Hash (options):
 - other options are passed through to `link_to`.

## Example
`post_form.html.erb`
```erb
  <%= form_for @post do |f| %>
    <%= f.label :name %>
    <%= f.text_field :name %><br>

    <%= f.label :body %>
    <%= f.text_area :body %><br>

    <%= f.fields_for :comments do |ff| %>
      <%= render partial: "comment_fields", locals: { f: ff } %>
      <br>
    <% end %>

    <%= link_to_add_fields 'Add comment', f, :comments %><br>

    <%= f.submit %>
  <% end %>
```
`comment_fields.html.erb`
```erb
  <div class="comment_fields">
    <%= f.label :body, 'Comment' %>
    <%= f.text_area :body %><br>

    <%= f.hidden_field :_destroy %>
    <%= link_to_remove_fields 'Remove comment', '.comment_fields' %>
  </div>
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
