#!/bin/bash

if [[ -d /tmp/master-class-ol3 ]]; then
    git clone --branch gh-pages git@github.com:elemoine/master-class-ol3.git /tmp/master-class-ol3
else
    (cd /tmp/master-class-ol3; git checkout gh-pages; git fetch origin; git merge --ff-only origin/gh-pages)
fi

mkdir -p /tmp/master-class-ol3/exercices
mkdir -p /tmp/master-class-ol3/slides

cp -r exercices/_build/html/* /tmp/master-class-ol3/exercices/
cp -r slides/.grunt/self/* /tmp/master-class-ol3/slides

cd /tmp/master-class-ol3
git add --all .
git commit -m 'Updated'
git push origin gh-pages
