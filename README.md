Play framework 2 computer-database sample application with mysql
============================

This project just takes the computer-database sample project and modifies it to work with mysql database.

It's main purpouse is to demonstrate how to deploy a play framework 2 application on openshift.

To get up and running with openshift, check this quickstart: https://github.com/opensas/play2-openshift-quickstart

These are the steps you have to follow to deploy this app on openshift:

A step by step example: deploying computer-database sample app to openshift
-------------------------

Create the computerdb application on openshift, with mysql and phpadmin support.

```bash

    rhc app create -a computerdb -t diy-0.1

    rhc app cartridge add -a computerdb -c mysql-5.1
    rhc app cartridge add -a computerdb -c phpmyadmin-3.4
```

Add upstream repo

```
    cd computerdb
    git remote add upstream https://github.com/opensas/computer-database-mysql.git
    git pull -s recursive -X theirs upstream master
```

Run the stage task, add your changes to git's index, commit and push the repo to openshift (you can also just run the *openshift_deploy* script):

    play clean compile stage
    git add .
    git commit -m "deploying computerdb application with mysql support"
    git push

That's it, you can now see computerdb demo application running at:

    http://computerdb-yournamespace.rhcloud.com

Licence
----------------------------
This project is distributed under [Apache 2 licence](http://www.apache.org/licenses/LICENSE-2.0.html). 