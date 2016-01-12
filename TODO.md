http://productivityist.com/1password-emergency-kit-3/
http://make8bitart.com/
Incredible! http://www.pgbovine.net/command-line-bullshittery.htm
Date Night: http://www.cwhl.ca/view/cwhlalberta
Subscribe: https://www.youtube.com/watch?v=-woNlmVcdjc

http://www.bash.academy/
http://chriskottom.com/minitestcookbook/

#### Reading
http://techblog.netflix.com/2015/08/netflix-at-velocity-2015-linux.html
http://cb.vu/unixtoolbox.xhtml
http://everydayrails.com/2015/07/29/deep-cloning.html
http://nerds.airbnb.com/developer-infrastructure-with-airbnb-and-bundler/
https://brandur.org/alerting
http://www.openioc.org/
http://www.rowetel.com/blog/?p=4316
-> http://www.mostgoodyoucando.com/
-> http://www.amazon.com/Doing-Good-Better-Effective-Difference/dp/1592409105
Working with Unix processes -> Jessie stormer

#### System

- **Home System**
  * Research ESPP
- **Work System**
  * Daily rolling bash history files

#### Learning

- ServerSideEvents (SSE) do a POC
  - http://stackoverflow.com/questions/5227431/html5-server-sent-events-with-ruby-sinatra
- ssh
  - ifcfg-eth0:
    - /etc/sysconfig/network-scripts/ifcfg-eth0
    - /etc/init.d/network
- How does rbenv work?!
  - Talk to Tim
- Building a bash shell in ruby
- gdb
- Elevator simulator: https://github.com/mshang/python-elevator-challenge/blob/master/README.md
  - Visual: http://play.elevatorsaga.com/

#### Projects

- microcorruption.com
- SQL for Rails Developers

#### Blog
  - Brakeman against: http://www.codetriage.com/
  - Safe file access in Ruby
    - http://brakemanscanner.org/docs/warning_types/file_access/index.html
    - http://www.codeprovidence.com/category/file-access/
      -- Example given in File.access is super wrong!
  - Create an RSpec cheatsheet ala:
    - http://cheatrags.com/rspec-matchers
    - http://stackoverflow.com/a/13939599/33226
    - https://github.com/rspec/rspec-rails
    - `match_array` https://relishapp.com/rspec/rspec-rails/docs/matchers/activerecord-relation-match-array
  - Testing memoization
    - http://stackoverflow.com/questions/7367000/testing-memoization
  - Fixing Brakeman syscall vulnerabilities
- !!! https://apphub.io/
  - https://github.com/reactjs/react-rails
  - https://code.facebook.com/posts/1189117404435352/

- Opinion
    https://flex.amazon.com/ && Uber have spawned a new type of "worker" -- the casual worker. This is the person
    that works for varied wages (in the case of uber X, in the case of amazon flex $18/hr-$25/hr).

    Taking into account costs to employee, lack of benefits, etc.

    Normally things like sweatshops have been arms length, IE you don't know about it unless your or someone
    else goes digging for the information. Now that type of labour practice is starting to surface in North America.

    Inherently not a good thing.

#### Games

- Space Chem
- http://www.ftlgame.com/
- http://www.zachtronics.com/tis-100/
- http://www.bigpharmagame.com/
- Replay prison architect

#### CrossFit

- http://crossfitseattle.com/wp-content/uploads/2011/04/Skill-Levels-1-IV-spreadsheet.pdf
- http://jumpnrope.com/extras/100club/

----

### Misc Work??

In the meantime any knowledge of Chef you can muster between now and your start date will be helpful. We using Chef 11 in our product, which is something to keep in mind.   The operating system on the PrivateCloud appliance is CentOS 6.5 (moving to 6.6) so the RedHat manuals will be useful in getting familiar with the OS:
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/

I suggest you mainly concentrate on the installation and deployment guides but if you find other topics interesting to explore feel free :)
We also have a number of admin and help utilities written in bash so a read-through the bash advanced scripting guide will be helpful too.
http://www.tldp.org/LDP/abs/html/

If you are interested in learning more details about the Linux operating system I find the book “Linux Programming Interface”, a book I own, to be a very good choice:
http://www.amazon.ca/Linux-Programming-Interface-System-Handbook/dp/1593272200/ref=sr_1_1?ie=UTF8&qid=1435698367&sr=8-1&keywords=linux+programming+interface

https://github.com/jlevy/the-art-of-command-line#basics
http://blog.atom.io/2015/06/16/optimizing-an-important-atom-primitive.html
https://github.com/eventmachine/eventmachine
https://dl.dropboxusercontent.com/u/1681973/threaded_awesome_small.pdf
http://man7.org/linux/man-pages/index.html
http://unicorn.bogomips.org/SIGNALS.html
http://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_chapter/libc_24.html
http://www.jstorimer.com/blogs/workingwithcode/8085491-nobody-understands-the-gil
http://www.jstorimer.com/
http://www.jstorimer.com/pages/books?utm_source=blog&utm_medium=index&utm_campaign=my-books
http://www.faqs.org/docs/artu/
http://man7.org/tlpi/
http://aosabook.org/en/index.html
https://github.com/defunkt/unicorn/blob/master/lib/unicorn/http_server.rb#L84
http://www.jstorimer.com/blogs/workingwithcode/7766109-11-resources-for-learning-unix-programming
http://www.mokhan.ca/unix/school/2013/08/13/unix-fu.html
https://github.com/mokhan/mobot/tree/master/lib/mobot

http://www.jstorimer.com/blogs/workingwithcode/7766107-a-unix-shell-in-ruby
http://www.amazon.ca/Working-With-Processes-Jesse-Storimer-ebook/dp/B0078VSRUE
http://www.amazon.ca/Working-With-Sockets-Jesse-Storimer-ebook/dp/B00BPYT6PK
http://www.mokhan.ca/unix/school/2013/08/13/unix-fu.html
https://sysadmincasts.com/episodes/2-rpm-changelog
http://unicorn.bogomips.org/PHILOSOPHY.html
http://unicorn.bogomips.org/SIGNALS.html
https://www.youtube.com/watch?v=tc4ROCJYbm0
https://www.coursera.org/course/startup
https://github.com/mokhan/mobot/tree/master/lib/mobot

Build a pre-forking web server that I can reverse proxy via nginx. I would like to interact with this service via a unix socket. i.e. it responds to this directive: https://github.com/stronglifters/rails-cookbook/blob/master/templates/default/nginx_unix.erb#L2

resolv.conf

man route - know how to send data to the correct interface. My
real-life example: I dual-home my laptop at work - ethernet for work
connection, wireless for personal.
I let DHCP do most the routing, then

sudo route -n add -host 108.61.158.38/32 192.168.26.2

To send my traffic to my server (108.61.158.38) on the interface that
has the gateway 192.168.26.2
