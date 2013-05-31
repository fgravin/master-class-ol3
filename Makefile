
.PHONY: gh-pages
gh-pages:
	rm -rf /tmp/master-class-ol3
	git clone --branch gh-pages git@github.com:elemoine/master-class-ol3.git /tmp/master-class-ol3
	mkdir -p /tmp/master-class-ol3/exercices
	mkdir -p /tmp/master-class-ol3/slides
	cp -r exercices/_build/html/* /tmp/master-class-ol3/exercices/
	cd /tmp/master-class-ol3
	git add --all .
	git commit -m 'Updated'
	git push origin gh-pages
