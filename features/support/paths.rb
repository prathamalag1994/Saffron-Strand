# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the Sign In page/
      '/users/sign_in'

    when /^the Menu page/
      '/menu'

    when /^the Admin Items Index page/
      '/admin/items'

    when /^the Admin New Item page/
      '/admin/items/new'

    when /^the details page for "(.*)"/
      @item = Item.find_by_name($1)
      admin_item_path(@item)

    when /^the edit page for "(.*)"/
      @item = Item.find_by_name($1)
      edit_admin_item_path(@item)

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)