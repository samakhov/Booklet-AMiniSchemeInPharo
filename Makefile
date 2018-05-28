.pillar:
	git clone https://github.com/pillar-markup/pillar.git .pillar -b dev-7
	cd .pillar && ./scripts/build.sh && cd ..

build:	.pillar
	.pillar/build/pillar build html

deploy:	build
	./scripts/prepare_for_deploy.sh
	# Added HEAD as suggested in https://stackoverflow.com/questions/4181861/src-refspec-master-does-not-match-any-when-pushing-commits-in-git
	cd _result/html && git push -f origin HEAD:gh-pages


clonedeploy:
	rm -rf _result
	git clone -b master `git config --get remote.origin.url` _result


clean:
	rm -rf _result
