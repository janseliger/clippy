Clippy-AUI - Helping you copy text to your clipboard
================================================

Clippy is a very simple Flash widget that makes it possible to place arbitrary
text onto the client's clipboard. Here is what Clippy looks like on GitHub:

![Clippy in action](http://img.skitch.com/20090213-cjiawnwig8udf5a6qf1c45cne8.png)

Here is a sample Rails (Ruby) helper that can be used to place Clippy on a
page:

    def clippy(text, bgcolor='#FFFFFF')
      html = <<-EOF
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                width="110"
                height="14"
                id="clippy" >
        <param name="movie" value="/flash/clippy.swf"/>
        <param name="allowScriptAccess" value="always" />
        <param name="quality" value="high" />
        <param name="scale" value="noscale" />
        <param NAME="FlashVars" value="text=#{text}">
        <param name="bgcolor" value="#{bgcolor}">
        <embed src="/flash/clippy.swf"
               width="110"
               height="14"
               name="clippy"
               quality="high"
               allowScriptAccess="always"
               type="application/x-shockwave-flash"
               pluginspage="http://www.macromedia.com/go/getflashplayer"
               FlashVars="text=#{text}"
               bgcolor="#{bgcolor}"
        />
        </object>
      EOF
    end

New Features
------------
This update has pulled in a few new features. 
The parameters have been expanded to add a little more customisability.

Parameters:

* text - The text to be copied.  Default: none, this should be supplied.
* font - The font to use.  If not supported, it will fall back to defaults.  Default: Arial
* fontSize - Font size.  Default: 10
* copyMessage - A custom copy message to display. Default: copy text.
* copyCompleteMessage - a message to display when the copy is * complete. Default: copied.

This also uses the AUI copy icon from https://extranet.atlassian.com/display/AUI/Icon+Guide   

A test.html page has also been added to the build directory.
Installation (Pre-Built SWF)
---------------------------

If you want to use Clippy unmodified, just copy `build/clippy.swf` to your
`public` directory or wherever your static assets can be found.

Installation (Compiling)
------------------------

In order to compile Clippy from source, you need to install the following:

* [haXe](http://haxe.org/)
* [swfmill](http://swfmill.org/)

The haXe code is in `clippy.hx`, the button images are in `assets`, and the
compiler config is in `compile.hxml`. Make sure you look at all of these to
see where and what you'll need to modify. To compile everything into a final
SWF, run the following from Clippy's root directory:

    swfmill simple library.xml library.swf && haxe compile.hxml

If that is successful, copy `build/clippy.swf` to your `public` directory or wherever your static assets can be found.

Mac OS note:
You will likely need to create a few symlinks in `/usr/local/lib`

* `libfreetype.6.dylib -> /opt/local/lib/libfreetype.6.dylib`
* `libpng12.0.dylib -> /usr/X11/lib/libpng12.0.dylib`

Freetype was installed with mac ports and libpng was taken from X11.


Contribute
----------

If you'd like to hack on Clippy, start by forking the repo on GitHub:

https://github.com/atlassian/clippy

The best way to get your changes merged back into core is as follows:

1. Clone down your fork
1. Create a topic branch to contain your change
1. Hack away
1. If you are adding new functionality, document it in README.md
1. If necessary, rebase your commits into logical chunks, without errors
1. Push the branch up to GitHub
1. Send a pull request for your branch

License
-------

MIT License (see LICENSE file)