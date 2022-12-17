#!bin/bash

touch ./_posts/$(date '+%Y-%m-%d')-$1.markdown

printf -- "---
layout: post
title: \"$1\"
categories: $2
---
" >> ./_posts/$(date '+%Y-%m-%d')-$1.markdown
