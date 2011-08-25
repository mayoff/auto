

all: README.html

README.html: README.rst
	rst2html-2.7.py < $< > $@.new
	mv $@.new $@

README.rst: auto
	< $< sed '1,/^"""/d' | sed '/^"""/,$$d' > $@.new
	mv $@.new $@

