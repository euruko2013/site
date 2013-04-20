EuRuKo 2013 website
====

This is the code repository for the official [EuRuKo 2013 website](http://euruko2013.org)

Contributing
------------

Once you've made your great commits:

1. [Fork][fk] this repo
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create an [Issue][is] with a link to your branch
5. That's it!

[fk]: http://help.github.com/forking/
[is]: http://github.com/euruko2013/site/issues

Writing a new blog post
--------------------------

01. [Fork][fk] this repo
02. Create a topic branch - `git checkout -b my_new_blog_post`
03. Run bundler - `bundle install`
04. Use middleman to create a new article - `middleman article "A TITLE"`
05. Edit `source/blog/<date>-a-title-.html.markdown`, it supports [Markdown](http://daringfireball.net/projects/markdown/)
06. Add tags and the author - the author is being looked up into `source/images/committee` and his picture appears besides the blog post
07. Build the blog - `middleman build`
08. Commit the article (under `source`) and the `build/blog` changes
09. Create a new pull request or push to origin/master if you have access
10. Deploy it live (those who can, know how to do it)

Note: You have to manually put quotes to the blog title IN the markdown file, in order to build.
