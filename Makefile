.pillar:
	git clone https://github.com/pillar-markup/pillar.git .pillar -b dev-7
	cd .pillar && ./scripts/build.sh && cd ..

build: .pillar
	.pillar/build/pillar build html

deploy: build
	./scripts/prepare_for_deploy.sh
	cd _result && git push -f origin gh-pages


clonedeploy:
	rm -rf _result
	git clone -b master `git config --get remote.origin.url` _result


clean:
	rm -rf _result
