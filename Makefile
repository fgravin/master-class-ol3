

.PHONY: slides
slides: slides/index.html
	cd slides && ./node_modules/.bin/grunt jade copy

.PHONY: exercices
exercices: exercices/*.rst
	cd exercices && make clean html latexpdf

.PHONY: gh-pages
gh-pages: .gh-pages
	(cd .gh-pages && \
	 git checkout gh-pages && \
	 git fetch origin && \
	 git  merge --ff-only origin/gh-pages && \
	 mkdir -p exercices && \
	 mkdir -p slides && \
	 cp -r ../exercices/_build/html/* exercices && \
	 cp ../exercices/_build/latex/MasterClassOL3.pdf exercices/exercices.pdf && \
	 cp -r ../slides/.grunt/self/* slides && \
	 git add --all . && \
	 git commit -m 'Update' && \
	 git push origin gh-pages)

.gh-pages:
	git clone --branch gh-pages git@github.com:elemoine/master-class-ol3.git .gh-pages

