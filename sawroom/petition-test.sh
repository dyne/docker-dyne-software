#!/usr/bin/env zsh

mkdir -p latest && cp -v *.zen latest/ && pushd latest
/project/zenroom/test/zencode_coconut/run_coconut_example.sh zenroom \
	&& /project/zenroom/test/zencode_coconut/run_petition_example.sh zenroom \
		   cat * | sha256sum - > /project/latest.sha256 \
	&& echo "PETITON CYCLE COMPLETED" \
	&& cat /project/latest.sha256 \
	&& cat /project/alice.sha256 \
	&& cat /project/bob.sha256
