#!/bin/bash

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:221724635492:awsnotify --message "{$0}"