#!/bin/bash

git filter-branch --commit-filter '
    if [ "$GIT_AUTHOR_NAME" = "arana0" ];
    then
        GIT_AUTHOR_NAME="arana0";
        GIT_AUTHOR_EMAIL="hoge@gmail.com";
        git commit-tree "$@";
    else
        git commit-tree "$@";
    fi' HEAD
