# Tools

TODO

You will have to learn how to use [Command-line interface](https://en.wikipedia.org/wiki/Command-line_interface) (CLI) since you will be spending a lot of time there. You will be spending a lot of time typing text so picking up a good text editor like [Sublime Text](http://www.sublimetext.com/3) or IDE (integrated development environment) like [RubyMine](http://www.jetbrains.com/ruby) will help. You will also be changing the code a lot so learning how to use a [version control](https://en.wikipedia.org/wiki/Revision_control) tool like [Git](http://git-scm.com) is important. A lot of tools that are mentioned in this book are hosted at [GitHub](https://github.com), Git hosting service.

##  Command-line interface (CLI)

Command-line interface (CLI) is just another application. It is already installed, whether you are using Windows, Mac or Linux. CLI looks similar and behaves similarly on Mac and Linux, and it it slightly different on Windows.

### Windows

On Windows, the application is called *Command Prompt*. To open it (on Windows 8.1), go to *Apps* screen (swipe up, or click *down* arrow at the bottom of the screen) and it should be located in *Windows System* section.

![*Command Prompt* app on Windows 8.1 *Apps* screen](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_windows_apps_command_prompt.png)

C> *Command Prompt app on Windows 8.1 Apps screen*

You can also search for it.

![Searching for *Command Prompt* app on Windows 8.1](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_windows_search_command_prompt.png)

C> *Searching for Command Prompt app on Windows 8.1*

I could not find a keyboard shortcut to open *Command Prompt*.

By default, when you open *Command Prompt*, text similar to this will be displayed:

    ﻿Microsoft Windows [Version 6.3.9600]
    (c) 2013 Microsoft Corporation. All rights reserved.

    C:\Users\IEUser>

![*Command Prompt* app on Windows 8.1](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_windows_command_prompt.png)

C> *Command Prompt app on Windows 8.1*

You can ignore the first two lines. The last line, `C:\Users\IEUser>` is important. It is called command prompt (or just prompt). `C:\Users\IEUser` part is the folder where Command Prompt commands will be executed (path). `IEUser` is the name of the current user. The last character, `>`, separates path from the text that you will enter. Since both Mac and Linux use `$` as separator, this book will use that character. In short, if an instruction in the book says you should run a Ruby file with this command:

    $ ruby file_name.rb

Your screen should look similar to this:

    ﻿Microsoft Windows [Version 6.3.9600]
    (c) 2013 Microsoft Corporation. All rights reserved.

    C:\Users\IEUser>ruby file_name.rb

### Mac

On Mac, the application is called `Terminal.app` and you can find it in `/Applications/Utilities` folder.

![`Terminal.app` in *Finder*](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_mac_finder.png)

C> *`Terminal.app` in Finder*

![*Terminal* app on Mac](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_mac_terminal.png)

C> *Terminal* app on Mac

A quick way to open it is by using built in *Spotlight* search. Press *cmd + space* or click magnifying icon and *Spotlight* will open.

![Spotlight](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_mac_spotlight.png)

C> *Spotlight*

Start typing `terminal` and you should see *Terminal* in search results.

![*Terminal* app in *Spotlight*](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_mac_spotlight_terminal.png)

C> *Terminal app in Spotlight*

I could not find a keyboard shortcut to open *Terminal*.

When you open *Terminal*, text similar to this will be displayed:

    Last login: Thu Feb 27 16:11:16 on ttys002
    imac:~ z$

You can ignore the first line. The second line, contains several things. `imac` is machine name, `~` is the folder where *Terminal* commands will be executed (path). `~` is shortcut for `/Users/z`. `z` is the name of the current user. The last character, `$`, separates path from the text that you will enter. If an instruction in the book says you should run a Ruby file with this command:

    $ ruby file_name.rb

Your screen should look similar to this:

    Last login: Thu Feb 27 16:11:16 on ttys002
    imac:~ z$ ruby file_name.rb

### Ubuntu Linux

On Ubuntu Linux, the application is called *GNOME Terminal*. You can open it with keyboard shortcut *Ctrl + Alt + T*.

![*Terminal* app on Ubuntu Linux](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_ubuntu_terminal.png)

C> *Terminal app on Ubuntu Linux*

Alternatively, search for *terminal* and you should find it.

![*Terminal* app in Ubuntu search](https://raw.github.com/watir/watirbook/master/images/main/tools_cli_ubuntu_search_terminal.png)

C> *Terminal app in Ubuntu search*

When you open *Terminal*, text similar to this will be displayed:

    ﻿z@ubuntu1310:~$

Text contains several things. `z` is the name of the current user, `ubuntu1310` is machine name, `~` is the folder where *Terminal* commands will be executed (path). It is shortcut for `/home/z`. (Again, `z` is user name of the current user.) The last character, `$`, separates path from the text that you will enter. If an instruction in the book says you should run a Ruby file with this command:

    $ ruby file_name.rb

Your screen should look similar to this:

    z@ubuntu1310:~$ ruby file_name.rb
