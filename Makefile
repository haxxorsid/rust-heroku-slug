default:

prepare:
	$(MAKE) -f utils/node.mk
	$(MAKE) -f utils/rust.mk

slug.tgz: prepare
	tar czfv slug.tgz ./app

publish: slug.tgz
	$(MAKE) -f utils/pub.mk

clean:
	rm -rf app/node app/rust app/misc
	rm -rf slug.tgz
	rm -rf downloads

.PHONY: default prepare publish clean
