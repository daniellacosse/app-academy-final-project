#dArt#
**a modernized deviantArt clone**  
designed and built by [da.niellacos.se](http://da.niellacos.se/) in, like, ten days

[go to it](http://dart-da.niellacos.se/)

Features:
===
1. Login with Facebook.
2. Upload images, write journals, create collections of images (galleries)
3. Like && Comment (on Users, Images, Journals, sometimes Galleries)
4. Message users and receive notifications from and for likes and comments
5. Fuzzy search across tags and titles

Tech:
===
**Database/Backend:** <br>
&emsp;&emsp;&emsp;Postgresql, Rails (w/ API layer) <br>
**Frontend:** <br>
&emsp;&emsp;&emsp;[Backbone application](http://backbonejs.org/) for the user page<br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(which, to my chagrin, has since broken everything/I regret not having a stable branch/#lessonlearned)<br>
&emsp;&emsp;&emsp;[masonry.js](http://masonry.desandro.com/) for showing image collections in a grid-like fashion<br>
&emsp;&emsp;&emsp;UJS for likes and comments<br>
**Custom CSS!**

Todos/Known Issues:
===
1. Add tutorial to help guide people through the app remotely
2. SQL Cleanup & general optimization<br>
&emsp;a. Create objects through their associations!<br>
&emsp;b. cut out unnecessary non-api routes, as many of them were moved into backbone<br>
&emsp;c. Much refactoring, comrade<br>
3. Redo icon (minor).
4. Drag and drop for image upload (via [filepicker.io](https://www.inkfilepicker.com/))
5. Amend ability to scroll through comments sections
6. Fix post-submission content injection; currently you must refresh the page to confirm submission.
7. Images, when displayed in lightbox mode, do not resize vertically :/

Wish List:
===
See [my blog post](http://daniellacosse.tumblr.com/post/82960380108/whale-coven-droit-twerp) on the matter (start reading after 'I have three-ish stretch goals')
